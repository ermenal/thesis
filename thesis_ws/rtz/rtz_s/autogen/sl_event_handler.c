#include "sl_event_handler.h"

#include "sl_board_init.h"
#include "sl_clock_manager.h"
#include "sl_clock_manager_init.h"
#include "sl_hfxo_manager.h"
#include "sl_rail_util_dma.h"
#include "pa_conversions_efr32.h"
#include "sl_rail_util_power_manager_init.h"
#include "sl_rail_util_pti.h"
#include "sl_rail_util_rssi.h"
#include "sl_rail_util_init.h"
#include "btl_interface.h"
#include "sl_board_control.h"
#include "sl_debug_swo.h"
#include "sl_gpio.h"
#include "gpiointerrupt.h"
#include "sl_iostream_init_eusart_instances.h"
#include "sl_mbedtls.h"
#include "sl_simple_button_instances.h"
#include "sl_se_manager.h"
#include "sli_protocol_crypto.h"
#include "sl_iostream_init_instances.h"
#include "sl_cos.h"
#include "sl_iostream_handles.h"
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include "em_cmu.h"
#include "em_letimer.h"
#include "rail.h"
#include "sl_clock_manager.h"
#include "sl_rail_util_init.h"
#include "tz_secure_memory_autogen.h"
#include <stdio.h>


#define OTA_PREEMPT_PERIOD_SECONDS      (5u)
#define OTA_PREEMPT_PERIOD_US           (OTA_PREEMPT_PERIOD_SECONDS * 1000000u)
#define OTA_QUERY_TIMEOUT_US            (300000u)

typedef void (*nsfunc_t)(void) __attribute__((cmse_nonsecure_call));

static uint32_t ota_preempt_ticks = 0;
static uint32_t ota_next_preempt_deadline_us = 0u;
static bool secure_runtime_initialized = false;

static RAIL_Handle_t secure_rail_handle = NULL;

static void secure_delegate_peripherals_to_ns(void);
static void secure_reclaim_peripherals(void);
static void secure_init_preempt_timer(void);
static void secure_handle_preemption_window(void);
static void secure_runtime_init_once(void);
static void secure_set_radio_irq_target(bool to_nonsecure);
static void secure_rearm_preempt_timer(void);

void sli_driver_permanent_allocation(void)
{
}

void sli_service_permanent_allocation(void)
{
}

void sli_stack_permanent_allocation(void)
{
}

void sli_internal_permanent_allocation(void)
{
}

void sl_platform_init(void)
{
  sl_board_preinit();
  sl_clock_manager_init();
  sl_clock_manager_runtime_init();
  sl_hfxo_manager_init_hardware();
  sl_board_init();
}

void sli_internal_init_early(void)
{
}

void sl_driver_init(void)
{
  sl_debug_swo_init();
  sl_gpio_init();
  GPIOINT_Init();
  sl_simple_button_init_instances();
  sl_cos_send_config();
}

void sl_service_init(void)
{
  sl_board_configure_vcom();
  sl_hfxo_manager_init();
  sl_mbedtls_init();
  sl_se_init();
  sli_protocol_crypto_init();
  sli_aes_seed_mask();
  sl_iostream_init_instances_stage_1();
  sl_iostream_init_instances_stage_2();
}

void sl_stack_init(void)
{
  sl_rail_util_dma_init();
  sl_rail_util_pa_init();
  sl_rail_util_pti_init();
  sl_rail_util_rssi_init();
  CMU_OscillatorEnable(cmuOsc_HFXO, true, true);
  
  sl_rail_util_init();
  sl_rail_util_power_manager_init();
}

void sl_internal_app_init(void)
{
}

void sli_platform_process_action(void)
{
}

void sli_service_process_action(void)
{
}

void sli_stack_process_action(void)
{
}

void sli_internal_app_process_action(void)
{
}

void start_ns_app(void)
{
  const uint32_t ns_flash_base = TZ_S_FLASH_END;
  secure_reclaim_peripherals();
  secure_runtime_init_once();
  secure_rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST);

  secure_init_preempt_timer();
  secure_delegate_peripherals_to_ns();

  __TZ_set_MSP_NS(*((uint32_t *)ns_flash_base));
  __TZ_set_PSP_NS(*((uint32_t *)ns_flash_base));

  SCB_NS->VTOR = ns_flash_base;

  volatile uint32_t *fp_location =
    (uint32_t *)(ns_flash_base + 4UL);
  nsfunc_t fp = (nsfunc_t)(*fp_location);

  extern uint32_t __STACK_SEAL;
  __set_MSP((uint32_t)&__STACK_SEAL);

  fp();
}

