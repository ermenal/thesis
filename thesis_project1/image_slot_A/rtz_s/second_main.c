/***************************************************************************//**
 * @file main.c
 * @brief main() function.
 *******************************************************************************
 * # License
 * <b>Copyright 2025 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * SPDX-License-Identifier: Zlib
 *
 * The licensor of this software is Silicon Laboratories Inc.
 *
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event will the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software
 *    in a product, an acknowledgment in the product documentation would be
 *    appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 ******************************************************************************/
#include "cmsis_nvic_virtual.h"
#include "efr32fg23b010f512im48.h"
#include "em_gpio.h"
#include "gpiointerrupt.h"
#include "rail.h"
#include "second_main.h"
#include "rail_types.h"
#include "simplicity_sdk_2025.6.2/platform/emlib/inc/em_cmu.h"
#include "simplicity_sdk_2025.6.2/platform/emlib/inc/em_msc.h"
#include "sl_rail_util_init.h"
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include "sl_common.h"
#include "sl_status.h"
#include "rail_config.h"
#include <string.h>

#define CRC32_INITIAL_VALUE 0xFFFFFFFFu
#define CRC32_XOR_OUT       0xFFFFFFFFu
#define CRC32_POLYNOMIAL    0xEDB88320u
#define BOOT_STATE_CRC_LENGTH (offsetof(NvmBootState_t, crc32))

// benchmark stuff
static sl_sleeptimer_timer_handle_t measurement_timer;
static volatile bool measurement_timer_active = false;

bool secure_start_packet_measurement(uint32_t duration_ms)
{
  uint32_t timer_ticks = sl_sleeptimer_ms_to_tick(duration_ms);
  if (measurement_timer_active) {
    (void)sl_sleeptimer_stop_timer(&measurement_timer);
    measurement_timer_active = false;
  }

  sl_status_t status = sl_sleeptimer_start_timer(&measurement_timer,
                                                 timer_ticks,
                                                 measurement_timer_callback,
                                                 NULL,
                                                 0,
                                                 0);
  if (status == SL_STATUS_OK) {
    measurement_timer_active = true;
    return true;
  }

  printf("Failed to start measurement timer: %lu\n", (unsigned long)status);
  return false;
}

void measurement_timer_callback(sl_sleeptimer_timer_handle_t *handle, void *data)
{
  (void)handle;
  (void)data;
  measurement_timer_active = false;
  
  // NVIC_SetPendingIRQ(SW2_IRQn);
  TZ_NVIC_SetPendingIRQ_NS(SW2_IRQn);

  //measurement_active = false;
  //printf("\n=== 1-Minute Measurement Complete ===");
  //printf("\nPackets received: %lu\n", (unsigned long)packet_count);
  //printf("====================================\n\n");
}

typedef struct {
  NvmBootState_t state;
  uint32_t page_address;
  bool valid;
  bool initialised;
} boot_state_context_t;

static boot_state_context_t boot_state_ctx = {
  .state = { 0 },
  .page_address = NVM_BOOT_STATE_PAGE_A,
  .valid = false,
  .initialised = false,
};

static AppSlot_t ota_target_slot = SLOT_A;
static uint32_t ota_target_base = APP_SLOT_A_START_ADDR;

#define FLASH_PAGE_SIZE_BYTES 0x2000u

typedef struct {
  bool active;
  bool msc_active;
  AppSlot_t slot;
  uint32_t base_address;
  uint32_t expected_offset;
  uint32_t write_cursor;
  uint8_t residual[4];
  uint8_t residual_len;
  uint32_t total_bytes;
  uint32_t crc;
} ota_update_context_t;

static ota_update_context_t ota_ctx;
static bool ota_in_progress = false; // Tracks whether an OTA session is active

#define GBL_HEADER_LENGTH 6u
#define GBL_TAG_HEADER        0x0000u
#define GBL_TAG_INIT          0x0001u
#define GBL_TAG_METADATA      0x0002u
#define GBL_TAG_APP_DATA      0x0003u
#define GBL_TAG_END           0xFFFFu

typedef enum {
  GBL_PARSER_IDLE = 0,
  GBL_PARSER_READ_TAG,
  GBL_PARSER_SKIP_TAG,
  GBL_PARSER_STREAM_APP,
  GBL_PARSER_DONE,
  GBL_PARSER_ERROR,
} gbl_parser_state_t;

typedef struct {
  bool active;
  gbl_parser_state_t state;
  uint32_t stream_offset;
  uint16_t current_tag;
  uint32_t current_length;
  uint32_t current_consumed;
  uint8_t header_bytes[GBL_HEADER_LENGTH];
  uint8_t header_count;
} gbl_parser_context_t;

