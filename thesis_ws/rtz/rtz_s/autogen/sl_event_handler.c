#include "sl_event_handler.h"

#include "sl_board_init.h"
#include "sl_clock_manager.h"
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
#include <string.h>
#include "em_device.h"
#include "em_cmu.h"
#include "em_letimer.h"
#include "em_msc.h"
#include "rail.h"
#include "sl_clock_manager.h"
#include "sl_rail_util_init.h"
#include "tz_secure_memory_autogen.h"
#include "../../common/ota_protocol.h"

#define OTA_PREEMPT_PERIOD_SECONDS      (60u)
#define OTA_QUERY_TIMEOUT_US            (300000u)
#define OTA_CHUNK_TIMEOUT_US            (1500000u)
#define OTA_FLASH_PAGE_SIZE_BYTES       (8192u)
#define OTA_MAX_FRAME_SIZE              ((uint16_t)sizeof(ota_chunk_frame_t))
#define OTA_RADIO_CHANNEL               (0u)

typedef void (*nsfunc_t)(void) __attribute__((cmse_nonsecure_call));

static volatile bool ota_tx_done = false;
static volatile bool ota_rx_ready = false;
static uint8_t ota_rx_buffer[OTA_MAX_FRAME_SIZE];
static uint16_t ota_rx_size = 0;
static uint32_t ota_preempt_ticks = 0;

static RAIL_Handle_t secure_rail_handle = NULL;

static void secure_delegate_peripherals_to_ns(void);
static void secure_reclaim_peripherals(void);
static void secure_init_preempt_timer(void);
static bool ota_wait_for_rx(uint32_t timeout_us);
static bool ota_wait_for_tx_complete(uint32_t timeout_us);
static bool ota_send_frame(const uint8_t *payload, uint16_t size);
static bool ota_query_update_available(void);
static bool ota_address_is_valid(uint32_t address, uint16_t size);
static bool ota_write_chunk_to_flash(const ota_chunk_frame_t *chunk);
static bool ota_receive_and_program(void);
static void secure_handle_preemption_window(void);

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
  sl_clock_manager_runtime_init();
  sl_hfxo_manager_init_hardware();
  sl_board_init();
  bootloader_init();
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
  sl_rail_util_power_manager_init();
  sl_rail_util_pti_init();
  sl_rail_util_rssi_init();
  sl_rail_util_init();
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

  secure_rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST);

  secure_reclaim_peripherals();
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

void LETIMER0_IRQHandler(void)
{
  uint32_t irq_flags = LETIMER_IntGet(LETIMER0);

  if ((irq_flags & LETIMER_IF_UF) == 0u) {
    return;
  }

  LETIMER_IntClear(LETIMER0, LETIMER_IF_UF);
  secure_handle_preemption_window();
}

void sl_rail_util_on_event(RAIL_Handle_t rail_handle,
                           RAIL_Events_t events)
{
  if ((events & (RAIL_EVENT_TX_PACKET_SENT
                 | RAIL_EVENT_TX_ABORTED
                 | RAIL_EVENT_TX_BLOCKED)) != 0u) {
    ota_tx_done = true;
  }

  if ((events & RAIL_EVENT_RX_PACKET_RECEIVED) != 0u) {
    RAIL_RxPacketInfo_t packet_info;
    RAIL_RxPacketHandle_t packet_handle = RAIL_HoldRxPacket(rail_handle);
    if (packet_handle != RAIL_RX_PACKET_HANDLE_INVALID) {
      packet_handle = RAIL_GetRxPacketInfo(rail_handle,
                                           packet_handle,
                                           &packet_info);
      if ((packet_handle != RAIL_RX_PACKET_HANDLE_INVALID)
          && (packet_info.packetStatus == RAIL_RX_PACKET_READY_SUCCESS)) {
        uint16_t copy_size = packet_info.packetBytes;
        if (copy_size > OTA_MAX_FRAME_SIZE) {
          copy_size = OTA_MAX_FRAME_SIZE;
        }
        RAIL_CopyRxPacket(ota_rx_buffer, &packet_info);
        ota_rx_size = copy_size;
        ota_rx_ready = true;
      }
      (void)RAIL_ReleaseRxPacket(rail_handle, packet_handle);
    }
  }
}