static void secure_runtime_init_once(void)
{
  if (secure_runtime_initialized) {
    return;
  }

  secure_reclaim_peripherals();
  sl_platform_init();
  sl_driver_init();
  sl_service_init();
  CMU_OscillatorEnable(cmuOsc_HFXO, true, true);

  sl_stack_init();

  secure_runtime_initialized = true;
}

// Preempt timer ISR, clear irq & restart for next window
void LETIMER0_IRQHandler(void)
{
  uint32_t irq_flags = LETIMER_IntGet(LETIMER0);
  uint32_t now_us;

  if ((irq_flags & LETIMER_IF_UF) == 0u) {
    LETIMER_IntClear(LETIMER0, irq_flags);
    return;
  }

  LETIMER_IntDisable(LETIMER0, LETIMER_IF_UF);
  LETIMER_Enable(LETIMER0, false);
  LETIMER_IntClear(LETIMER0, _LETIMER_IF_MASK);

  now_us = RAIL_GetTime();
  if ((int32_t)(now_us - ota_next_preempt_deadline_us) < 0) {
    secure_rearm_preempt_timer();
    return;
  }

  do {
    ota_next_preempt_deadline_us += OTA_PREEMPT_PERIOD_US;
  } while ((int32_t)(now_us - ota_next_preempt_deadline_us) >= 0);

  secure_handle_preemption_window();
  secure_rearm_preempt_timer();
}

void sl_rail_util_on_event(RAIL_Handle_t rail_handle,
                           RAIL_Events_t events)
{
  
}

// Free peripherals back to NS world
static void secure_delegate_peripherals_to_ns(void)
{
secure_set_radio_irq_target(true);
CMU->CLKEN1_SET = CMU_CLKEN1_SMU;
SMU->LOCK = SMU_LOCK_SMULOCKKEY_UNLOCK;
#if defined(SMU_BMPUSATD0_RADIOAES)
  SMU->BMPUSATD0_CLR = SMU_BMPUSATD0_RADIOAES;
#endif
#if defined(SMU_BMPUSATD0_RADIOSUBSYSTEM)
  SMU->BMPUSATD0_CLR = SMU_BMPUSATD0_RADIOSUBSYSTEM;
#endif
#if defined(SMU_BMPUSATD0_RFECA0)
  SMU->BMPUSATD0_CLR = SMU_BMPUSATD0_RFECA0;
#endif
#if defined(SMU_BMPUSATD0_RFECA1)
  SMU->BMPUSATD0_CLR = SMU_BMPUSATD0_RFECA1;
#endif
#if defined(SMU_BMPUSATD0_LDMA)
  SMU->BMPUSATD0_CLR = SMU_BMPUSATD0_LDMA;
#endif
#if defined(SMU_PPUSATD1_AHBRADIO)
  SMU->PPUSATD1_CLR = SMU_PPUSATD1_AHBRADIO;
#endif
#if defined(SMU_PPUSATD1_RADIOAES)
  SMU->PPUSATD1_CLR = SMU_PPUSATD1_RADIOAES;
#endif
#if defined (SMU_PPUSATD1_HFXO0)
  SMU->PPUSATD1_CLR = SMU_PPUSATD1_HFXO0;
#endif
#if defined(SMU_PPUSATD1_EUSART0)
  SMU->PPUSATD1_CLR = SMU_PPUSATD1_EUSART0;
#endif
#if defined (SMU_PPUSATD0_EMU)
  SMU->PPUSATD0_CLR = SMU_PPUSATD0_EMU;
#endif
#if defined(SMU_PPUSATD0_LDMA)
  SMU->PPUSATD0_CLR = SMU_PPUSATD0_LDMA;
#endif
#if defined(SMU_PPUSATD0_LDMAXBAR)
  SMU->PPUSATD0_CLR = SMU_PPUSATD0_LDMAXBAR;
#endif
#if defined(SMU_PPUSATD0_GPIO)
  SMU->PPUSATD0_CLR = SMU_PPUSATD0_GPIO;
#endif
SMU->LOCK = 0;
CMU->CLKEN1_CLR = CMU_CLKEN1_SMU;
}