static gbl_parser_context_t gbl_ctx;

static void ota_abort_update(void);
static bool ota_write_chunk(uint32_t offset, const uint8_t *data, size_t length);
static bool ota_finish_update(uint32_t *out_crc, uint32_t *out_length);
static void send_slot_info_response(AppSlot_t active_slot,
                                    AppSlot_t inactive_slot,
                                    UpdateStatus_t pending_slot);

static uint32_t crc32_update(uint32_t crc, const uint8_t *data, size_t length)
{
  uint32_t value = crc;

  for (size_t i = 0; i < length; i++) {
    value ^= data[i];
    for (uint8_t bit = 0; bit < 8; bit++) {
      if (value & 1u) {
        value = (value >> 1) ^ CRC32_POLYNOMIAL;
      } else {
        value >>= 1;
      }
    }
  }

  return value;
}

static uint32_t crc32_finalize(uint32_t crc)
{
  return crc ^ CRC32_XOR_OUT;
}

static uint32_t crc32_compute(const void *data, size_t length)
{
  const uint8_t *bytes = (const uint8_t *)data;
  uint32_t crc = crc32_update(CRC32_INITIAL_VALUE, bytes, length);
  return crc32_finalize(crc);
}

static bool slot_value_valid(AppSlot_t slot)
{
  return (slot == SLOT_A) || (slot == SLOT_B);
}

static bool pending_value_valid(UpdateStatus_t status)
{
  switch (status) {
    case UPDATE_NONE:
    case UPDATE_PENDING_A:
    case UPDATE_PENDING_B:
      return true;
    default:
      return false;
  }
}

static bool boot_state_validate(const NvmBootState_t *state)
{
  if (state->magic != BOOT_STATE_MAGIC) {
    return false;
  }

  if (!slot_value_valid(state->active_slot)) {
    return false;
  }

  if (!pending_value_valid(state->pending_slot)) {
    return false;
  }

  uint32_t computed_crc = crc32_compute(state, BOOT_STATE_CRC_LENGTH);
  return (computed_crc == state->crc32);
}

static bool boot_state_read_latest(NvmBootState_t *out_state, uint32_t *out_page)
{
  const NvmBootState_t *state_A = (const NvmBootState_t *)NVM_BOOT_STATE_PAGE_A;
  const NvmBootState_t *state_B = (const NvmBootState_t *)NVM_BOOT_STATE_PAGE_B;

  bool valid_A = boot_state_validate(state_A);
  bool valid_B = boot_state_validate(state_B);

  if (!valid_A && !valid_B) {
    return false;
  }

  const NvmBootState_t *chosen = NULL;
  uint32_t chosen_page = 0u;

  if (valid_A && valid_B) {
    if (state_A->version >= state_B->version) {
      chosen = state_A;
      chosen_page = NVM_BOOT_STATE_PAGE_A;
    } else {
      chosen = state_B;
      chosen_page = NVM_BOOT_STATE_PAGE_B;
    }
  } else if (valid_A) {
    chosen = state_A;
    chosen_page = NVM_BOOT_STATE_PAGE_A;
  } else {
    chosen = state_B;
    chosen_page = NVM_BOOT_STATE_PAGE_B;
  }

  memcpy(out_state, chosen, sizeof(NvmBootState_t));
  *out_page = chosen_page;
  return true;
}

static uint32_t boot_state_alternate_page(uint32_t current_page)
{
  return (current_page == NVM_BOOT_STATE_PAGE_A) ? NVM_BOOT_STATE_PAGE_B : NVM_BOOT_STATE_PAGE_A;
}

static bool boot_state_write_page(const NvmBootState_t *state, uint32_t page_address)
{
  MSC_Status_TypeDef status;

  MSC_Init();
  status = MSC_ErasePage((uint32_t *)page_address);
  if (status != mscReturnOk) {
    MSC_Deinit();
    return false;
  }

  status = MSC_WriteWord((uint32_t *)page_address, (const void *)state, sizeof(NvmBootState_t));
  MSC_Deinit();

  return (status == mscReturnOk);
}

static bool boot_state_commit(AppSlot_t active_slot,
                              UpdateStatus_t pending_slot,
                              uint8_t boot_attempts)
{
  if (!boot_state_ctx.valid) {
    return false;
  }

  NvmBootState_t new_state = {
    .magic = BOOT_STATE_MAGIC,
    .version = boot_state_ctx.state.version + 1u,
    .active_slot = active_slot,
    .pending_slot = pending_slot,
    .boot_attempts = boot_attempts,
    .reserved = { 0 },
    .crc32 = 0u,
  };

  new_state.crc32 = crc32_compute(&new_state, BOOT_STATE_CRC_LENGTH);

  uint32_t target_page = boot_state_alternate_page(boot_state_ctx.page_address);
  bool success = boot_state_write_page(&new_state, target_page);
  if (!success) {
    return false;
  }

  boot_state_ctx.state = new_state;
  boot_state_ctx.page_address = target_page;
  boot_state_ctx.valid = true;
  return true;
}