static void secure_delegate_peripherals_to_ns(void)
{
#if defined(SMU_PPUSATD1_AHBRADIO)
  SMU->PPUSATD1_CLR = SMU_PPUSATD1_AHBRADIO;
#endif
#if defined(SMU_PPUSATD1_EUSART0)
  SMU->PPUSATD1_CLR = SMU_PPUSATD1_EUSART0;
#endif
#if defined(SMU_PPUSATD0_GPIO)
  SMU->PPUSATD0_CLR = SMU_PPUSATD0_GPIO;
#endif
}

static void secure_reclaim_peripherals(void)
{
#if defined(SMU_PPUSATD0_GPIO)
  SMU->PPUSATD0_SET = SMU_PPUSATD0_GPIO;
#endif
#if defined(SMU_PPUSATD1_EUSART0)
  SMU->PPUSATD1_SET = SMU_PPUSATD1_EUSART0;
#endif
#if defined(SMU_PPUSATD1_AHBRADIO)
  SMU->PPUSATD1_SET = SMU_PPUSATD1_AHBRADIO;
#endif
}

static void secure_init_preempt_timer(void)
{
  LETIMER_Init_TypeDef letimer_init = LETIMER_INIT_DEFAULT;
  uint32_t letimer_clock_hz;
  uint32_t top;

  (void)sl_clock_manager_enable_bus_clock(SL_BUS_CLOCK_LETIMER0);
  letimer_clock_hz = CMU_ClockFreqGet(cmuClock_LETIMER0);

  if (letimer_clock_hz == 0u) {
    letimer_clock_hz = 1000u;
  }

  ota_preempt_ticks = letimer_clock_hz * OTA_PREEMPT_PERIOD_SECONDS;
  if (ota_preempt_ticks > 0x0000FFFFu) {
    ota_preempt_ticks = 0x0000FFFFu;
  }
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
  LETIMER_IntEnable(LETIMER0, LETIMER_IF_UF);
  LETIMER_CounterSet(LETIMER0, top);
  LETIMER_Enable(LETIMER0, true);
}

static bool ota_wait_for_rx(uint32_t timeout_us)
{
  uint32_t start_time = RAIL_GetTime();

  while ((RAIL_GetTime() - start_time) < timeout_us) {
    if (ota_rx_ready) {
      return true;
    }
  }
  return false;
}

static bool ota_wait_for_tx_complete(uint32_t timeout_us)
{
  uint32_t start_time = RAIL_GetTime();

  while ((RAIL_GetTime() - start_time) < timeout_us) {
    if (ota_tx_done) {
      return true;
    }
  }
  return false;
}

static bool ota_send_frame(const uint8_t *payload, uint16_t size)
{
  if ((secure_rail_handle == NULL) || (payload == NULL) || (size == 0u)) {
    return false;
  }

  ota_tx_done = false;
  (void)RAIL_WriteTxFifo(secure_rail_handle, payload, size, true);
  if (RAIL_StartTx(secure_rail_handle,
                   OTA_RADIO_CHANNEL,
                   RAIL_TX_OPTIONS_DEFAULT,
                   NULL) != RAIL_STATUS_NO_ERROR) {
    return false;
  }

  return ota_wait_for_tx_complete(OTA_QUERY_TIMEOUT_US);
}

static bool ota_query_update_available(void)
{
  ota_simple_frame_t query = { .type = OTA_MSG_QUERY };

  ota_rx_ready = false;
  ota_rx_size = 0u;

  if (!ota_send_frame((const uint8_t *)&query, sizeof(query))) {
    return false;
  }

  if (RAIL_StartRx(secure_rail_handle, OTA_RADIO_CHANNEL, NULL)
      != RAIL_STATUS_NO_ERROR) {
    return false;
  }

  if (!ota_wait_for_rx(OTA_QUERY_TIMEOUT_US)) {
    return false;
  }

  if (ota_rx_size < sizeof(ota_simple_frame_t)) {
    return false;
  }

  if (ota_rx_buffer[0] == OTA_MSG_RESP_UPDATE_AVAILABLE) {
    return true;
  }

  return false;
}

