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

static volatile uint32_t secure_probe_stage = 0u;
static volatile uint32_t secure_probe_status = 0u;
static volatile uint32_t secure_probe_bytes_written = 0u;
static volatile uint32_t secure_rssi_test_status = 0u;
static volatile uint32_t secure_rssi_test_iterations = 0u;
static volatile uint32_t secure_rf_ready_count = 0u;
static volatile uint32_t secure_rf_ready_handle = 0u;
static volatile uint32_t secure_irq_secure_mismatch_mask = 0u;
static volatile uint32_t secure_event_count = 0u;
static volatile uint64_t secure_last_events = 0u;

typedef struct {
  uint32_t marker;
  uint32_t primask;
  uint32_t basepri;
  uint32_t faultmask;
  uint32_t ipsr;
  uint32_t cfsr;
  uint32_t hfsr;
  uint32_t shcsr;
  uint32_t icsr;
  uint32_t rail_handle;
  uint32_t radio_state;
  uint32_t radio_state_detail;
  uint32_t tx_fifo_addr;
  uint32_t tx_fifo_in_secure_ram;
  uint32_t tx_fifo_size;
  uint32_t tx_fifo_space;
  uint32_t rx_fifo_addr;
  uint32_t iser0;
  uint32_t iser1;
  uint32_t iser2;
  uint32_t ispr0;
  uint32_t ispr1;
  uint32_t ispr2;
  uint32_t iabr0;
  uint32_t iabr1;
  uint32_t iabr2;
  uint32_t itns0;
  uint32_t itns1;
  uint32_t itns2;
  uint32_t frc_target_ns;
  uint32_t frc_enabled;
  uint32_t frc_pending;
  uint32_t modem_target_ns;
  uint32_t modem_enabled;
  uint32_t modem_pending;
  uint32_t synth_target_ns;
  uint32_t synth_enabled;
  uint32_t synth_pending;
  uint32_t rac_seq_target_ns;
  uint32_t rac_seq_enabled;
  uint32_t rac_seq_pending;
  uint32_t rac_rsm_target_ns;
  uint32_t rac_rsm_enabled;
  uint32_t rac_rsm_pending;
  uint32_t ldma_target_ns;
  uint32_t ldma_enabled;
  uint32_t ldma_pending;
} secure_rail_diag_t;

typedef struct {
  uint32_t signature;
  uint32_t cfsr;
  uint32_t hfsr;
  uint32_t dfsr;
  uint32_t afsr;
  uint32_t bfar;
  uint32_t mmfar;
  uint32_t shcsr;
  uint32_t icsr;
  uint32_t lr;
  uint32_t msp;
  uint32_t psp;
} secure_fault_diag_t;

static volatile secure_rail_diag_t secure_rail_diag;
static volatile secure_rail_diag_t secure_rail_diag_rssi_start;
static volatile secure_rail_diag_t secure_rail_diag_rssi_end;
static volatile secure_fault_diag_t secure_fault_diag;

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
static void secure_enable_radio_irqs(void);
static void secure_force_radio_irqs_secure_raw(void);
static void secure_log_irq_targets(const char *tag);
static bool secure_send_probe_packet(const char *tag);
static void secure_capture_rail_diag(RAIL_Handle_t rail_handle, uint32_t marker);
static void secure_capture_fault_diag(uint32_t signature);
static uint32_t secure_read_lr(void);
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
  secure_force_radio_irqs_secure_raw();
  secure_clear_all_irqs_pending();
  secure_set_irq_target(false);
  secure_force_radio_irqs_secure_raw();
  secure_clear_irqs_pending();
  // secure_log_irq_targets("before sl_rail_tz init");

  status = sl_rail_tz_init_secure();
  status |= sl_rail_tz_enable_secure_radio_irqs();
  status |= sl_rail_tz_radio_clock_enable();
  status |= sl_rail_tz_rfeca_clock_enable();
  status |= sl_rail_tz_configure_hfxo();
  // status |= sl_rail_tz_check_peripherals_secure_states();
  // printf("Status: 0x%lx\n", (unsigned long)status);
  // secure_log_irq_targets("after sl_rail_tz init");

  // printf("SW init: sl_rail_util_dma_init\n");
  sl_rail_util_dma_init();
  // printf("SW init: sl_rail_util_pa_init\n");
  sl_rail_util_pa_init();
  secure_enable_radio_irqs();
  // CMU_OscillatorEnable(cmuOsc_HFXO, true, true);
  // printf("SW init: sl_rail_util_init enter\n");
  sl_rail_util_init();
  secure_enable_radio_irqs();
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

  (void)secure_send_probe_packet("SW startup probe");

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

  sl_platform_init();
  sl_driver_init();
  sl_service_init();
  // CMU_OscillatorEnable(cmuOsc_HFXO, true, true);
  sl_stack_init();

  secure_runtime_initialized = true;
}