bool boot_state_manager_init(void)
{
  if (!boot_state_ctx.initialised) {
    boot_state_ctx.valid = boot_state_read_latest(&boot_state_ctx.state,
                                                 &boot_state_ctx.page_address);
    boot_state_ctx.initialised = true;
  }

  return boot_state_ctx.valid;
}

const NvmBootState_t *boot_state_get_current(void)
{
  if (!boot_state_manager_init()) {
    return NULL;
  }

  return boot_state_ctx.valid ? &boot_state_ctx.state : NULL;
}

AppSlot_t boot_state_get_inactive_slot(void)
{
  if (!boot_state_manager_init()) {
    return SLOT_A;
  }

  return boot_state_other_slot(boot_state_ctx.state.active_slot);
}

bool boot_state_mark_update_pending(AppSlot_t target_slot)
{
  if (!boot_state_manager_init()) {
    return false;
  }

  if (!slot_value_valid(target_slot)) {
    return false;
  }

  UpdateStatus_t pending_flag = boot_state_pending_flag_for_slot(target_slot);
  return boot_state_commit(boot_state_ctx.state.active_slot, pending_flag, 0u);
}

bool boot_state_commit_proof_of_life(void)
{
  if (!boot_state_manager_init()) {
    return false;
  }

  if (boot_state_ctx.state.boot_attempts == 0u) {
    return true;
  }

  return boot_state_commit(boot_state_ctx.state.active_slot, UPDATE_NONE, 0u);
}

static void ota_reset_context(void)
{
  memset(&ota_ctx, 0, sizeof(ota_ctx));
}

static void gbl_parser_reset(void)
{
  memset(&gbl_ctx, 0, sizeof(gbl_ctx));
  gbl_ctx.state = GBL_PARSER_IDLE;
}

static bool gbl_parser_begin(void)
{
  gbl_parser_reset();
  gbl_ctx.active = true;
  gbl_ctx.state = GBL_PARSER_READ_TAG;
  gbl_ctx.stream_offset = 0u;
  return true;
}

static bool gbl_parser_require_header_bytes(const uint8_t *data, size_t *index, size_t length)
{
  while ((gbl_ctx.header_count < GBL_HEADER_LENGTH) && (*index < length)) {
    gbl_ctx.header_bytes[gbl_ctx.header_count++] = data[*index];
    (*index)++;
    gbl_ctx.stream_offset++;
  }

  return (gbl_ctx.header_count == GBL_HEADER_LENGTH);
}

static void gbl_parser_start_new_tag(void)
{
  gbl_ctx.current_tag = (uint16_t)(gbl_ctx.header_bytes[0]
                                   | ((uint16_t)gbl_ctx.header_bytes[1] << 8));
  gbl_ctx.current_length = (uint32_t)gbl_ctx.header_bytes[2]
                           | ((uint32_t)gbl_ctx.header_bytes[3] << 8)
                           | ((uint32_t)gbl_ctx.header_bytes[4] << 16)
                           | ((uint32_t)gbl_ctx.header_bytes[5] << 24);
  gbl_ctx.current_consumed = 0u;
  gbl_ctx.header_count = 0u;

  switch (gbl_ctx.current_tag) {
    case GBL_TAG_HEADER:
    case GBL_TAG_INIT:
    case GBL_TAG_METADATA:
      gbl_ctx.state = GBL_PARSER_SKIP_TAG;
      break;
    case GBL_TAG_APP_DATA:
      gbl_ctx.state = GBL_PARSER_STREAM_APP;
      break;
    case GBL_TAG_END:
      gbl_ctx.state = GBL_PARSER_DONE;
      break;
    default:
      gbl_ctx.state = GBL_PARSER_SKIP_TAG;
      break;
  }
}