// Claim peripherals back to SW
static void secure_reclaim_peripherals(void)
{
secure_set_radio_irq_target(false);
CMU->CLKEN1_SET = CMU_CLKEN1_SMU;
SMU->LOCK = SMU_LOCK_SMULOCKKEY_UNLOCK;

#if defined(SMU_BMPUSATD0_RADIOAES)
SMU->BMPUSATD0_SET = SMU_BMPUSATD0_RADIOAES;
#endif
#if defined(SMU_BMPUSATD0_RADIOSUBSYSTEM)
SMU->BMPUSATD0_SET = SMU_BMPUSATD0_RADIOSUBSYSTEM;
#endif
#if defined(SMU_BMPUSATD0_RFECA0)
SMU->BMPUSATD0_SET = SMU_BMPUSATD0_RFECA0;
#endif
#if defined(SMU_BMPUSATD0_RFECA1)
SMU->BMPUSATD0_SET = SMU_BMPUSATD0_RFECA1;
#endif
#if defined(SMU_BMPUSATD0_LDMA)
SMU->BMPUSATD0_SET = SMU_BMPUSATD0_LDMA;
#endif
#if defined(SMU_BMPUSATD0_LDMA0)
SMU->BMPUSATD0_SET = SMU_BMPUSATD0_LDMA0;
#endif
#if defined(SMU_BMPUSATD0_LDMA1)
SMU->BMPUSATD0_SET = SMU_BMPUSATD0_LDMA1;
#endif

#if defined(SMU_PPUSATD0_GPIO)
SMU->PPUSATD0_SET = SMU_PPUSATD0_GPIO;
#endif
#if defined(SMU_PPUSATD0_LDMA)
SMU->PPUSATD0_SET = SMU_PPUSATD0_LDMA;
#endif
#if defined(SMU_PPUSATD0_LDMAXBAR)
SMU->PPUSATD0_SET = SMU_PPUSATD0_LDMAXBAR;
#endif
#if defined (SMU_PPUSATD0_EMU)
SMU->PPUSATD0_SET = SMU_PPUSATD0_EMU;
#endif

#if defined(SMU_PPUSATD1_EUSART0)
SMU->PPUSATD1_SET = SMU_PPUSATD1_EUSART0;
#endif
#if defined(SMU_PPUSATD1_AHBRADIO)
SMU->PPUSATD1_SET = SMU_PPUSATD1_AHBRADIO;
#endif
#if defined(SMU_PPUSATD1_RADIOAES)
SMU->PPUSATD1_SET = SMU_PPUSATD1_RADIOAES;
#endif
#if defined (SMU_PPUSATD1_HFXO0)
SMU->PPUSATD1_SET = SMU_PPUSATD1_HFXO0;
#endif
#if defined(SMU_PPUSATD1_LETIMER0)
SMU->PPUSATD1_SET = SMU_PPUSATD1_LETIMER0;
#endif

SMU->LOCK = 0;  
CMU->CLKEN1_CLR = CMU_CLKEN1_SMU;
}

// Target radio IRQs to NS or S for peripiheral sharing
static void secure_set_radio_irq_target(bool to_nonsecure)
{
  if (to_nonsecure) {
    NVIC_SetTargetState(LDMA_IRQn);
  } else {
    NVIC_ClearTargetState(LDMA_IRQn);
  }
  if (to_nonsecure) {
    NVIC_SetTargetState(AGC_IRQn);
  } else {
    NVIC_ClearTargetState(AGC_IRQn);
  }
  if (to_nonsecure) {
    NVIC_SetTargetState(BUFC_IRQn);
  } else {
    NVIC_ClearTargetState(BUFC_IRQn);
  }
  if (to_nonsecure) {
    NVIC_SetTargetState(FRC_PRI_IRQn);
  } else {
    NVIC_ClearTargetState(FRC_PRI_IRQn);
  }
  if (to_nonsecure) {
    NVIC_SetTargetState(FRC_IRQn);
  } else {
    NVIC_ClearTargetState(FRC_IRQn);
  }
  if (to_nonsecure) {
    NVIC_SetTargetState(MODEM_IRQn);
  } else {
    NVIC_ClearTargetState(MODEM_IRQn);
  }
  if (to_nonsecure) {
    NVIC_SetTargetState(PROTIMER_IRQn);
  } else {
    NVIC_ClearTargetState(PROTIMER_IRQn);
  }
  if (to_nonsecure) {
    NVIC_SetTargetState(RAC_RSM_IRQn);
  } else {
    NVIC_ClearTargetState(RAC_RSM_IRQn);
  }
  if (to_nonsecure) {
    NVIC_SetTargetState(RAC_SEQ_IRQn);
  } else {
    NVIC_ClearTargetState(RAC_SEQ_IRQn);
  }
  if (to_nonsecure) {
    NVIC_SetTargetState(SYNTH_IRQn);
  } else {
    NVIC_ClearTargetState(SYNTH_IRQn);
  }
  if (to_nonsecure) {
    NVIC_SetTargetState(RFECA0_IRQn);
  } else {
    NVIC_ClearTargetState(RFECA0_IRQn);
  }
  if (to_nonsecure) {
    NVIC_SetTargetState(RFECA1_IRQn);
  } else {
    NVIC_ClearTargetState(RFECA1_IRQn);
  }
}