static bool ota_address_is_valid(uint32_t address, uint16_t size)
{
  uint32_t end_address = address + size;
  uint32_t flash_end = FLASH_BASE + FLASH_SIZE;

  if ((size == 0u)
      || ((address & 0x3u) != 0u)
      || ((size & 0x3u) != 0u)
      || (end_address < address)) {
    return false;
  }

  if ((address < TZ_S_FLASH_START) || (end_address > flash_end)) {
    return false;
  }

  return true;
}

static bool ota_write_chunk_to_flash(const ota_chunk_frame_t *chunk)
{
  MSC_Status_TypeDef msc_status;
  uint32_t page_address;

  if ((chunk == NULL)
      || (chunk->length == 0u)
      || (chunk->length > OTA_MAX_CHUNK_SIZE)
      || !ota_address_is_valid(chunk->offset, chunk->length)) {
    return false;
  }

  page_address = chunk->offset & ~(OTA_FLASH_PAGE_SIZE_BYTES - 1u);
  if ((chunk->offset % OTA_FLASH_PAGE_SIZE_BYTES) == 0u) {
    msc_status = MSC_ErasePage((uint32_t *)page_address);
    if (msc_status != mscReturnOk) {
      return false;
    }
  }

  msc_status = MSC_WriteWord((uint32_t *)chunk->offset,
                             chunk->payload,
                             chunk->length);

  return (msc_status == mscReturnOk);
}

static bool ota_receive_and_program(void)
{
  uint32_t start_time = RAIL_GetTime();
  ota_eof_frame_t error_frame = { .type = OTA_MSG_ERROR, .status = 1u };

  MSC_Init();

  while ((RAIL_GetTime() - start_time) < OTA_CHUNK_TIMEOUT_US) {
    if (!ota_wait_for_rx(OTA_CHUNK_TIMEOUT_US)) {
      break;
    }

    ota_rx_ready = false;
    start_time = RAIL_GetTime();

    if (ota_rx_size < sizeof(ota_simple_frame_t)) {
      continue;
    }

    if (ota_rx_buffer[0] == OTA_MSG_DATA_CHUNK) {
      ota_chunk_frame_t chunk;
      uint16_t expected_size;

      if (ota_rx_size < sizeof(ota_chunk_frame_t) - OTA_MAX_CHUNK_SIZE) {
        continue;
      }

      memcpy(&chunk, ota_rx_buffer, sizeof(ota_chunk_frame_t));

      expected_size = (uint16_t)(sizeof(ota_chunk_frame_t)
                                 - OTA_MAX_CHUNK_SIZE
                                 + chunk.length);

      if ((chunk.length > OTA_MAX_CHUNK_SIZE) || (ota_rx_size < expected_size)) {
        continue;
      }

      if (!ota_write_chunk_to_flash(&chunk)) {
        (void)ota_send_frame((const uint8_t *)&error_frame, sizeof(error_frame));
        MSC_Deinit();
        return false;
      }
      continue;
    }

    if (ota_rx_buffer[0] == OTA_MSG_EOF) {
      MSC_Deinit();
      return true;
    }

    if (ota_rx_buffer[0] == OTA_MSG_RESP_NO_UPDATE) {
      MSC_Deinit();
      return false;
    }
  }

  (void)ota_send_frame((const uint8_t *)&error_frame, sizeof(error_frame));
  MSC_Deinit();
  return false;
}

static void secure_handle_preemption_window(void)
{
  if (secure_rail_handle == NULL) {
    LETIMER_CounterSet(LETIMER0, ota_preempt_ticks);
    return;
  }

  (void)RAIL_Idle(secure_rail_handle,
                  RAIL_IDLE_FORCE_SHUTDOWN_CLEAR_FLAGS,
                  true);
  secure_reclaim_peripherals();

  if (ota_query_update_available() && ota_receive_and_program()) {
    NVIC_SystemReset();
  }

  secure_delegate_peripherals_to_ns();
  LETIMER_CounterSet(LETIMER0, ota_preempt_ticks);
}

void sl_iostream_init_instances_stage_1(void)
{
  sl_iostream_eusart_init_instances();
}

void sl_iostream_init_instances_stage_2(void)
{
  sl_iostream_set_console_instance();
}