static bool gbl_parser_feed(uint32_t offset, const uint8_t *data, size_t length)
{
  if (!gbl_ctx.active || gbl_ctx.state == GBL_PARSER_ERROR) {
    return false;
  }

  if (offset != gbl_ctx.stream_offset) {
    printf("GBL offset mismatch: expected %lu got %lu\n",
           (unsigned long)gbl_ctx.stream_offset,
           (unsigned long)offset);
    gbl_ctx.state = GBL_PARSER_ERROR;
    return false;
  }

  size_t index = 0u;

  while (index < length) {
    if (gbl_ctx.state == GBL_PARSER_DONE) {
      printf("GBL parser received data after END tag\n");
      gbl_ctx.state = GBL_PARSER_ERROR;
      return false;
    }

    if (gbl_ctx.state == GBL_PARSER_READ_TAG) {
      if (!gbl_parser_require_header_bytes(data, &index, length)) {
        return true; // Need more data to complete header
      }
      gbl_parser_start_new_tag();
      if (gbl_ctx.state == GBL_PARSER_DONE) {
        continue; // END tag encountered; loop will handle in next iteration
      }
      if (gbl_ctx.current_length == 0u) {
        // Immediate transition for zero-length tags
        gbl_ctx.state = GBL_PARSER_READ_TAG;
        continue;
      }
    }

    size_t remaining = length - index;
    size_t needed = gbl_ctx.current_length - gbl_ctx.current_consumed;
    size_t chunk = (remaining < needed) ? remaining : needed;

    if (chunk == 0u) {
      // No data needed; move to next tag
      gbl_ctx.state = GBL_PARSER_READ_TAG;
      continue;
    }

    if (gbl_ctx.state == GBL_PARSER_SKIP_TAG) {
      index += chunk;
      gbl_ctx.current_consumed += chunk;
      gbl_ctx.stream_offset += chunk;
    } else if (gbl_ctx.state == GBL_PARSER_STREAM_APP) {
      if (!ota_write_chunk(ota_ctx.expected_offset, &data[index], chunk)) {
        gbl_ctx.state = GBL_PARSER_ERROR;
        return false;
      }
      index += chunk;
      gbl_ctx.current_consumed += chunk;
      gbl_ctx.stream_offset += chunk;
    } else if (gbl_ctx.state == GBL_PARSER_DONE) {
      // already handled earlier
      continue;
    }

    if (gbl_ctx.current_consumed == gbl_ctx.current_length) {
      if (gbl_ctx.state == GBL_PARSER_SKIP_TAG || gbl_ctx.state == GBL_PARSER_STREAM_APP) {
        gbl_ctx.state = GBL_PARSER_READ_TAG;
      }
    }
  }

  return true;
}

static bool gbl_parser_finish(uint32_t *out_crc, uint32_t *out_length)
{
  if (!gbl_ctx.active) {
    return false;
  }

  if (gbl_ctx.state != GBL_PARSER_DONE) {
    printf("GBL parser not complete (state=%d)\n", (int)gbl_ctx.state);
    gbl_ctx.state = GBL_PARSER_ERROR;
    return false;
  }

  bool status = ota_finish_update(out_crc, out_length);
  gbl_parser_reset();
  return status;
}

static void ota_abort_update(void)
{
  if (ota_ctx.msc_active) {
    MSC_Deinit();
    ota_ctx.msc_active = false;
  }
  ota_reset_context();
  gbl_parser_reset();
  ota_in_progress = false;
}

static bool ota_address_within_slot(uint32_t address, size_t length)
{
  uint64_t start = (uint64_t)address;
  uint64_t end = start + (uint64_t)length;
  uint32_t slot_start = ota_ctx.base_address;
  uint32_t slot_end = boot_state_slot_end(ota_ctx.slot);

  return (start >= slot_start) && (end <= slot_end);
}

static bool ota_erase_slot(void)
{
  uint32_t slot_end = boot_state_slot_end(ota_ctx.slot);

  for (uint32_t page = ota_ctx.base_address; page < slot_end; page += FLASH_PAGE_SIZE_BYTES) {
    MSC_Status_TypeDef status = MSC_ErasePage((uint32_t *)page);
    if (status != mscReturnOk) {
      return false;
    }
  }

  return true;
}

static bool ota_flash_write_aligned(const uint8_t *data, size_t length)
{
  if (length == 0u) {
    return true;
  }

  if ((length & 0x3u) != 0u) {
    return false;
  }

  uint32_t address = ota_ctx.base_address + ota_ctx.write_cursor;
  if (!ota_address_within_slot(address, length)) {
    return false;
  }

  MSC_Status_TypeDef status = MSC_WriteWord((uint32_t *)address, (const void *)data, (uint32_t)length);
  if (status != mscReturnOk) {
    return false;
  }

  ota_ctx.write_cursor += (uint32_t)length;
  return true;
}