void secure_init_radio(void)
{
  RAIL_Handle_t rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST);
  RAIL_DataConfig_t data_config = {
    .txSource = TX_PACKET_DATA,
    .rxSource = RX_PACKET_DATA,
    .txMethod = FIFO_MODE,
    .rxMethod = PACKET_MODE,
  };

  if ((rail_handle == NULL) || (rail_handle == RAIL_EFR32_HANDLE)) {
    printf("SW secure_init_radio bad rail handle\n");
    while (1) {
    }
  }

  RAIL_Status_t status = RAIL_ConfigData(rail_handle, &data_config);
  if (status != RAIL_STATUS_NO_ERROR) {
    printf("SW RAIL_ConfigData failed: %lu\n", (unsigned long)status);
    while (1) {
    }
  }

  uint16_t size = RAIL_SetTxFifo(rail_handle, tx_fifo, 0, TX_FIFO_SIZE);
  if (size == 0) {
    printf("SW failed to set TX FIFO\n");
    while(1);
  } else {
    // printf("TX FIFO set, size: %u\n", size);
    secure_tx_fifo_configured = true;
  }

  status = RAIL_ConfigEvents(rail_handle,
                             RAIL_EVENTS_ALL,
                             //  RAIL_EVENTS_ALL);
                             RAIL_EVENTS_TX_COMPLETION
                             | RAIL_EVENTS_RX_COMPLETION
                             | RAIL_EVENT_RSSI_AVERAGE_DONE
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

  {
    uint32_t event_count_before = secure_event_count;
    secure_rssi_test_iterations = 0u;
    secure_capture_rail_diag(rail_handle, 0xA010u);
    secure_rail_diag_rssi_start = secure_rail_diag;
    secure_rssi_test_status = 0xA001u;
    status = RAIL_StartAverageRssi(rail_handle,
                                   channelConfigs[0]->configs->channelNumberStart,
                                   128u,
                                   NULL);
    if (status == RAIL_STATUS_NO_ERROR) {
      for (uint32_t i = 0u; i < 200000u; i++) {
        secure_rssi_test_iterations = i;
        if (RAIL_IsAverageRssiReady(rail_handle)) {
          secure_rssi_test_status = 0xA002u;
          break;
        }
      }
      if (secure_event_count > event_count_before) {
        secure_rssi_test_status |= 0x10000u;
      }
    } else {
      secure_rssi_test_status = (0xA100u | (uint32_t)status);
    }
    secure_capture_rail_diag(rail_handle, 0xA020u);
    secure_rail_diag_rssi_end = secure_rail_diag;
  }

  const RAIL_ChannelConfig_t *mijnConfig = channelConfigs[0];
  status = RAIL_StartRx(rail_handle,
                        mijnConfig->configs->channelNumberStart,
                        NULL);
  if (status != RAIL_STATUS_NO_ERROR) {
    printf("SW RAIL_StartRx failed: %lu\n", (unsigned long)status);
    while(1);
  }
  CMU_ClockEnable(cmuClock_GPIO, true);
  secure_capture_rail_diag(rail_handle, 0x0100u);
}

void sl_rail_util_on_event(RAIL_Handle_t rail_handle,
                           RAIL_Events_t events)
{
  (void)rail_handle;
  secure_event_count++;
  secure_last_events = (uint64_t)events;
  secure_capture_rail_diag(rail_handle, 0xE000u);
  printf("SW rail events: 0x%016llX\n", (unsigned long long)events);
  if (events & RAIL_EVENTS_TX_COMPLETION) {
    printf("EVENT: TX completed\n");
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
    printf("SW rail events: 0x%016llX\n", (unsigned long long)events);
  }
}