// Start preempt timer at init
static void secure_init_preempt_timer(void)
{
  LETIMER_Init_TypeDef letimer_init = LETIMER_INIT_DEFAULT;
  uint32_t letimer_clock_hz;
  uint32_t letimer_divider = 1u;
  uint32_t top;
  uint64_t desired_ticks;

  (void)sl_clock_manager_enable_bus_clock(SL_BUS_CLOCK_LETIMER0);
  letimer_clock_hz = CMU_ClockFreqGet(cmuClock_LETIMER0);

  if (letimer_clock_hz == 0u) {
    letimer_clock_hz = 1000u;
  }

  desired_ticks = ((uint64_t)letimer_clock_hz) * OTA_PREEMPT_PERIOD_SECONDS;
  while ((desired_ticks > 0x0000FFFFu) && (letimer_divider < 32768u)) {
    letimer_divider <<= 1;
    CMU_ClockDivSet(cmuClock_LETIMER0, letimer_divider);
    letimer_clock_hz = CMU_ClockFreqGet(cmuClock_LETIMER0);
    if (letimer_clock_hz == 0u) {
      letimer_clock_hz = 1000u;
    }
    desired_ticks = ((uint64_t)letimer_clock_hz) * OTA_PREEMPT_PERIOD_SECONDS;
  }

  if (desired_ticks > 0x0000FFFFu) {
    desired_ticks = 0x0000FFFFu;
  }

  ota_preempt_ticks = (uint32_t)desired_ticks;
  top = ota_preempt_ticks;
  if (top == 0u) {
    top = 1u;
  }

  letimer_init.enable = false;
  letimer_init.comp0Top = true;
  LETIMER_Init(LETIMER0, &letimer_init);
  LETIMER_CompareSet(LETIMER0, 0u, top);

  NVIC_ClearTargetState(LETIMER0_IRQn);
  NVIC_ClearPendingIRQ(LETIMER0_IRQn);
  NVIC_EnableIRQ(LETIMER0_IRQn);

  LETIMER_IntClear(LETIMER0, _LETIMER_IF_MASK);
  ota_next_preempt_deadline_us = RAIL_GetTime() + OTA_PREEMPT_PERIOD_US;
  secure_rearm_preempt_timer();
}

// Restart preempt timer for next window
static void secure_rearm_preempt_timer(void)
{
  LETIMER_IntDisable(LETIMER0, LETIMER_IF_UF);
  LETIMER_Enable(LETIMER0, false);
  LETIMER_IntClear(LETIMER0, _LETIMER_IF_MASK);
  LETIMER_CounterSet(LETIMER0, ota_preempt_ticks);
  LETIMER_IntEnable(LETIMER0, LETIMER_IF_UF);
  LETIMER_Enable(LETIMER0, true);
}

/*
* Handle the preemption window: 
* 1) Reclaim peripherals from NS
* 2) Query the update server for available updates (not implemented in this example)
* 3) Delegate peripherals back to NS
*/
static void secure_handle_preemption_window(void)
{
  secure_reclaim_peripherals();
  printf("SW start query ota update\n");

  // Get rail handle for inst0 
  secure_rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST);
  if ((secure_rail_handle == NULL) || (secure_rail_handle == RAIL_EFR32_HANDLE)) {
    secure_delegate_peripherals_to_ns();
    printf("SW bad rail handle\n");
    return;
  }

  // TODO: Query the update server to see if an update is available

  printf("SW end query ota update\n");
  secure_delegate_peripherals_to_ns();
}

void sl_iostream_init_instances_stage_1(void)
{
  sl_iostream_eusart_init_instances();
}

void sl_iostream_init_instances_stage_2(void)
{
  sl_iostream_set_console_instance();
}