static bool ota_begin_update(AppSlot_t slot)
{
  ota_abort_update();

  ota_ctx.slot = slot;
  ota_ctx.base_address = boot_state_slot_address(slot);
  ota_ctx.expected_offset = 0u;
  ota_ctx.write_cursor = 0u;
  ota_ctx.residual_len = 0u;
  ota_ctx.total_bytes = 0u;
  ota_ctx.crc = CRC32_INITIAL_VALUE;
  ota_ctx.active = true;

  MSC_Init();
  ota_ctx.msc_active = true;

  if (!ota_erase_slot()) {
    printf("Failed to erase slot %d\n", (int)slot);
    ota_abort_update();
    return false;
  }

  if (!gbl_parser_begin()) {
    printf("Failed to initialise GBL parser\n");
    ota_abort_update();
    return false;
  }

  return true;
}

static bool ota_write_chunk(uint32_t offset, const uint8_t *data, size_t length)
{
  if (!ota_ctx.active || !ota_ctx.msc_active) {
    return false;
  }

  if (offset != ota_ctx.expected_offset) {
    printf("OTA offset mismatch: expected %lu got %lu\n",
           (unsigned long)ota_ctx.expected_offset,
           (unsigned long)offset);
    return false;
  }

  if ((offset + length) > APP_SLOT_SIZE_BYTES) {
    printf("OTA write exceeds slot: off=%lu len=%lu\n",
           (unsigned long)offset,
           (unsigned long)length);
    return false;
  }

  ota_ctx.expected_offset += (uint32_t)length;
  ota_ctx.total_bytes += (uint32_t)length;
  ota_ctx.crc = crc32_update(ota_ctx.crc, data, length);

  size_t consumed = 0u;

  if (ota_ctx.residual_len > 0u) {
    while ((ota_ctx.residual_len < 4u) && (consumed < length)) {
      ota_ctx.residual[ota_ctx.residual_len++] = data[consumed++];
    }

    if (ota_ctx.residual_len == 4u) {
      if (!ota_flash_write_aligned(ota_ctx.residual, 4u)) {
        return false;
      }
      ota_ctx.residual_len = 0u;
    }
  }

  size_t remaining = length - consumed;
  size_t aligned = remaining & ~0x3u;

  if (aligned > 0u) {
    if (!ota_flash_write_aligned(&data[consumed], aligned)) {
      return false;
    }
    consumed += aligned;
  }

  while (consumed < length) {
    ota_ctx.residual[ota_ctx.residual_len++] = data[consumed++];
  }

  return true;
}

static bool ota_finish_update(uint32_t *out_crc, uint32_t *out_length)
{
  if (!ota_ctx.active) {
    return false;
  }

  bool success = true;

  if (ota_ctx.residual_len > 0u) {
    uint8_t padded[4] = { 0xFF, 0xFF, 0xFF, 0xFF };
    for (uint8_t i = 0; i < ota_ctx.residual_len; i++) {
      padded[i] = ota_ctx.residual[i];
    }
    success = ota_flash_write_aligned(padded, 4u);
  }

  if (ota_ctx.msc_active) {
    MSC_Deinit();
    ota_ctx.msc_active = false;
  }

  if (!success) {
    ota_abort_update();
    return false;
  }

  if (out_crc != NULL) {
    *out_crc = crc32_finalize(ota_ctx.crc);
  }
  if (out_length != NULL) {
    *out_length = ota_ctx.total_bytes;
  }

  ota_reset_context();
  return true;
}


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

// OTA update dingen
#define SECURE_COMMAND_SEQUENCE_LENGTH 3
const uint8_t secure_command_sequence[SECURE_COMMAND_SEQUENCE_LENGTH] = {0x01, 0x02, 0x03};
#define OTA_CMD_START 0x01  
#define OTA_CMD_WRITE 0x02 
#define OTA_CMD_END   0x03 
#define OTA_CMD_QUERY_SLOT 0x04
#define OTA_RSP_SLOT_INFO  0x81u
#define OTA_SLOT_INFO_PAYLOAD_LEN 3u
#define OTA_FIXED_PACKET_LENGTH 72u
#define OTA_WRITE_HEADER_BYTES (SECURE_COMMAND_SEQUENCE_LENGTH + 1u + sizeof(uint32_t) + sizeof(uint16_t))
#define OTA_WRITE_MAX_PAYLOAD  (OTA_FIXED_PACKET_LENGTH - OTA_WRITE_HEADER_BYTES)
#define OTA_WRITE_EXPECTED_PAYLOAD 62u

_Static_assert(OTA_WRITE_MAX_PAYLOAD > 0, "OTA write payload must be positive");
_Static_assert(OTA_WRITE_MAX_PAYLOAD == OTA_WRITE_EXPECTED_PAYLOAD,
               "Unexpected OTA payload size");