void sl_rail_util_on_rf_ready(RAIL_Handle_t rail_handle)
{
  secure_rf_ready_count++;
  secure_rf_ready_handle = (uint32_t)rail_handle;
  secure_capture_rail_diag(rail_handle, 0xD000u);
}

// Free peripherals back to NS world
static void secure_delegate_peripherals_to_ns(void)
{
EUSART_IntDisable(EUSART0, _EUSART_IEN_MASK);
EUSART_IntClear(EUSART0, _EUSART_IF_MASK);
NVIC_DisableIRQ(EUSART0_RX_IRQn);
NVIC_DisableIRQ(EUSART0_TX_IRQn);
NVIC_ClearPendingIRQ(EUSART0_RX_IRQn);
NVIC_ClearPendingIRQ(EUSART0_TX_IRQn);

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
secure_force_radio_irqs_secure_raw();
secure_clear_irqs_pending();
secure_enable_radio_irqs();

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

SMU->PPUSATD1_SET = SMU_PPUSATD1_EUSART0;
SMU->PPUSATD1_SET = SMU_PPUSATD1_AHBRADIO;
SMU->PPUSATD1_SET = SMU_PPUSATD1_RADIOAES;
SMU->PPUSATD1_SET = SMU_PPUSATD1_HFXO0;
SMU->PPUSATD1_SET = SMU_PPUSATD1_SYSRTC;

SMU->LOCK = 0;  
CMU->CLKEN1_CLR = CMU_CLKEN1_SMU;
}

