#include "sl_event_handler.h"

#include "sl_board_init.h"
#include "sl_clock_manager.h"
#include "sl_clock_manager_init.h"
#include "sl_hfxo_manager.h"
#include "sl_rail.h"
#include "sl_rail_types.h"
#include "sl_rail_util_dma.h"
#include "pa_conversions_efr32.h"
#include "sl_rail_util_power_manager_init.h"
#include "sl_rail_util_pti.h"
#include "sl_rail_util_rssi.h"
#include "sl_rail_util_init.h"
#include "rail_config.h"
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
#include "rail.h"
#include "sl_clock_manager.h"
#include "sl_rail_util_init.h"
#include "sl_sleeptimer.h"
#include "tz_secure_memory_autogen.h"
#include "em_eusart.h"
#include <string.h>
#include <stdio.h>


#define OTA_PREEMPT_PERIOD_SECONDS      (5u)
#define OTA_PREEMPT_PERIOD_MS           (OTA_PREEMPT_PERIOD_SECONDS * 1000u)
#define OTA_QUERY_TIMEOUT_US            (300000u)
#define SECURE_TX_CHANNEL               (0u)

typedef void (*nsfunc_t)(void) __attribute__((cmse_nonsecure_call));

static bool secure_runtime_initialized = false;
static bool secure_preempt_timer_active = false;
static bool secure_tx_fifo_configured = false;
static volatile bool secure_preempt_work_pending = false;

// TX FIFO dingen
#define TX_FIFO_SIZE 256

SL_ALIGN(RAIL_FIFO_ALIGNMENT)
static uint8_t tx_fifo[TX_FIFO_SIZE]
SL_ATTRIBUTE_ALIGN(RAIL_FIFO_ALIGNMENT);

// RX FIFO dingen 
#define RX_FIFO_SIZE 2048
static uint16_t rx_fifo_size = RX_FIFO_SIZE;

SL_ALIGN(RAIL_FIFO_ALIGNMENT)
static uint8_t rx_fifo[RX_FIFO_SIZE]
SL_ATTRIBUTE_ALIGN(RAIL_FIFO_ALIGNMENT);

#define PACKET_MAX_LENGTH 128
#define RX_PACKET_BUFFER_SIZE (PACKET_MAX_LENGTH * 2) // Extra voor appended info en RAIL metadata
SL_ALIGN(4)
static uint8_t secure_rx_buffer[RX_PACKET_BUFFER_SIZE]
SL_ATTRIBUTE_ALIGN(4);


static const uint8_t secure_probe_payload[] = "SW TX packet";
static sl_sleeptimer_timer_handle_t secure_preempt_timer;

static void secure_delegate_peripherals_to_ns(void);
static void secure_reclaim_peripherals(void);
static void secure_init_preempt_timer(void);
static void secure_handle_preemption_window(void);
static void secure_runtime_init_once(void);
static void secure_force_all_irqs_to_secure(void);
static void secure_clear_all_irqs_pending(void);
static void secure_set_irq_target(bool to_nonsecure);
static void secure_clear_irqs_pending(void);
static void secure_log_irq_targets(const char *tag);
static void secure_preempt_timer_callback(sl_sleeptimer_timer_handle_t *handle,
                                          void *data);