static void send_slot_info_response(AppSlot_t active_slot,
                                    AppSlot_t inactive_slot,
                                    UpdateStatus_t pending_slot)
{
  uint8_t response[OTA_FIXED_PACKET_LENGTH];
  memset(response, 0x00, sizeof(response));
  memcpy(response, secure_command_sequence, SECURE_COMMAND_SEQUENCE_LENGTH);
  response[SECURE_COMMAND_SEQUENCE_LENGTH] = OTA_RSP_SLOT_INFO;
  response[SECURE_COMMAND_SEQUENCE_LENGTH + 1u] = (uint8_t)active_slot;
  response[SECURE_COMMAND_SEQUENCE_LENGTH + 2u] = (uint8_t)inactive_slot;
  response[SECURE_COMMAND_SEQUENCE_LENGTH + 3u] = (uint8_t)pending_slot;

  uint32_t status = transmit_packet(response, OTA_FIXED_PACKET_LENGTH);
  if (status != RAIL_STATUS_NO_ERROR) {
    printf("Slot info response TX failed: %lu\n", (unsigned long)status);
  }
}

/*
* Button callback (GPIO odd interrupt, gericht op SW)
* Forward "button was pressed" naar NSW via SW1 IRQ
*/
void buttonCb(uint8_t intNo) 
{
  (void) intNo;
  // NVIC_SetPendingIRQ(SW1_IRQn);
  TZ_NVIC_SetPendingIRQ_NS(SW1_IRQn);
}

/*
* Init secure radio
* Initialize de globale SL_RAIL_UTIL_HANDLE_INST handle
* Setup aligned secure TX en RX FIFO
* Enable TX, RX en cal events
* Start RX op default channel
* Setup LED, button en button interrupt
*/
void init_secure_radio(void)
{
  RAIL_Handle_t rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST);

  uint16_t size = RAIL_SetTxFifo(rail_handle, tx_fifo, 0, TX_FIFO_SIZE);
  if (size == 0) {
    printf("Failed to set TX FIFO\n");
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
    printf("RAIL_ConfigEvents failed: %u\n", status);
    while(1);
  } else {
    // printf("Config events worked\n");
  }

  status = RAIL_SetRxFifo(rail_handle, rx_fifo, &rx_fifo_size);
  if (status != RAIL_STATUS_NO_ERROR) {
    printf("RAIL_SetRxFifo failed: %u\n", status);
    while(1);
  } else {
    // printf("Set RX FIFO worked\n");
  }
  const RAIL_ChannelConfig_t *mijnConfig = channelConfigs[0];
  status = RAIL_StartRx(rail_handle,
                        mijnConfig->configs->channelNumberStart,
                        NULL);
  if (status != RAIL_STATUS_NO_ERROR) {
    printf("RAIL_StartRx failed: %u\n", status);
    while(1);
  }

  CMU_ClockEnable(cmuClock_GPIO, true);
  // setup LED
  GPIO_PinModeSet(gpioPortB, 2, gpioModePushPull, false);
  
  // setup button int
  GPIOINT_Init();
  GPIO_PinModeSet(gpioPortB, 1, gpioModeInputPull, 1);
  GPIOINT_CallbackRegister(1, buttonCb);
  GPIO_ExtIntConfig(gpioPortB, 1, 1, false, true, true);
}

/*
* Download oudste packet vd RAIL RX FIFO naar gegeven buffer
* Return aantal bytes vd packet, 0 als geen packet / leeg / error
*/
uint16_t download_packet(RAIL_Handle_t rail_handle, uint8_t *rx_buf)
{
  RAIL_RxPacketInfo_t packet_info;
  RAIL_RxPacketDetails_t packet_details;
  RAIL_RxPacketHandle_t packet_handle = RAIL_GetRxPacketInfo(rail_handle,
                                       RAIL_RX_PACKET_HANDLE_OLDEST_COMPLETE,
                                       &packet_info);
  // printf("Download packet in SW\n");
  if (packet_handle != RAIL_RX_PACKET_HANDLE_INVALID) {
    RAIL_CopyRxPacket(rx_buf, &packet_info);
    RAIL_Status_t status =
      RAIL_GetRxPacketDetails(rail_handle, packet_handle, &packet_details);
    if (status != RAIL_STATUS_NO_ERROR) {
      printf("RAIL_GetRxPacketDetails failed: %u\n", status);
      return 0;
    }
    status = RAIL_ReleaseRxPacket(rail_handle, packet_handle);
    if (status != RAIL_STATUS_NO_ERROR) {
      printf("RAIL_ReleaseRxPacket failed: %u\n", status);
      return 0;
    }
    return packet_info.packetBytes;
  }
  return 0;
}

