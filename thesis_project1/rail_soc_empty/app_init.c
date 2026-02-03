/***************************************************************************//**
 * @file
 * @brief app_init.c
 *******************************************************************************
 * # License
 * <b>Copyright 2018 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
  }

  if (remaining > 0u) {
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
#include "em_cmu.h"
#include "rail.h"
#include "rail_types.h"
#include "simplicity_sdk_2025.6.2/platform/service/sleeptimer/inc/sl_sleeptimer.h"
#include "sl_common.h"
#include "sl_rail_sdk_fifo_size_config.h"
#include "sl_rail_util_init.h"
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "rail_config.h"
#include "simplicity_sdk_2025.6.2/platform/emdrv/gpiointerrupt/inc/gpiointerrupt.h"
#include "../boot_state.h"
#include "ota_image_A.h"
#include "ota_image_B.h"

#define SECURE_COMMAND_SEQUENCE_LENGTH 3
const uint8_t secure_command_sequence[SECURE_COMMAND_SEQUENCE_LENGTH] = {0x01, 0x02, 0x03};
#define OTA_CMD_START 0x01
#define OTA_CMD_WRITE 0x02
#define OTA_CMD_END   0x03
#define OTA_CMD_QUERY_SLOT 0x04u
#define OTA_RSP_SLOT_INFO  0x81u
#define OTA_SLOT_INFO_PAYLOAD_LENGTH 3u
#define OTA_HANDSHAKE_TIMEOUT_MS 500u

#define GBL_HEADER_LENGTH 6u
#define GBL_TAG_HEADER        0x0000u
#define GBL_TAG_INIT          0x0001u
#define GBL_TAG_METADATA      0x0002u
#define GBL_TAG_APP_DATA      0x0003u
#define GBL_TAG_END           0xFFFFu
#define GBL_TAG_COUNT         5u
#define GBL_OVERHEAD_BYTES    (GBL_HEADER_LENGTH * GBL_TAG_COUNT)

SL_ALIGN(RAIL_FIFO_ALIGNMENT)
static uint8_t tx_fifo[SL_RAIL_SDK_TX_FIFO_SIZE]
SL_ATTRIBUTE_ALIGN(RAIL_FIFO_ALIGNMENT);

#define OTA_FRAME_LENGTH 72u
#define OTA_RX_BUFFER_SIZE 128u
#define OTA_HEADER_BYTES   (SECURE_COMMAND_SEQUENCE_LENGTH + 1u + sizeof(uint32_t) + sizeof(uint16_t))
#define OTA_CHUNK_DATA_BYTES (OTA_FRAME_LENGTH - OTA_HEADER_BYTES)
#define OTA_CHUNK_EXPECTED_BYTES 62u
#define OTA_TX_TIMEOUT_MS 50u

_Static_assert(OTA_CHUNK_DATA_BYTES > 0, "OTA frame configuration invalid");
_Static_assert(OTA_CHUNK_DATA_BYTES == OTA_CHUNK_EXPECTED_BYTES,
               "Unexpected OTA chunk size");

static uint8_t ota_packet_buffer[OTA_FRAME_LENGTH];
static volatile bool start_update = false;
static bool ota_in_progress = false;
static volatile bool tx_in_flight = false;
static volatile bool rx_packet_ready = false;
static volatile uint16_t rx_packet_length = 0u;
static uint8_t rx_packet_buffer[OTA_RX_BUFFER_SIZE];

typedef struct {
  const uint8_t *data;
  size_t length;
} gbl_segment_t;

typedef struct {
  AppSlot_t slot;
  const uint8_t *image_data;
  size_t image_length;
  const char *label;
} ota_image_descriptor_t;

static const ota_image_descriptor_t ota_image_table[] = {
  { SLOT_A, image_A_bin, (size_t)image_A_bin_len, "Slot A" },
  { SLOT_B, image_B_bin, (size_t)image_B_bin_len, "Slot B" },
};

static const char *slot_to_string(AppSlot_t slot);
static const ota_image_descriptor_t *find_image_descriptor(AppSlot_t slot);
static bool send_slot_query(void);
static bool await_slot_response(AppSlot_t *active_slot,
                                AppSlot_t *inactive_slot,
                                UpdateStatus_t *pending_status);
static bool select_update_image(const ota_image_descriptor_t **out_descriptor);

static size_t gbl_write_tag_header(uint8_t *destination, uint16_t tag, uint32_t length);
static bool transmit_packet(const uint8_t *payload, uint16_t length);
static void send_ota_update(void);
static bool wait_for_tx_idle(uint32_t timeout_ms);

void buttonCb(uint8_t intNo) 
{
  (void) intNo;
  start_update = true;
}

RAIL_Handle_t rail_app_init(void)
{
  RAIL_Handle_t rail_handle =
    sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST0);

  uint16_t size = RAIL_SetTxFifo(rail_handle, tx_fifo, 0, SL_RAIL_SDK_TX_FIFO_SIZE);
  if (size == 0) {
    printf("Failed to set TX FIFO\n");
    while(1);
  } else {
    printf("TX FIFO set, size: %u\n", size);
  }
  RAIL_Status_t status = RAIL_ConfigEvents(rail_handle,
                                           RAIL_EVENTS_ALL,
                                           RAIL_EVENTS_TX_COMPLETION
                                           | RAIL_EVENTS_RX_COMPLETION
                                           | RAIL_EVENT_CAL_NEEDED);
  if (status != RAIL_STATUS_NO_ERROR) {
    printf("RAIL_ConfigEvents failed: %u\n", (unsigned)status);
    while(1);
  }
  
  status = RAIL_StartRx(rail_handle,
                        channelConfigs[0]->configs->channelNumberStart,
                        NULL);
  if (status != RAIL_STATUS_NO_ERROR) {
    printf("RAIL_StartRx failed: %u\n", (unsigned)status);
    while(1);
  }

  CMU_ClockEnable(cmuClock_GPIO, true);
  GPIOINT_Init();
  GPIO_PinModeSet(gpioPortB, 1, gpioModeInputPull, 1);
  GPIOINT_CallbackRegister(1, buttonCb);
  GPIO_ExtIntConfig(gpioPortB, 1, 1, false, true, true);
  return rail_handle;
}

static bool transmit_packet(const uint8_t *payload, uint16_t length)
{
  if (length == 0u) {
    return true;
  }

  if (length != OTA_FRAME_LENGTH) {
    printf("Unexpected frame length: %u\n", (unsigned)length);
    return false;
  }

  RAIL_Handle_t rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST0);

  if (!wait_for_tx_idle(OTA_TX_TIMEOUT_MS)) {
    printf("Previous TX still active\n");
    return false;
  }

  while (RAIL_GetTxFifoSpaceAvailable(rail_handle) < length) {
    // Busy wait until enough FIFO space is available
  }

  RAIL_WriteTxFifo(rail_handle, payload, length, false);

  tx_in_flight = true;
  RAIL_Status_t status = RAIL_StartTx(rail_handle,
                                      channelConfigs[0]->configs->channelNumberStart,
                                      RAIL_TX_OPTIONS_DEFAULT,
                                      NULL);
  if (status != RAIL_STATUS_NO_ERROR) {
    tx_in_flight = false;
    printf("RAIL_StartTx failed: %u\n", (unsigned)status);
    return false;
  }

  if (!wait_for_tx_idle(OTA_TX_TIMEOUT_MS)) {
    printf("TX completion timeout\n");
    tx_in_flight = false;
    (void)RAIL_Idle(rail_handle, RAIL_IDLE_ABORT, true);
    return false;
  }

  return true;
}

static bool wait_for_tx_idle(uint32_t timeout_ms)
{
  uint32_t waited_ms = 0u;

  while (tx_in_flight) {
    if (waited_ms >= timeout_ms) {
      return false;
    }
    sl_sleeptimer_delay_millisecond(1);
    waited_ms++;
  }

  return true;
}





// -----------------------------------------------------------------------------
//                          Static Function Definitions
// -----------------------------------------------------------------------------
static size_t gbl_write_tag_header(uint8_t *destination, uint16_t tag, uint32_t length)
{
  destination[0] = (uint8_t)(tag & 0xFFu);
  destination[1] = (uint8_t)((tag >> 8) & 0xFFu);
  destination[2] = (uint8_t)(length & 0xFFu);
  destination[3] = (uint8_t)((length >> 8) & 0xFFu);
  destination[4] = (uint8_t)((length >> 16) & 0xFFu);
  destination[5] = (uint8_t)((length >> 24) & 0xFFu);
  return GBL_HEADER_LENGTH;
}

static const char *slot_to_string(AppSlot_t slot)
{
  switch (slot) {
    case SLOT_A:
      return "Slot A";
    case SLOT_B:
      return "Slot B";
    default:
      return "Unknown Slot";
  }
}

static const ota_image_descriptor_t *find_image_descriptor(AppSlot_t slot)
{
  const size_t descriptor_count = sizeof(ota_image_table) / sizeof(ota_image_table[0]);
  for (size_t i = 0u; i < descriptor_count; i++) {
    if (ota_image_table[i].slot == slot) {
      return &ota_image_table[i];
    }
  }
  return NULL;
}

static bool send_slot_query(void)
{
  memset(ota_packet_buffer, 0x00, OTA_FRAME_LENGTH);
  memcpy(ota_packet_buffer, secure_command_sequence, SECURE_COMMAND_SEQUENCE_LENGTH);
  ota_packet_buffer[SECURE_COMMAND_SEQUENCE_LENGTH] = OTA_CMD_QUERY_SLOT;

  size_t padding = OTA_FRAME_LENGTH - (SECURE_COMMAND_SEQUENCE_LENGTH + 1u);
  if (padding > 0u) {
    memset(&ota_packet_buffer[SECURE_COMMAND_SEQUENCE_LENGTH + 1u], 0x00, padding);
  }

  if (!transmit_packet(ota_packet_buffer, OTA_FRAME_LENGTH)) {
    return false;
  }

  return true;
}

static bool await_slot_response(AppSlot_t *active_slot,
                                AppSlot_t *inactive_slot,
                                UpdateStatus_t *pending_status)
{
  uint32_t waited_ms = 0u;
  while (!rx_packet_ready && (waited_ms < OTA_HANDSHAKE_TIMEOUT_MS)) {
    sl_sleeptimer_delay_millisecond(1);
    waited_ms++;
  }

  if (!rx_packet_ready) {
    return false;
  }

  uint16_t length = rx_packet_length;
  if (length > OTA_RX_BUFFER_SIZE) {
    length = OTA_RX_BUFFER_SIZE;
  }

  uint8_t local_buffer[OTA_RX_BUFFER_SIZE];
  memcpy(local_buffer, rx_packet_buffer, length);

  rx_packet_ready = false;
  rx_packet_length = 0u;

  const size_t expected_length = SECURE_COMMAND_SEQUENCE_LENGTH + 1u + OTA_SLOT_INFO_PAYLOAD_LENGTH;
  if (length < expected_length) {
    printf("Slot info response too short: %u (expected >= %u)\n",
           (unsigned)length,
           (unsigned)expected_length);
    return false;
  }

  if (memcmp(local_buffer, secure_command_sequence, SECURE_COMMAND_SEQUENCE_LENGTH) != 0) {
    printf("Slot info response sequence mismatch\n");
    return false;
  }

  size_t index = SECURE_COMMAND_SEQUENCE_LENGTH;
  uint8_t command = local_buffer[index++];
  if (command != OTA_RSP_SLOT_INFO) {
    printf("Unexpected slot response command: 0x%02X\n", command);
    return false;
  }

  AppSlot_t reported_active = (AppSlot_t)local_buffer[index++];
  AppSlot_t reported_inactive = (AppSlot_t)local_buffer[index++];
  UpdateStatus_t reported_pending = (UpdateStatus_t)local_buffer[index++];

  switch (reported_pending) {
    case UPDATE_NONE:
    case UPDATE_PENDING_A:
    case UPDATE_PENDING_B:
      break;
    default:
      reported_pending = UPDATE_NONE;
      break;
  }

  if ((reported_active != SLOT_A && reported_active != SLOT_B)
      || (reported_inactive != SLOT_A && reported_inactive != SLOT_B)
      || (reported_active == reported_inactive)) {
    return false;
  }

  if (active_slot != NULL) {
    *active_slot = reported_active;
  }
  if (inactive_slot != NULL) {
    *inactive_slot = reported_inactive;
  }
  if (pending_status != NULL) {
    *pending_status = reported_pending;
  }

  return true;
}

static bool select_update_image(const ota_image_descriptor_t **out_descriptor)
{
  AppSlot_t active_slot = SLOT_A;
  AppSlot_t inactive_slot = SLOT_B;
  UpdateStatus_t pending_status = UPDATE_NONE;

  rx_packet_ready = false;
  rx_packet_length = 0u;

  if (!send_slot_query()) {
    printf("Failed to transmit slot query\n");
    return false;
  }

  if (!await_slot_response(&active_slot, &inactive_slot, &pending_status)) {
    printf("No slot info response received from target\n");
    return false;
  }

  const ota_image_descriptor_t *descriptor = find_image_descriptor(inactive_slot);
  if (descriptor == NULL) {
    printf("No OTA image available for reported slot %d\n", (int)inactive_slot);
    return false;
  }

  printf("Slot query response: active=%s inactive=%s pending=%u\n",
         slot_to_string(active_slot),
         descriptor->label,
         (unsigned)pending_status);

  if (out_descriptor != NULL) {
    *out_descriptor = descriptor;
  }

  return true;
}

static void send_ota_update(void)
{
  if (ota_in_progress) {
    printf("OTA already in progress\n");
    return;
  }

  ota_in_progress = true;

  bool success = false;
  const ota_image_descriptor_t *image_desc = NULL;

  if (!select_update_image(&image_desc)) {
    goto cleanup;
  }

  success = true;

  uint8_t header_tag[GBL_HEADER_LENGTH];
  uint8_t init_tag[GBL_HEADER_LENGTH];
  uint8_t metadata_tag[GBL_HEADER_LENGTH];
  uint8_t app_tag[GBL_HEADER_LENGTH];
  uint8_t end_tag[GBL_HEADER_LENGTH];

  gbl_write_tag_header(header_tag, GBL_TAG_HEADER, 0u);
  gbl_write_tag_header(init_tag, GBL_TAG_INIT, 0u);
  gbl_write_tag_header(metadata_tag, GBL_TAG_METADATA, 0u);
  gbl_write_tag_header(app_tag,
                       GBL_TAG_APP_DATA,
                       (uint32_t)image_desc->image_length);
  gbl_write_tag_header(end_tag, GBL_TAG_END, 0u);

  const gbl_segment_t segments[] = {
    { header_tag, sizeof(header_tag) },
    { init_tag, sizeof(init_tag) },
    { metadata_tag, sizeof(metadata_tag) },
    { app_tag, sizeof(app_tag) },
    { image_desc->image_data, image_desc->image_length },
    { end_tag, sizeof(end_tag) },
  };
  const size_t segment_count = sizeof(segments) / sizeof(segments[0]);

  size_t total_length_size = 0u;
  for (size_t i = 0u; i < segment_count; i++) {
    total_length_size += segments[i].length;
  }

  if (total_length_size > UINT32_MAX) {
    printf("GBL stream length exceeds 32-bit range\n");
    success = false;
    goto cleanup;
  }

  const uint32_t total_length = (uint32_t)total_length_size;

  printf("Starting OTA update targeting %s... Stream size: %lu bytes (image %lu bytes)\n",
         image_desc->label,
         (unsigned long)total_length,
         (unsigned long)image_desc->image_length);

  memcpy(ota_packet_buffer, secure_command_sequence, SECURE_COMMAND_SEQUENCE_LENGTH);
  ota_packet_buffer[SECURE_COMMAND_SEQUENCE_LENGTH] = OTA_CMD_START;

  uint8_t *frame_ptr = &ota_packet_buffer[SECURE_COMMAND_SEQUENCE_LENGTH + 1u];
  uint32_t zero_offset = 0u;
  uint16_t zero_length = 0u;
  memcpy(frame_ptr, &zero_offset, sizeof(uint32_t));
  frame_ptr += sizeof(uint32_t);
  memcpy(frame_ptr, &zero_length, sizeof(uint16_t));
  frame_ptr += sizeof(uint16_t);
  memset(frame_ptr, 0x00, OTA_FRAME_LENGTH - (size_t)(frame_ptr - ota_packet_buffer));

  success = transmit_packet(ota_packet_buffer, OTA_FRAME_LENGTH);
  if (!success) {
    printf("Failed to send OTA_CMD_START\n");
    goto cleanup;
  }

  printf("START command sent. Waiting 2 seconds for target to erase...\n");
  sl_sleeptimer_delay_millisecond(2000);

  uint32_t stream_offset = 0u;
  uint32_t last_percent_reported = 0u;
  size_t segment_index = 0u;
  size_t segment_offset = 0u;

  while (stream_offset < total_length) {
    uint32_t remaining_stream = total_length - stream_offset;
    size_t target_bytes = (remaining_stream > OTA_CHUNK_DATA_BYTES)
                          ? OTA_CHUNK_DATA_BYTES
                          : (size_t)remaining_stream;

    uint8_t *buffer_ptr = ota_packet_buffer;
    memcpy(buffer_ptr, secure_command_sequence, SECURE_COMMAND_SEQUENCE_LENGTH);
    buffer_ptr += SECURE_COMMAND_SEQUENCE_LENGTH;

    *buffer_ptr++ = OTA_CMD_WRITE;

    memcpy(buffer_ptr, &stream_offset, sizeof(uint32_t));
    buffer_ptr += sizeof(uint32_t);

    uint8_t *length_field = buffer_ptr;
    uint16_t placeholder_length = 0u;
    memcpy(length_field, &placeholder_length, sizeof(uint16_t));
    buffer_ptr += sizeof(uint16_t);

    uint8_t *payload_start = buffer_ptr;

    size_t remaining = target_bytes;
    while (remaining > 0u && segment_index < segment_count) {
      const gbl_segment_t *segment = &segments[segment_index];
      size_t segment_remaining = segment->length - segment_offset;
      size_t copy_len = (remaining < segment_remaining) ? remaining : segment_remaining;

      memcpy(buffer_ptr, &segment->data[segment_offset], copy_len);
      buffer_ptr += copy_len;
      remaining -= copy_len;
      segment_offset += copy_len;

      if (segment_offset == segment->length) {
        segment_index++;
        segment_offset = 0u;
      }
    }

    if (remaining > 0u) {
      printf("GBL stream truncated unexpectedly\n");
      success = false;
      goto cleanup;
    }

    size_t chunk_bytes = (size_t)(buffer_ptr - payload_start);
    uint16_t chunk_length = (uint16_t)chunk_bytes;
    memcpy(length_field, &chunk_length, sizeof(uint16_t));

    size_t padding = OTA_FRAME_LENGTH - (size_t)(buffer_ptr - ota_packet_buffer);
    if (padding > 0u) {
      memset(buffer_ptr, 0xFF, padding);
    }

    if (!transmit_packet(ota_packet_buffer, OTA_FRAME_LENGTH)) {
      printf("Failed to send OTA chunk at offset %lu\n", (unsigned long)stream_offset);
      success = false;
      goto cleanup;
    }

    stream_offset += (uint32_t)chunk_bytes;

    uint32_t percent = (stream_offset * 100u) / total_length;
    if ((percent - last_percent_reported) >= 5u || stream_offset == total_length) {
      printf("Progress: %u%% (%lu/%lu bytes)\n",
             (unsigned)percent,
             (unsigned long)stream_offset,
             (unsigned long)total_length);
      last_percent_reported = percent;
    }

    sl_sleeptimer_delay_millisecond(5);
  }

  memcpy(ota_packet_buffer, secure_command_sequence, SECURE_COMMAND_SEQUENCE_LENGTH);
  ota_packet_buffer[SECURE_COMMAND_SEQUENCE_LENGTH] = OTA_CMD_END;
  frame_ptr = &ota_packet_buffer[SECURE_COMMAND_SEQUENCE_LENGTH + 1u];
  memcpy(frame_ptr, &stream_offset, sizeof(uint32_t));
  frame_ptr += sizeof(uint32_t);
  memcpy(frame_ptr, &zero_length, sizeof(uint16_t));
  frame_ptr += sizeof(uint16_t);
  memset(frame_ptr, 0x00, OTA_FRAME_LENGTH - (size_t)(frame_ptr - ota_packet_buffer));

  if (!transmit_packet(ota_packet_buffer, OTA_FRAME_LENGTH)) {
    printf("Failed to send OTA_CMD_END\n");
    success = false;
    goto cleanup;
  }

  printf("END command sent. Target should reboot.\n");

cleanup:
  ota_in_progress = false;
  if (!success) {
    printf("OTA transfer aborted\n");
  }
}

RAIL_Handle_t app_init(void)
{
  RAIL_Handle_t rail_handle = rail_app_init();
  printf("Updater device initialized. Press Button 1 to start OTA update.\n");
  return rail_handle;
}

void app_process_action(RAIL_Handle_t rail_handle)
{
  (void)rail_handle;

  if (start_update) {
    start_update = false;
    send_ota_update();
    printf("Update process finished. Press Button 1 to try again.\n");
  }
}

void sl_rail_util_on_event(sl_rail_handle_t rail_handle, sl_rail_events_t events)
{
  (void)rail_handle;

  if (events & (RAIL_EVENTS_TX_COMPLETION
                | RAIL_EVENT_TX_ABORTED
                | RAIL_EVENT_TX_BLOCKED
                | RAIL_EVENT_TX_UNDERFLOW)) {
    tx_in_flight = false;
  }

  if (events & RAIL_EVENT_CAL_NEEDED) {
    (void)RAIL_Calibrate(rail_handle, NULL, RAIL_CAL_ALL_PENDING);
  }

  if (events & RAIL_EVENT_RX_PACKET_RECEIVED) {
    RAIL_RxPacketInfo_t packet_info;
    RAIL_RxPacketHandle_t handle = RAIL_GetRxPacketInfo(rail_handle,
                                                        RAIL_RX_PACKET_HANDLE_NEWEST,
                                                        &packet_info);
    if (handle != RAIL_RX_PACKET_HANDLE_INVALID) {
      if (!rx_packet_ready) {
        if (packet_info.packetBytes <= OTA_RX_BUFFER_SIZE) {
          RAIL_CopyRxPacket(rx_packet_buffer, &packet_info);
          if ((packet_info.packetBytes >= (SECURE_COMMAND_SEQUENCE_LENGTH + 1u))
              && (memcmp(rx_packet_buffer,
                         secure_command_sequence,
                         SECURE_COMMAND_SEQUENCE_LENGTH) == 0)
              && (rx_packet_buffer[SECURE_COMMAND_SEQUENCE_LENGTH] == OTA_RSP_SLOT_INFO)) {
            rx_packet_length = packet_info.packetBytes;
            rx_packet_ready = true;
          }
        } else {
          printf("RX packet too large (%u bytes); dropping\n",
                 (unsigned)packet_info.packetBytes);
        }
      }
      RAIL_ReleaseRxPacket(rail_handle, handle);
    }
  }
}