static void secure_route_irq_target(IRQn_Type irqn, bool to_nonsecure);
void secure_init_radio(void);

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
  sl_rail_status_t status;

  printf("SW init: stack begin\n");

  // TrustZone startup defaults almost all IRQs to NS; force all IRQs to S
  // before secure RAIL initialization to avoid NS vector fetch before VTOR_NS.
  secure_force_all_irqs_to_secure();
  secure_clear_all_irqs_pending();
  secure_set_irq_target(false);
  secure_clear_irqs_pending();
  secure_log_irq_targets("before sl_rail_tz init");

  status = sl_rail_tz_init_secure();
  status |= sl_rail_tz_enable_secure_radio_irqs();
  status |= sl_rail_tz_radio_clock_enable();
  status |= sl_rail_tz_rfeca_clock_enable();
  status |= sl_rail_tz_configure_hfxo();
  // status |= sl_rail_tz_check_peripherals_secure_states();
  printf("Status: 0x%lx\n", (unsigned long)status);
  secure_log_irq_targets("after sl_rail_tz init");

  printf("SW init: sl_rail_util_dma_init\n");
  sl_rail_util_dma_init();
  printf("SW init: sl_rail_util_pa_init\n");
  sl_rail_util_pa_init();
  // CMU_OscillatorEnable(cmuOsc_HFXO, true, true);
  printf("SW init: sl_rail_util_init enter\n");
  sl_rail_util_init();
  printf("SW init: sl_rail_util_init ok\n");
  // sl_rail_util_power_manager_init();
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
  printf("SW init: reclaim peripherals\n");
  secure_reclaim_peripherals();
  
  printf("SW init: runtime init\n");
  secure_runtime_init_once();
  printf("SW init: radio init\n");
  secure_init_radio();
  printf("SW init: preempt timer init\n");
  secure_init_preempt_timer();
  
  printf("SW init: delegate peripherals to NS\n");
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

  printf("SW init: platform\n");

  sl_platform_init();
  printf("SW init: driver\n");
  sl_driver_init();
  printf("SW init: service\n");
  sl_service_init();
  // CMU_OscillatorEnable(cmuOsc_HFXO, true, true);
  sl_stack_init();

  secure_runtime_initialized = true;
}

void secure_init_radio(void)
{
  RAIL_Handle_t rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST);

  uint16_t size = RAIL_SetTxFifo(rail_handle, tx_fifo, 0, TX_FIFO_SIZE);
  if (size == 0) {
    printf("SW failed to set TX FIFO\n");
    while(1);
  } else {
    // printf("TX FIFO set, size: %u\n", size);
  }

  RAIL_Status_t status = RAIL_ConfigEvents(rail_handle,
                                           RAIL_EVENTS_ALL,
                                           RAIL_EVENTS_TX_COMPLETION
                                           | RAIL_EVENTS_RX_COMPLETION
                                           | RAIL_EVENT_CAL_NEEDED);
  if (status != RAIL_STATUS_NO_ERROR) {
    printf("SW RAIL_ConfigEvents failed: %lu\n", (unsigned long)status);
    while(1);
  } else {
    // printf("Config events worked\n");
  }

  status = RAIL_SetRxFifo(rail_handle, rx_fifo, &rx_fifo_size);
  if (status != RAIL_STATUS_NO_ERROR) {
    printf("SW RAIL_SetRxFifo failed: %lu\n", (unsigned long)status);
    while(1);
  } else {
    // printf("Set RX FIFO worked\n");
  }
  const RAIL_ChannelConfig_t *mijnConfig = channelConfigs[0];
  status = RAIL_StartRx(rail_handle,
                        mijnConfig->configs->channelNumberStart,
                        NULL);
  if (status != RAIL_STATUS_NO_ERROR) {
    printf("SW RAIL_StartRx failed: %lu\n", (unsigned long)status);
    while(1);
  }
}


void sl_rail_util_on_event(RAIL_Handle_t rail_handle,
                           RAIL_Events_t events)
{
  (void)rail_handle;

  if (events & RAIL_EVENTS_TX_COMPLETION) {
    // printf("EVENT: TX completed\n");
  }
  else if (events & RAIL_EVENT_RX_PACKET_RECEIVED) {
    // Download packet if targeted at SW (ota packet)...
    printf("SW event: RX packet received\n");
  }
  else if (events & RAIL_EVENT_CAL_NEEDED) {
    // printf("EVENT: Calibration needed\n");
    RAIL_Status_t status = RAIL_Calibrate(rail_handle, NULL, RAIL_CAL_ALL_PENDING);
    if (status != RAIL_STATUS_NO_ERROR) {
      printf("SW RAIL_Calibrate failed. Status: 0x%lx\n", (unsigned long)status);
      while(1) {};
    }
  }
  else {
    // printf("SW rail events: 0x%016llX\n", (unsigned long long)events);
  }
}