/*
* Transmit packet met gegeven payload en length
* Return RAIL_StartTx status
*/
uint32_t transmit_packet(uint8_t *payload, uint16_t length)
{
  RAIL_Handle_t rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST);
  RAIL_WriteTxFifo(rail_handle, payload, length, false);
  return RAIL_StartTx(rail_handle,
                 channelConfigs[0]->configs->channelNumberStart,
                 RAIL_TX_OPTIONS_DEFAULT,
                 NULL);
}

/*
* Wanneer we packet met secure command sequence ontvangen, call deze
*/
void handle_secure_command(uint16_t packet_length) 
{
  // printf("SECURE COMMAND RECEIVED! COMMAND: %.*s\n", packet_length, secure_rx_buffer);
  if (packet_length < (SECURE_COMMAND_SEQUENCE_LENGTH + 1)) {
    printf("Secure command packet te kort\n");
    return;
  }
  uint8_t ota_command = secure_rx_buffer[SECURE_COMMAND_SEQUENCE_LENGTH];
  switch (ota_command){
    case OTA_CMD_QUERY_SLOT: {
      AppSlot_t active_slot = SLOT_A;
      AppSlot_t inactive_slot = SLOT_B;
      UpdateStatus_t pending_slot = UPDATE_NONE;

      if (!boot_state_manager_init()) {
        printf("OTA_CMD_QUERY_SLOT: boot state unavailable\n");
      } else {
        const NvmBootState_t *state = boot_state_get_current();
        if ((state != NULL) && slot_value_valid(state->active_slot)) {
          active_slot = state->active_slot;
          pending_slot = pending_value_valid(state->pending_slot)
                          ? state->pending_slot
                          : UPDATE_NONE;
        } else {
          printf("OTA_CMD_QUERY_SLOT: boot state invalid, using defaults\n");
        }
      }

      if (!slot_value_valid(active_slot)) {
        active_slot = SLOT_A;
      }
      inactive_slot = boot_state_other_slot(active_slot);

      printf("OTA_CMD_QUERY_SLOT: active=%d inactive=%d pending=%d\n",
             (int)active_slot,
             (int)inactive_slot,
             (int)pending_slot);

      send_slot_info_response(active_slot, inactive_slot, pending_slot);
      break;
    }
    case OTA_CMD_START:
      printf("OTA_CMD_START: preparing slot\n");

      if (!boot_state_manager_init()) {
        printf("Boot state unavailable; skipping OTA start\n");
        return;
      }

      if (ota_in_progress) {
        printf("OTA already in progress, aborting previous session\n");
        ota_abort_update();
        ota_in_progress = false;
      }

      ota_target_slot = boot_state_get_inactive_slot();
      ota_target_base = boot_state_slot_address(ota_target_slot);

      printf("Preparing slot %d @ 0x%08lX for OTA\n",
             (int)ota_target_slot,
             (unsigned long)ota_target_base);

      if (!ota_begin_update(ota_target_slot)) {
        printf("Failed to prepare slot %d for OTA\n", (int)ota_target_slot);
        ota_in_progress = false;
        return;
      }

      printf("Slot %d erased and ready\n", (int)ota_target_slot);
      ota_in_progress = true;
      break;
    case OTA_CMD_WRITE:
      if (!ota_in_progress) {
        printf("OTA_CMD_WRITE received zonder OTA_CMD_START\n");
        return;
      }
      
      if (packet_length < OTA_WRITE_HEADER_BYTES) {
        printf("OTA_CMD_WRITE packet te kort (%u)\n", (unsigned)packet_length);
        return;
      }

      if (packet_length != OTA_FIXED_PACKET_LENGTH) {
        printf("OTA_CMD_WRITE afwijkende lengte: %u\n", (unsigned)packet_length);
      }

      uint32_t address;
      memcpy(&address, &secure_rx_buffer[SECURE_COMMAND_SEQUENCE_LENGTH + 1], sizeof(uint32_t));
      uint32_t absolute_address = ota_target_base + address;

      uint16_t chunk_length;
      memcpy(&chunk_length,
             &secure_rx_buffer[SECURE_COMMAND_SEQUENCE_LENGTH + 1 + sizeof(uint32_t)],
             sizeof(uint16_t));

      if (chunk_length == 0u) {
        printf("OTA_CMD_WRITE: lege chunk\n");
        return;
      }

      if (chunk_length > OTA_WRITE_MAX_PAYLOAD) {
        printf("OTA_CMD_WRITE chunk te groot: %u\n", (unsigned)chunk_length);
        return;
      }

      size_t available = packet_length - OTA_WRITE_HEADER_BYTES;
      if (chunk_length > available) {
        printf("OTA_CMD_WRITE chunk groter dan payload (%u > %u)\n",
               (unsigned)chunk_length,
               (unsigned)available);
        return;
      }

      uint8_t *data = &secure_rx_buffer[SECURE_COMMAND_SEQUENCE_LENGTH + 1
                                         + sizeof(uint32_t)
                                         + sizeof(uint16_t)];

      if (!gbl_parser_feed(address, data, chunk_length)) {
        printf("GBL parser failed @ 0x%08lX (len=%u)\n",
               (unsigned long)absolute_address,
               (unsigned)chunk_length);
        ota_abort_update();
        ota_in_progress = false;
        return;
      }
      break;
    case OTA_CMD_END:
      if (!ota_in_progress) {
        printf("OTA_CMD_END zonder OTA_CMD_START\n");
        return;
      }
      
      printf("OTA_CMD_END: Verifying and rebooting...\n");
      ota_in_progress = false; // No longer in progress

      uint32_t final_crc = 0u;
      uint32_t total_length = 0u;

      if (!gbl_parser_finish(&final_crc, &total_length)) {
        printf("GBL finalize failed\n");
        ota_abort_update();
        return;
      }

      printf("OTA complete: %lu bytes, CRC=0x%08lX\n",
             (unsigned long)total_length,
             (unsigned long)final_crc);

      if (boot_state_mark_update_pending(ota_target_slot)) {
        printf("Marked slot %d as pending, rebooting for activation\n",
               (int)ota_target_slot);
        NVIC_SystemReset();
      } else {
        printf("Failed to mark pending update state\n");
      }

      break;

    default:
      printf("Unknown secure command: 0x%02X\n", ota_command);
      break;
  }
}

