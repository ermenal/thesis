#include "sl_event_handler.h"

#include "em_cmu.h"
#include "rail.h"
#include "rail_config.h"
#include "rail_types.h"
#include "sl_board_init.h"
#include "sl_clock_manager.h"
#include "sl_clock_manager_init.h"
#include "sl_hfxo_manager.h"
#include "sl_main_init.h"
#include "sl_mpu.h"
#include "sl_rail.h"
#include "sl_rail_util_dma.h"
#include "sl_rail_util_pa_conversions.h"
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
#include "tz_secure_memory_autogen.h"
#include "system_efr32fg23.h"
#include <stdio.h>

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
  sl_status_t cm_status;
  sl_board_preinit();
  cm_status = sl_clock_manager_runtime_init();
  // printf("sl_clock_manager_runtime_init: 0x%lx\n", (unsigned long)cm_status);
  if (cm_status != SL_STATUS_OK) {
    while (1) {
    }
  }
  cm_status = sl_clock_manager_init();
  // printf("sl_clock_manager_init: 0x%lx\n", (unsigned long)cm_status);
  if (cm_status != SL_STATUS_OK) {
    while (1) {
    }
  }
  sl_hfxo_manager_init_hardware();
  sl_board_init();
  // bootloader_init();
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
  status = sl_rail_tz_init_secure();
  // printf("sl_rail_tz_init_secure: 0x%lx\n", (unsigned long)status);
  if (status != SL_RAIL_STATUS_NO_ERROR) {
    while (1) {
    }
  }

  status = sl_rail_tz_enable_secure_radio_irqs();
  // printf("sl_rail_tz_enable_secure_radio_irqs: 0x%lx\n", (unsigned long)status);
  if (status != SL_RAIL_STATUS_NO_ERROR) {
    while (1) {
    }
  }

  status = sl_rail_tz_radio_clock_enable();
  // printf("sl_rail_tz_radio_clock_enable: 0x%lx\n", (unsigned long)status);
  if (status != SL_RAIL_STATUS_NO_ERROR) {
    while (1) {
    }
  }

  status = sl_rail_tz_rfeca_clock_enable();
  // printf("sl_rail_tz_rfeca_clock_enable: 0x%lx\n", (unsigned long)status);
  if (status != SL_RAIL_STATUS_NO_ERROR) {
    while (1) {
    }
  }

  status = sl_rail_tz_configure_hfxo();
  // printf("sl_rail_tz_configure_hfxo: 0x%lx\n", (unsigned long)status);
  if (status != SL_RAIL_STATUS_NO_ERROR) {
    while (1) {
    }
  }

  CMU->CLKEN1_SET = CMU_CLKEN1_SMU;
  SMU->LOCK = SMU_LOCK_SMULOCKKEY_UNLOCK;
  status = sl_rail_tz_check_peripherals_secure_states();
  // printf("sl_rail_tz_check_peripherals_secure_states: 0x%lx\n", (unsigned long)status);
  if (status != SL_RAIL_STATUS_NO_ERROR) {
    while (1) {
    }
  }
  SMU->LOCK = 0;
  CMU->CLKEN1_CLR = CMU_CLKEN1_SMU;

  // printf("SystemHFXOClockGet before RAIL init: %lu\n", (unsigned long)SystemHFXOClockGet());
  // printf("RADIO_CONFIG_XTAL_FREQUENCY: %lu\n", (unsigned long)RADIO_CONFIG_XTAL_FREQUENCY);

  sl_rail_util_dma_init();
  // sl_rail_util_power_manager_init();
  sl_rail_util_pa_init();
  sl_rail_util_init();

  // printf("SystemHFXOClockGet after RAIL init: %lu\n", (unsigned long)SystemHFXOClockGet());
  // printf("RADIO_CONFIG_XTAL_FREQUENCY: %lu\n", (unsigned long)RADIO_CONFIG_XTAL_FREQUENCY);
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

void sl_iostream_init_instances_stage_1(void)
{
  sl_iostream_eusart_init_instances();
}

void sl_iostream_init_instances_stage_2(void)
{
  sl_iostream_set_console_instance();
}

typedef void (*nsfunc_t)(void) __attribute__((cmse_nonsecure_call));

static void secure_runtime_init(void);
static void secure_delegate_peripherals_to_ns(void);
static void secure_reclaim_peripherals(void);
static void secure_init_radio(void);
static void transmit_packet(const char *payload);
static void secure_set_irqs_target(bool to_nonsecure);
static void secure_clear_irqs_pending(void);