// Free peripherals back to NS world
static void secure_delegate_peripherals_to_ns(void)
{
secure_set_irq_target(true);
secure_clear_irqs_pending();

CMU->CLKEN1_SET = CMU_CLKEN1_SMU;
SMU->LOCK = SMU_LOCK_SMULOCKKEY_UNLOCK;

SMU->PPUSATD0_CLR = SMU_PPUSATD0_EMU;
SMU->PPUSATD0_CLR = SMU_PPUSATD0_LDMA;
SMU->PPUSATD0_CLR = SMU_PPUSATD0_LDMAXBAR;
SMU->PPUSATD0_CLR = SMU_PPUSATD0_GPIO;

SMU->PPUSATD1_CLR = SMU_PPUSATD1_EUSART0;
SMU->PPUSATD1_CLR = SMU_PPUSATD1_AHBRADIO;
SMU->PPUSATD1_CLR = SMU_PPUSATD1_RADIOAES;
SMU->PPUSATD1_CLR = SMU_PPUSATD1_HFXO0;

SMU->BMPUSATD0_CLR = SMU_BMPUSATD0_RADIOAES;
SMU->BMPUSATD0_CLR = SMU_BMPUSATD0_RADIOSUBSYSTEM;
SMU->BMPUSATD0_CLR = SMU_BMPUSATD0_RFECA0;
SMU->BMPUSATD0_CLR = SMU_BMPUSATD0_RFECA1;
SMU->BMPUSATD0_CLR = SMU_BMPUSATD0_LDMA;

SMU->LOCK = 0;
CMU->CLKEN1_CLR = CMU_CLKEN1_SMU;
}

// Claim peripherals back to SW
static void secure_reclaim_peripherals(void)
{
secure_set_irq_target(false);
secure_clear_irqs_pending();

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
#if defined(SMU_PPUSATD1_SYSRTC)
SMU->PPUSATD1_SET = SMU_PPUSATD1_SYSRTC;
#endif



SMU->LOCK = 0;  
CMU->CLKEN1_CLR = CMU_CLKEN1_SMU;
}

#define NUM_IRQS_TO_SWITCH 15
const IRQn_Type irqs[NUM_IRQS_TO_SWITCH] = {
    FRC_PRI_IRQn, FRC_IRQn, MODEM_IRQn, RAC_SEQ_IRQn, RAC_RSM_IRQn,
    BUFC_IRQn, AGC_IRQn, PROTIMER_IRQn, SYNTH_IRQn,
    HOSTMAILBOX_IRQn, RFECA0_IRQn, RFECA1_IRQn, HFRCO0_IRQn, LDMA_IRQn, GPIO_ODD_IRQn
}; 
// Target radio IRQs to NS or S for peripiheral sharing
static void secure_set_irq_target(bool to_nonsecure)
{
  for (uint32_t i = 0; i < NUM_IRQS_TO_SWITCH; i++) {
    NVIC_ClearPendingIRQ(irqs[i]);
    secure_route_irq_target(irqs[i], to_nonsecure);
  }
}

static void secure_force_all_irqs_to_secure(void)
{
  for (uint32_t i = 0; i < sizeof(NVIC->ITNS) / sizeof(NVIC->ITNS[0]); i++) {
    NVIC->ITNS[i] = 0u;
  }
}

static void secure_clear_all_irqs_pending(void)
{
  for (int32_t irqn = 0; irqn < (int32_t)EXT_IRQ_COUNT; irqn++) {
    NVIC_ClearPendingIRQ((IRQn_Type)irqn);
  }
}

static void secure_clear_irqs_pending(void)
{
  for (uint32_t i = 0; i < NUM_IRQS_TO_SWITCH; i++) {
    NVIC_ClearPendingIRQ(irqs[i]);
  }
}