/*
* RAIL library event callback functie
* Setup verschillende events, enkel RX doet iets speciaal
* Bij RX event: Hou packet vast in RX FIFO, zet SW0 IRQ pending om NS te waarschuwen
*
* Issue: Mogelijk dat als NS traag is met downloaden, dat RX FIFO overloopt ...
*/
SL_CODE_RAM void sl_rail_util_on_event(sl_rail_handle_t rail_handle, sl_rail_events_t events)
{
  if (events & RAIL_EVENTS_TX_COMPLETION) {
    // printf("EVENT: TX completed\n");
  }
  else if (events & RAIL_EVENT_RX_PACKET_RECEIVED) {
    RAIL_RxPacketInfo_t packet_info;
    RAIL_RxPacketHandle_t packet_handle = RAIL_GetRxPacketInfo(rail_handle,
                                         RAIL_RX_PACKET_HANDLE_NEWEST,
                                         &packet_info);
    if (packet_handle == RAIL_RX_PACKET_HANDLE_INVALID) {
      printf("RAIL_GetRxPacketInfo failed\n");
      return;
    }
    RAIL_CopyRxPacket(secure_rx_buffer, &packet_info);
    if ((packet_info.packetBytes >= SECURE_COMMAND_SEQUENCE_LENGTH) &&
        (memcmp(secure_rx_buffer, secure_command_sequence, SECURE_COMMAND_SEQUENCE_LENGTH) == 0)){
        // Secure command
        handle_secure_command(packet_info.packetBytes);
        RAIL_ReleaseRxPacket(rail_handle, packet_handle);
    } else { // Normal packet, voor NS
      if (RAIL_HoldRxPacket(rail_handle) == RAIL_RX_PACKET_HANDLE_INVALID) {
        printf("RAIL_HoldRxPacket failed\n");
        while(1);
      }
      // Laat NS weten dat packet klaar is
      TZ_NVIC_SetPendingIRQ_NS(SW0_IRQn);
    }
  }
  else if (events & RAIL_EVENT_CAL_NEEDED) {
    // printf("EVENT: Calibration needed\n");
    RAIL_Status_t status = RAIL_Calibrate(rail_handle, NULL, RAIL_CAL_ALL_PENDING);
    if (status != RAIL_STATUS_NO_ERROR) {
      printf("RAIL_Calibrate failed: %u\n", status);
      while(1);
    }
  }
  else {
    printf("Wss FIFO vol\n");
    // Wss RX fifo vol want NS traag met downloaden, reset zodat we geen important packets missen
    // Edge case: RX FIFO net vol + net nieuwe secure command = secure verloren? 
    // Maar events bevat ook RAIL_EVENT_RX_FIFO_ALMOST_FULL dus denk niet mogelijk want dan resetten we ook hier? 
    RAIL_ResetFifo(rail_handle, false, true);
  }
}