#define NUM_IRQS_TO_SWITCH 22
const IRQn_Type irqs[NUM_IRQS_TO_SWITCH] = {
  EUSART0_RX_IRQn, EUSART0_TX_IRQn,
    FRC_PRI_IRQn, FRC_IRQn, MODEM_IRQn, RAC_SEQ_IRQn, RAC_RSM_IRQn,
    BUFC_IRQn, AGC_IRQn, PROTIMER_IRQn, SYNTH_IRQn,
    RFECA0_IRQn, RFECA1_IRQn, HFRCO0_IRQn, LDMA_IRQn, GPIO_ODD_IRQn, 
    HOSTMAILBOX_IRQn, DCDC_IRQn, SYSRTC_APP_IRQn, SYSRTC_SEQ_IRQn,
    EMU_IRQn, HFXO0_IRQn
}; 

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

void start_ns_app(void)
{
  const uint32_t ns_flash_base = TZ_S_FLASH_END;
  secure_reclaim_peripherals();
  
  secure_runtime_init();

  printf("SW init: radio init\n");
  secure_init_radio();
  printf("SW init: radio init done\n");

  transmit_packet("SW startup probe");

  // printf("SW init: preempt timer init\n");
  // secure_init_preempt_timer();

  
  printf("SW init: delegate peripherals to NS\n");
  // secure_delegate_peripherals_to_ns();

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

static void secure_reclaim_peripherals(void)
{
  secure_set_irqs_target(false);

  CMU->CLKEN1_SET = CMU_CLKEN1_SMU;
  SMU->LOCK = SMU_LOCK_SMULOCKKEY_UNLOCK;

  SMU->BMPUSATD0_SET = SMU_BMPUSATD0_RADIOAES;
  SMU->BMPUSATD0_SET = SMU_BMPUSATD0_RADIOSUBSYSTEM;
  SMU->BMPUSATD0_SET = SMU_BMPUSATD0_RFECA0;
  SMU->BMPUSATD0_SET = SMU_BMPUSATD0_RFECA1;
  SMU->BMPUSATD0_SET = SMU_BMPUSATD0_LDMA;

  SMU->PPUSATD0_SET = SMU_PPUSATD0_GPIO;
  SMU->PPUSATD0_SET = SMU_PPUSATD0_LDMA;
  SMU->PPUSATD0_SET = SMU_PPUSATD0_LDMAXBAR;
  SMU->PPUSATD0_SET = SMU_PPUSATD0_EMU;
  SMU->PPUSATD0_SET = SMU_PPUSATD0_HOSTMAILBOX;
  SMU->PPUSATD0_SET = SMU_PPUSATD0_DCDC;
  SMU->PPUSATD0_SET = SMU_PPUSATD0_PRS;

  SMU->PPUSATD1_SET = SMU_PPUSATD1_EUSART0;
  SMU->PPUSATD1_SET = SMU_PPUSATD1_AHBRADIO;
  SMU->PPUSATD1_SET = SMU_PPUSATD1_RADIOAES;
  SMU->PPUSATD1_SET = SMU_PPUSATD1_HFXO0;
  SMU->PPUSATD1_SET = SMU_PPUSATD1_SYSRTC;

  SMU->LOCK = 0;  
  CMU->CLKEN1_CLR = CMU_CLKEN1_SMU;
}

static void secure_delegate_peripherals_to_ns(void)
{
  secure_set_irqs_target(true);

  CMU->CLKEN1_SET = CMU_CLKEN1_SMU;
  SMU->LOCK = SMU_LOCK_SMULOCKKEY_UNLOCK;

  SMU->PPUSATD0_CLR = SMU_PPUSATD0_EMU;
  SMU->PPUSATD0_CLR = SMU_PPUSATD0_LDMA;
  SMU->PPUSATD0_CLR = SMU_PPUSATD0_LDMAXBAR;
  SMU->PPUSATD0_CLR = SMU_PPUSATD0_GPIO;
  SMU->PPUSATD0_CLR = SMU_PPUSATD0_HOSTMAILBOX;
  SMU->PPUSATD0_CLR = SMU_PPUSATD0_DCDC;
  SMU->PPUSATD0_CLR = SMU_PPUSATD0_PRS;

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

static void secure_runtime_init(void)
{
  sl_main_init();
  //sl_platform_init();
  //sl_driver_init();
  //sl_service_init();
  //sl_stack_init();
}

// Target radio IRQs to NS or S for peripiheral sharing
static void secure_set_irqs_target(bool to_nonsecure)
{
  for (uint32_t i = 0; i < NUM_IRQS_TO_SWITCH; i++) {
    NVIC_ClearPendingIRQ(irqs[i]);
    to_nonsecure ? NVIC_SetTargetState(irqs[i]) : NVIC_ClearTargetState(irqs[i]);
  }
}

static void secure_init_radio(void)
{
  RAIL_Handle_t rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST);
  if ((rail_handle == NULL) || (rail_handle == RAIL_EFR32_HANDLE)) {
    printf("SW secure_init_radio bad rail handle\n");
    while (1) {
    }
  }
  uint16_t size = RAIL_SetTxFifo(rail_handle, tx_fifo, 0, TX_FIFO_SIZE);
  if (size == 0) {
    printf("SW failed to set TX FIFO\n");
    while(1) {};
  }
  sl_rail_status_t status = RAIL_ConfigEvents(rail_handle,
                             RAIL_EVENTS_ALL,
                             RAIL_EVENTS_TX_COMPLETION
                             | RAIL_EVENTS_RX_COMPLETION
                             | RAIL_EVENT_CAL_NEEDED);
  if (status != RAIL_STATUS_NO_ERROR) {
    printf("SW RAIL_ConfigEvents failed: %lu\n", (unsigned long)status);
    while(1) {};
  }
  status = RAIL_SetRxFifo(rail_handle, rx_fifo, &rx_fifo_size);
  if (status != RAIL_STATUS_NO_ERROR) {
    printf("SW RAIL_SetRxFifo failed: %lu\n", (unsigned long)status);
    while(1) {};
  }
  const RAIL_ChannelConfig_t *mijnConfig = channelConfigs[0];
  status = RAIL_StartRx(rail_handle,
                        mijnConfig->configs->channelNumberStart,
                        NULL);
  if (status != RAIL_STATUS_NO_ERROR) {
    printf("SW RAIL_StartRx failed: %lu\n", (unsigned long)status);
    while(1) {};
  }
}

void sl_rail_util_on_event(RAIL_Handle_t rail_handle,
                           RAIL_Events_t events)
{
  (void)rail_handle;
  printf("SW rail events: 0x%08llX\n", (unsigned long long)events);
  if (events & RAIL_EVENTS_TX_COMPLETION) {
    printf("EVENT: TX completed\n");
  }
  else if (events & RAIL_EVENT_RX_PACKET_RECEIVED) {
    // Download packet if targeted at SW (ota packet)...
    printf("SW event: RX packet received\n");
  }
  else if (events & RAIL_EVENT_CAL_NEEDED) {
    // return;
    printf("EVENT: Calibration needed\n");
    printf("sys clock source: %lu sys clock freq: %lu Hz\n", (unsigned long)CMU_ClockSelectGet(cmuClock_SYSCLK), (unsigned long)CMU_ClockFreqGet(cmuClock_SYSCLK));
    RAIL_Status_t status = sl_rail_calibrate(rail_handle, NULL, RAIL_CAL_ALL);
    if (status != RAIL_STATUS_NO_ERROR) {
      printf("SW split calibration failed. Status: 0x%lx\n", (unsigned long)status);
      while(1) {};
    }
  }
}

static void transmit_packet(const char *payload)
{
  RAIL_Handle_t rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST);
  if ((rail_handle == NULL) || (rail_handle == RAIL_EFR32_HANDLE)) {
    printf("SW transmit_packet bad rail handle\n");
    while (1) {}
  }
  sl_rail_write_tx_fifo(rail_handle, (const uint8_t *)payload, strlen(payload), false);
  uint16_t bytes_written = RAIL_WriteTxFifo(rail_handle,
                                   (const uint8_t *)payload,
                                   strlen(payload),
                                   false);
  printf("SW transmit_packet wrote %u bytes\n", bytes_written);
  sl_rail_status_t status = RAIL_StartTx(rail_handle,
                        channelConfigs[0]->configs->channelNumberStart,
                        RAIL_TX_OPTIONS_DEFAULT,
                        NULL);
  printf("SW transmit_packet RAIL_StartTx status: 0x%lx\n", (unsigned long)status);
}