static void secure_log_irq_targets(const char *tag)
{
  printf("SW irq targets (%s): LDMA=%lu FRC=%lu MODEM=%lu RAC_SEQ=%lu BUFC=%lu AGC=%lu PROTIMER=%lu SYNTH=%lu HOSTMAILBOX=%lu RFECA0=%lu RFECA1=%lu HFRCO0=%lu\n",
         tag,
         (unsigned long)NVIC_GetTargetState(LDMA_IRQn),
         (unsigned long)NVIC_GetTargetState(FRC_IRQn),
         (unsigned long)NVIC_GetTargetState(MODEM_IRQn),
         (unsigned long)NVIC_GetTargetState(RAC_SEQ_IRQn),
         (unsigned long)NVIC_GetTargetState(BUFC_IRQn),
         (unsigned long)NVIC_GetTargetState(AGC_IRQn),
         (unsigned long)NVIC_GetTargetState(PROTIMER_IRQn),
         (unsigned long)NVIC_GetTargetState(SYNTH_IRQn),
         (unsigned long)NVIC_GetTargetState(HOSTMAILBOX_IRQn),
         (unsigned long)NVIC_GetTargetState(RFECA0_IRQn),
         (unsigned long)NVIC_GetTargetState(RFECA1_IRQn),
         (unsigned long)NVIC_GetTargetState(HFRCO0_IRQn));
}

// Start secure preempt timer at init (SYSRTC-backed sleeptimer)
static void secure_init_preempt_timer(void)
{
  sl_status_t status;

  if (secure_preempt_timer_active) {
    return;
  }

  NVIC_ClearTargetState(SYSRTC_APP_IRQn);
  NVIC_ClearTargetState(SYSRTC_SEQ_IRQn);
  NVIC_ClearPendingIRQ(SYSRTC_APP_IRQn);
  NVIC_ClearPendingIRQ(SYSRTC_SEQ_IRQn);

  status = sl_sleeptimer_start_periodic_timer_ms(&secure_preempt_timer,
                                                 OTA_PREEMPT_PERIOD_MS,
                                                 secure_preempt_timer_callback,
                                                 NULL,
                                                 0u,
                                                 0u);
  if (status != SL_STATUS_OK) {
    printf("SW failed to start SYSRTC preempt timer: 0x%lx\n",
           (unsigned long)status);
    return;
  }

  secure_preempt_timer_active = true;
}

// On timer interrupt: execute SW preemption window in PendSV context
static void secure_preempt_timer_callback(sl_sleeptimer_timer_handle_t *handle,
                                          void *data)
{
  (void)handle;
  (void)data;
  secure_preempt_work_pending = true;
  SCB->ICSR = SCB_ICSR_PENDSVSET_Msk;
}

// Execute preemtpion window in PendSV context
// Idk of dit moet, denk niet dat het erg is om in SYSRTC ISR te doen 
void PendSV_Handler(void)
{
  if (!secure_preempt_work_pending) {
    return;
  }

  secure_preempt_work_pending = false;
  secure_handle_preemption_window();
}

// helper ... 
static void secure_route_irq_target(IRQn_Type irqn, bool to_nonsecure)
{
  if (to_nonsecure) {
    NVIC_SetTargetState(irqn);
  } else {
    NVIC_ClearTargetState(irqn);
  }
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
  printf("SW preempt: reclaim done\n");

  RAIL_Handle_t rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST);
  if ((rail_handle == NULL) || (rail_handle == RAIL_EFR32_HANDLE)) {
    printf("SW bad rail handle\n");
  } else {
    uint16_t bytes_written = RAIL_WriteTxFifo(rail_handle,
                                      secure_probe_payload,
                                      sizeof(secure_probe_payload),
                                      false);
    printf("SW bytes written to FIFO: %u\n", (unsigned int)bytes_written);
    RAIL_Status_t status = RAIL_StartTx(rail_handle,
                                        channelConfigs[0]->configs->channelNumberStart,
                                        RAIL_TX_OPTIONS_DEFAULT,
                                        NULL);
    printf("SW tx status: 0x%lx\n", (unsigned long)status);
  }

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