#define NUM_IRQS_TO_SWITCH 17
const IRQn_Type irqs[NUM_IRQS_TO_SWITCH] = {
  EUSART0_RX_IRQn, EUSART0_TX_IRQn,
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

static void secure_force_radio_irqs_secure_raw(void)
{
  secure_irq_secure_mismatch_mask = 0u;

  for (uint32_t i = 0; i < NUM_IRQS_TO_SWITCH; i++) {
    uint32_t irq = (uint32_t)irqs[i];
    uint32_t word = irq >> 5;
    uint32_t bit = irq & 0x1Fu;
    uint32_t bit_mask = (1u << bit);

    NVIC->ITNS[word] &= ~bit_mask;
    if ((NVIC->ITNS[word] & bit_mask) != 0u) {
      secure_irq_secure_mismatch_mask |= (1u << (i & 31u));
    }
  }
}

static void secure_enable_radio_irqs(void)
{
  for (uint32_t i = 0; i < NUM_IRQS_TO_SWITCH; i++) {
    NVIC_ClearPendingIRQ(irqs[i]);
    NVIC_EnableIRQ(irqs[i]);
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
  printf("SW irq targets (%s): EUSART0_RX=%lu EUSART0_TX=%lu LDMA=%lu FRC=%lu MODEM=%lu RAC_SEQ=%lu BUFC=%lu AGC=%lu PROTIMER=%lu SYNTH=%lu HOSTMAILBOX=%lu RFECA0=%lu RFECA1=%lu HFRCO0=%lu\n",
         tag,
         (unsigned long)NVIC_GetTargetState(EUSART0_RX_IRQn),
         (unsigned long)NVIC_GetTargetState(EUSART0_TX_IRQn),
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

  (void)secure_send_probe_packet("SW preempt probe");

  secure_delegate_peripherals_to_ns();
}

static bool secure_send_probe_packet(const char *tag)
{
  RAIL_Handle_t rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST);
  RAIL_Status_t status;
  uint16_t fifo_size;
  uint16_t bytes_written;
  uint8_t secure_probe_payload[] = "SW TX packet";

  if ((rail_handle == NULL) || (rail_handle == RAIL_EFR32_HANDLE)) {
    (void)tag;
    secure_probe_stage = 1u;
    secure_probe_status = 0xE001u;
    return false;
  }

  secure_set_irq_target(false);
  secure_force_radio_irqs_secure_raw();
  secure_clear_irqs_pending();
  secure_enable_radio_irqs();

  secure_capture_rail_diag(rail_handle, 0x1000u);

  secure_probe_stage = 2u;
  status = RAIL_Idle(rail_handle,
                     RAIL_IDLE_FORCE_SHUTDOWN_CLEAR_FLAGS,
                     true);
  if (status != RAIL_STATUS_NO_ERROR) {
    secure_probe_stage = 3u;
    secure_probe_status = (uint32_t)status;
    return false;
  }

  secure_capture_rail_diag(rail_handle, 0x1100u);

  secure_probe_stage = 4u;
  fifo_size = RAIL_SetTxFifo(rail_handle, tx_fifo, 0, TX_FIFO_SIZE);
  if (fifo_size == 0u) {
    secure_probe_stage = 5u;
    secure_probe_status = 0xE002u;
    return false;
  }
  secure_tx_fifo_configured = true;

  secure_capture_rail_diag(rail_handle, 0x1200u);

  secure_probe_stage = 6u;
  secure_capture_rail_diag(rail_handle, 0x1300u);
  bytes_written = RAIL_WriteTxFifo(rail_handle,
                                   secure_probe_payload,
                                   sizeof(secure_probe_payload),
                                   true);
  secure_probe_bytes_written = bytes_written;
  if (bytes_written != sizeof(secure_probe_payload)) {
    secure_probe_stage = 7u;
    secure_probe_status = 0xE003u;
    return false;
  }

  secure_capture_rail_diag(rail_handle, 0x1400u);

  secure_probe_stage = 8u;
  status = RAIL_StartTx(rail_handle,
                        channelConfigs[0]->configs->channelNumberStart,
                        RAIL_TX_OPTIONS_DEFAULT,
                        NULL);
  secure_probe_status = (uint32_t)status;
  secure_probe_stage = 9u;
  secure_capture_rail_diag(rail_handle, 0x1500u);
  return (status == RAIL_STATUS_NO_ERROR);
}

static inline bool secure_irq_enabled(IRQn_Type irqn)
{
  uint32_t irq = (uint32_t)irqn;
  uint32_t word = irq >> 5;
  uint32_t bit = irq & 0x1Fu;
  return ((NVIC->ISER[word] & (1u << bit)) != 0u);
}

static inline bool secure_irq_pending(IRQn_Type irqn)
{
  uint32_t irq = (uint32_t)irqn;
  uint32_t word = irq >> 5;
  uint32_t bit = irq & 0x1Fu;
  return ((NVIC->ISPR[word] & (1u << bit)) != 0u);
}

static void secure_capture_rail_diag(RAIL_Handle_t rail_handle, uint32_t marker)
{
  secure_rail_diag.marker = marker;
  secure_rail_diag.primask = __get_PRIMASK();
  secure_rail_diag.basepri = __get_BASEPRI();
  secure_rail_diag.faultmask = __get_FAULTMASK();
  secure_rail_diag.ipsr = __get_IPSR();
  secure_rail_diag.cfsr = SCB->CFSR;
  secure_rail_diag.hfsr = SCB->HFSR;
  secure_rail_diag.shcsr = SCB->SHCSR;
  secure_rail_diag.icsr = SCB->ICSR;

  secure_rail_diag.iser0 = NVIC->ISER[0];
  secure_rail_diag.iser1 = NVIC->ISER[1];
  secure_rail_diag.iser2 = NVIC->ISER[2];
  secure_rail_diag.ispr0 = NVIC->ISPR[0];
  secure_rail_diag.ispr1 = NVIC->ISPR[1];
  secure_rail_diag.ispr2 = NVIC->ISPR[2];
  secure_rail_diag.iabr0 = NVIC->IABR[0];
  secure_rail_diag.iabr1 = NVIC->IABR[1];
  secure_rail_diag.iabr2 = NVIC->IABR[2];
  secure_rail_diag.itns0 = NVIC->ITNS[0];
  secure_rail_diag.itns1 = NVIC->ITNS[1];
  secure_rail_diag.itns2 = NVIC->ITNS[2];

  secure_rail_diag.rail_handle = (uint32_t)rail_handle;
  if ((rail_handle != NULL) && (rail_handle != RAIL_EFR32_HANDLE)) {
    secure_rail_diag.radio_state = (uint32_t)RAIL_GetRadioState(rail_handle);
    secure_rail_diag.radio_state_detail = (uint32_t)RAIL_GetRadioStateDetail(rail_handle);
    secure_rail_diag.tx_fifo_space = RAIL_GetTxFifoSpaceAvailable(rail_handle);
  } else {
    secure_rail_diag.radio_state = 0xFFFFFFFFu;
    secure_rail_diag.radio_state_detail = 0xFFFFFFFFu;
    secure_rail_diag.tx_fifo_space = 0u;
  }

  secure_rail_diag.tx_fifo_addr = (uint32_t)tx_fifo;
  secure_rail_diag.rx_fifo_addr = (uint32_t)rx_fifo;
  secure_rail_diag.tx_fifo_size = TX_FIFO_SIZE;
  secure_rail_diag.tx_fifo_in_secure_ram = (((uint32_t)tx_fifo >= TZ_S_RAM_START)
                                            && ((uint32_t)tx_fifo < TZ_S_RAM_END)) ? 1u : 0u;

  secure_rail_diag.frc_target_ns = NVIC_GetTargetState(FRC_IRQn);
  secure_rail_diag.frc_enabled = secure_irq_enabled(FRC_IRQn) ? 1u : 0u;
  secure_rail_diag.frc_pending = secure_irq_pending(FRC_IRQn) ? 1u : 0u;

  secure_rail_diag.modem_target_ns = NVIC_GetTargetState(MODEM_IRQn);
  secure_rail_diag.modem_enabled = secure_irq_enabled(MODEM_IRQn) ? 1u : 0u;
  secure_rail_diag.modem_pending = secure_irq_pending(MODEM_IRQn) ? 1u : 0u;

  secure_rail_diag.synth_target_ns = NVIC_GetTargetState(SYNTH_IRQn);
  secure_rail_diag.synth_enabled = secure_irq_enabled(SYNTH_IRQn) ? 1u : 0u;
  secure_rail_diag.synth_pending = secure_irq_pending(SYNTH_IRQn) ? 1u : 0u;

  secure_rail_diag.rac_seq_target_ns = NVIC_GetTargetState(RAC_SEQ_IRQn);
  secure_rail_diag.rac_seq_enabled = secure_irq_enabled(RAC_SEQ_IRQn) ? 1u : 0u;
  secure_rail_diag.rac_seq_pending = secure_irq_pending(RAC_SEQ_IRQn) ? 1u : 0u;

  secure_rail_diag.rac_rsm_target_ns = NVIC_GetTargetState(RAC_RSM_IRQn);
  secure_rail_diag.rac_rsm_enabled = secure_irq_enabled(RAC_RSM_IRQn) ? 1u : 0u;
  secure_rail_diag.rac_rsm_pending = secure_irq_pending(RAC_RSM_IRQn) ? 1u : 0u;

  secure_rail_diag.ldma_target_ns = NVIC_GetTargetState(LDMA_IRQn);
  secure_rail_diag.ldma_enabled = secure_irq_enabled(LDMA_IRQn) ? 1u : 0u;
  secure_rail_diag.ldma_pending = secure_irq_pending(LDMA_IRQn) ? 1u : 0u;
}

static void secure_capture_fault_diag(uint32_t signature)
{
  secure_fault_diag.signature = signature;
  secure_fault_diag.cfsr = SCB->CFSR;
  secure_fault_diag.hfsr = SCB->HFSR;
  secure_fault_diag.dfsr = SCB->DFSR;
  secure_fault_diag.afsr = SCB->AFSR;
  secure_fault_diag.bfar = SCB->BFAR;
  secure_fault_diag.mmfar = SCB->MMFAR;
  secure_fault_diag.shcsr = SCB->SHCSR;
  secure_fault_diag.icsr = SCB->ICSR;
  secure_fault_diag.lr = secure_read_lr();
  secure_fault_diag.msp = __get_MSP();
  secure_fault_diag.psp = __get_PSP();
}

static uint32_t secure_read_lr(void)
{
  uint32_t lr;
  __asm volatile ("mov %0, lr" : "=r" (lr));
  return lr;
}

void HardFault_Handler(void)
{
  secure_capture_fault_diag(0x48444654u); // HDFT
  while (1) {
  }
}

void BusFault_Handler(void)
{
  secure_capture_fault_diag(0x42534654u); // BSFT
  while (1) {
  }
}

void SecureFault_Handler(void)
{
  secure_capture_fault_diag(0x53434654u); // SCFT
  while (1) {
  }
}

void sl_iostream_init_instances_stage_1(void)
{
  sl_iostream_eusart_init_instances();
}

void sl_iostream_init_instances_stage_2(void)
{
  sl_iostream_set_console_instance();
}

