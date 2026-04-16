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
#include <stdbool.h>
#include <stdint.h>
#include <string.h>

#include "app_init.h"
#include "app_log.h"
#include "sl_button.h"
#include "sl_main_init.h"
#include "sl_rail.h"
#include "sl_rail_types.h"
#include "sl_rail_util_init.h"
#include "sl_simple_button_instances.h"

#include "../ota_protocol.h"
#include "generated/sharing_ns_slot_a_image.h"
#include "generated/sharing_ns_slot_b_image.h"
#include "generated/sharing_s_slot_a_image.h"
#include "generated/sharing_s_slot_b_image.h"

#define SERVER_TX_BUFFER_LENGTH 256U
#define SERVER_RX_BUFFER_LENGTH 160U
#define SERVER_TRANSFER_ID      0x5A5A0001UL
#define SERVER_WAIT_SPIN_COUNT  2500000UL
#define SERVER_PROGRESS_STEP_PERCENT 10U
#define SERVER_PERF_REPORT_PERIOD_MS 10000U
#define SERVER_PERF_MAGIC 0x50465231UL
#define SERVER_PERF_FRAME_PAYLOAD_LEN 14U
#define SERVER_PERF_FRAME_LEN (1U + SERVER_PERF_FRAME_PAYLOAD_LEN)
#define SERVER_PERF_TYPE_REQUEST 1U
#define SERVER_PERF_TYPE_RESPONSE 2U

typedef enum {
  SERVER_PHASE_IDLE = 0,
  SERVER_PHASE_WAIT_BEGIN_ACK,
  SERVER_PHASE_WAIT_CHUNK_ACK,
  SERVER_PHASE_WAIT_END_ACK,
} server_phase_t;

typedef struct {
  const uint8_t *secure_image_data;
  uint32_t secure_image_size;
  const uint8_t *nonsecure_image_data;
  uint32_t nonsecure_image_size;
} slot_image_set_t;

typedef struct {
  bool active;
  AppSlot_t target_slot;
  OtaUpdateKind_t offer_kind;
  uint8_t image_index;
  uint32_t transfer_id;
  server_phase_t phase;
  OtaUpdateKind_t current_image_kind;
  const uint8_t *current_image_data;
  uint32_t current_image_size;
  uint32_t current_chunk_index;
  uint32_t current_chunk_count;
  uint8_t next_progress_percent;
} server_session_t;

typedef struct {
  uint32_t rx_packets;
  uint32_t rx_bytes;
  uint32_t rx_frame_errors;
  uint32_t rx_fatal_errors;
  uint32_t tx_frames;
  uint32_t tx_bytes;
  uint32_t tx_failures;
  uint32_t ota_queries;
  uint32_t ota_acks;
  uint32_t ota_sessions_started;
  uint32_t ota_sessions_finished;
  uint32_t perf_req_rx;
  uint32_t perf_resp_tx;
  uint32_t perf_invalid;
  uint32_t cal_needed;
  uint32_t cal_fail;
} server_perf_counters_t;

SL_RAIL_DECLARE_FIFO_BUFFER(tx_fifo, SERVER_TX_BUFFER_LENGTH);
static uint8_t rx_buffer[SERVER_RX_BUFFER_LENGTH];
static uint8_t tx_frame[1u + sizeof(OtaPacketHeader_t) + OTA_MAX_CHUNK_BYTES];
static volatile bool packet_received = false;
static volatile bool tx_done = false;
static volatile bool tx_error = false;
static server_session_t session = { 0 };
static volatile server_perf_counters_t perf_totals = { 0 };
static server_perf_counters_t perf_last_report = { 0 };
static uint32_t perf_next_report_time_us = 0u;
static uint32_t perf_last_report_time_us = 0u;
static bool update_ready = false;
static OtaUpdateKind_t selected_offer_kind = OTA_UPDATE_FULL;
static bool previous_button0_pressed = false;
static bool previous_button1_pressed = false;

static const slot_image_set_t slot_image_sets[] = {
  {
    sharing_s_slot_a_image,
    sizeof(sharing_s_slot_a_image),
    sharing_ns_slot_a_image,
    sizeof(sharing_ns_slot_a_image),
  },
  {
    sharing_s_slot_b_image,
    sizeof(sharing_s_slot_b_image),
    sharing_ns_slot_b_image,
    sizeof(sharing_ns_slot_b_image),
  },
};

static char slot_label(AppSlot_t slot)
{
  return (slot == SLOT_B) ? 'B' : 'A';
}

static void init_radio(void);
static void poll_buttons(void);
static void process_received_packets(sl_rail_handle_t rail_handle);
static void maybe_report_perf_metrics(sl_rail_handle_t rail_handle);
static bool select_server_image(AppSlot_t target_slot,
                                OtaUpdateKind_t offer_kind,
                                uint8_t image_index,
                                OtaUpdateKind_t *image_kind,
                                const uint8_t **image_data,
                                uint32_t *image_size);
static bool send_frame(sl_rail_handle_t rail_handle,
                       const OtaPacketHeader_t *header,
                       const uint8_t *payload,
                       uint16_t payload_len);
static bool send_raw_frame(sl_rail_handle_t rail_handle,
                           const uint8_t *frame,
                           uint16_t frame_len);
static void process_perf_packet(sl_rail_handle_t rail_handle,
                                const uint8_t *frame,
                                uint16_t frame_len);
static uint32_t read_u32_le(const uint8_t *src);
static bool session_send_begin(sl_rail_handle_t rail_handle);
static bool session_send_next_chunk(sl_rail_handle_t rail_handle);
static bool session_send_end(sl_rail_handle_t rail_handle);
static void session_clear(void);
static void session_start(OtaUpdateKind_t offer_kind, AppSlot_t target_slot);
static void session_handle_ack(sl_rail_handle_t rail_handle, const OtaPacketHeader_t *ack);
static void session_finish(sl_rail_handle_t rail_handle);

int main(void)
{
  sl_main_init();
  app_init();
  init_radio();

  sl_rail_handle_t rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST0);

  perf_last_report_time_us = (uint32_t)sl_rail_get_time(rail_handle);
  perf_next_report_time_us = perf_last_report_time_us + (SERVER_PERF_REPORT_PERIOD_MS * 1000u);

  while (1) {
    poll_buttons();
    process_received_packets(rail_handle);
    maybe_report_perf_metrics(rail_handle);
  }
}

static void init_radio(void)
{
  sl_rail_handle_t rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST0);

  sl_rail_set_fixed_length(rail_handle, SL_RAIL_SET_FIXED_LENGTH_INVALID);
  sl_rail_status_t status = sl_rail_config_events(rail_handle,
                                                  SL_RAIL_EVENTS_ALL,
                                                  RAIL_EVENTS_TX_COMPLETION
                                                  | RAIL_EVENTS_RX_COMPLETION
                                                  | RAIL_EVENT_CAL_NEEDED);
  status |= sl_rail_set_tx_fifo(rail_handle, tx_fifo, SERVER_TX_BUFFER_LENGTH, 0, 0);
  status |= sl_rail_start_rx(rail_handle, 0, NULL);
  if (status != SL_RAIL_STATUS_NO_ERROR) {
    app_log_warning("Radio init failed: %u\n", (unsigned)status);
  }
}

static void poll_buttons(void)
{
  sl_simple_button_poll_instances();

  bool button0_pressed = (sl_button_get_state(&sl_button_btn0) == SL_SIMPLE_BUTTON_PRESSED);
  bool button1_pressed = (sl_button_get_state(&sl_button_btn1) == SL_SIMPLE_BUTTON_PRESSED);

  if (button0_pressed && !previous_button0_pressed) {
    update_ready = !update_ready;
    app_log_info("OTA update availability: %s\n", update_ready ? "ready" : "not ready");
  }

  if (button1_pressed && !previous_button1_pressed) {
    if (selected_offer_kind == OTA_UPDATE_FULL) {
      selected_offer_kind = OTA_UPDATE_SECURE_ONLY;
    } else if (selected_offer_kind == OTA_UPDATE_SECURE_ONLY) {
      selected_offer_kind = OTA_UPDATE_NONSECURE_ONLY;
    } else {
      selected_offer_kind = OTA_UPDATE_FULL;
    }

    app_log_info("OTA offer mode: %u\n", (unsigned)selected_offer_kind);
  }

  previous_button0_pressed = button0_pressed;
  previous_button1_pressed = button1_pressed;
}

static void process_received_packets(sl_rail_handle_t rail_handle)
{
  if (!packet_received) {
    return;
  }

  packet_received = false;

  sl_rail_rx_packet_handle_t rx_packet_handle;
  sl_rail_rx_packet_info_t packet_info;
  sl_rail_status_t status = SL_RAIL_STATUS_NO_ERROR;

  rx_packet_handle = sl_rail_get_rx_packet_info(rail_handle,
                                                SL_RAIL_RX_PACKET_HANDLE_OLDEST_COMPLETE,
                                                &packet_info);
  while (rx_packet_handle != SL_RAIL_RX_PACKET_HANDLE_INVALID) {
    uint16_t packet_size = packet_info.packet_bytes;

    perf_totals.rx_packets++;
    perf_totals.rx_bytes += packet_size;

    if (packet_size > sizeof(rx_buffer)) {
      app_log_warning("OTA packet too large: %u\n", (unsigned)packet_size);
      perf_totals.perf_invalid++;
      status = sl_rail_release_rx_packet(rail_handle, rx_packet_handle);
      if (status != SL_RAIL_STATUS_NO_ERROR) {
        app_log_warning("sl_rail_release_rx_packet() result: %u\n", (unsigned)status);
      }
      rx_packet_handle = sl_rail_get_rx_packet_info(rail_handle,
                                                    SL_RAIL_RX_PACKET_HANDLE_OLDEST_COMPLETE,
                                                    &packet_info);
      continue;
    }

    sl_rail_copy_rx_packet(rail_handle, rx_buffer, &packet_info);
    status = sl_rail_release_rx_packet(rail_handle, rx_packet_handle);
    if (status != SL_RAIL_STATUS_NO_ERROR) {
      app_log_warning("sl_rail_release_rx_packet() result: %u\n", (unsigned)status);
    }

    if (packet_size >= 1u) {
      uint16_t payload_frame_len = (uint16_t)rx_buffer[0];
      if (payload_frame_len == (uint16_t)(packet_size - 1u)) {
        bool handled_as_ota = false;

        if (payload_frame_len >= sizeof(OtaPacketHeader_t)) {
          OtaPacketHeader_t header;
          memcpy(&header, &rx_buffer[1], sizeof(header));

          if (header.magic == OTA_PROTOCOL_MAGIC && header.version == OTA_PROTOCOL_VERSION) {
            AppSlot_t requested_slot = (header.image_kind == (uint8_t)SLOT_B) ? SLOT_B : SLOT_A;
            handled_as_ota = true;

            switch (header.packet_type) {
              case OTA_PACKET_QUERY:
                perf_totals.ota_queries++;
                app_log_info("Received OTA query: requested_kind=%u, target_slot=%c\n",
                             (unsigned)header.update_kind,
                             slot_label(requested_slot));
                if (update_ready) {
                  OtaPacketHeader_t response = {
                    .magic = OTA_PROTOCOL_MAGIC,
                    .version = OTA_PROTOCOL_VERSION,
                    .packet_type = OTA_PACKET_RESPONSE,
                    .update_kind = selected_offer_kind,
                    .image_kind = (uint8_t)requested_slot,
                    .transfer_id = header.transfer_id,
                    .total_bytes = 1u,
                    .chunk_index = 0u,
                    .chunk_bytes = 0u,
                    .total_chunks = 0u,
                  };
                  (void)send_frame(rail_handle, &response, NULL, 0u);

                  perf_totals.ota_sessions_started++;
                  session_start(selected_offer_kind, requested_slot);
                  (void)session_send_begin(rail_handle);
                } else {
                  OtaPacketHeader_t response = {
                    .magic = OTA_PROTOCOL_MAGIC,
                    .version = OTA_PROTOCOL_VERSION,
                    .packet_type = OTA_PACKET_RESPONSE,
                    .update_kind = selected_offer_kind,
                    .image_kind = (uint8_t)requested_slot,
                    .transfer_id = header.transfer_id,
                    .total_bytes = 0u,
                    .chunk_index = 0u,
                    .chunk_bytes = 0u,
                    .total_chunks = 0u,
                  };
                  (void)send_frame(rail_handle, &response, NULL, 0u);
                }
                break;

              case OTA_PACKET_ACK:
                perf_totals.ota_acks++;
                session_handle_ack(rail_handle, &header);
                break;

              default:
                break;
            }
          }
        }

        if (!handled_as_ota) {
          process_perf_packet(rail_handle, rx_buffer, packet_size);
        }
      } else {
        perf_totals.perf_invalid++;
      }
    }

    rx_packet_handle = sl_rail_get_rx_packet_info(rail_handle,
                                                  SL_RAIL_RX_PACKET_HANDLE_OLDEST_COMPLETE,
                                                  &packet_info);
  }
}

static bool select_server_image(AppSlot_t target_slot,
                                OtaUpdateKind_t offer_kind,
                                uint8_t image_index,
                                OtaUpdateKind_t *image_kind,
                                const uint8_t **image_data,
                                uint32_t *image_size)
{
  if ((uint32_t)target_slot >= (sizeof(slot_image_sets) / sizeof(slot_image_sets[0]))) {
    return false;
  }

  const slot_image_set_t *image_set = &slot_image_sets[target_slot];

  if (offer_kind == OTA_UPDATE_FULL) {
    if (image_index > 1u) {
      return false;
    }
    if (image_kind != NULL) {
      *image_kind = (image_index == 0u) ? OTA_UPDATE_SECURE_ONLY : OTA_UPDATE_NONSECURE_ONLY;
    }
    if (image_data != NULL) {
      *image_data = (image_index == 0u) ? image_set->secure_image_data : image_set->nonsecure_image_data;
    }
    if (image_size != NULL) {
      *image_size = (image_index == 0u) ? image_set->secure_image_size : image_set->nonsecure_image_size;
    }
    return true;
  }

  if (image_index != 0u) {
    return false;
  }

  if (offer_kind == OTA_UPDATE_SECURE_ONLY) {
    if (image_kind != NULL) {
      *image_kind = OTA_UPDATE_SECURE_ONLY;
    }
    if (image_data != NULL) {
      *image_data = image_set->secure_image_data;
    }
    if (image_size != NULL) {
      *image_size = image_set->secure_image_size;
    }
    return true;
  }

  if (offer_kind == OTA_UPDATE_NONSECURE_ONLY) {
    if (image_kind != NULL) {
      *image_kind = OTA_UPDATE_NONSECURE_ONLY;
    }
    if (image_data != NULL) {
      *image_data = image_set->nonsecure_image_data;
    }
    if (image_size != NULL) {
      *image_size = image_set->nonsecure_image_size;
    }
    return true;
  }

  return false;
}

static bool send_raw_frame(sl_rail_handle_t rail_handle,
                           const uint8_t *frame,
                           uint16_t frame_len)
{
  if (frame == NULL || frame_len == 0u || frame_len > sizeof(tx_frame)) {
    perf_totals.tx_failures++;
    return false;
  }

  memcpy(tx_frame, frame, frame_len);
  tx_done = false;
  tx_error = false;

  if (sl_rail_set_tx_fifo(rail_handle, tx_fifo, SERVER_TX_BUFFER_LENGTH, 0, 0) != SL_RAIL_STATUS_NO_ERROR) {
    perf_totals.tx_failures++;
    return false;
  }
  if (sl_rail_write_tx_fifo(rail_handle, tx_frame, frame_len, true) != frame_len) {
    perf_totals.tx_failures++;
    return false;
  }
  if (sl_rail_start_tx(rail_handle, 0, SL_RAIL_TX_OPTIONS_DEFAULT, NULL) != SL_RAIL_STATUS_NO_ERROR) {
    perf_totals.tx_failures++;
    return false;
  }

  uint32_t timeout = SERVER_WAIT_SPIN_COUNT;
  while (!tx_done && !tx_error && timeout > 0u) {
    timeout--;
  }

  if (sl_rail_start_rx(rail_handle, 0, NULL) != SL_RAIL_STATUS_NO_ERROR) {
    perf_totals.tx_failures++;
    return false;
  }

  if (!tx_done || tx_error) {
    perf_totals.tx_failures++;
    return false;
  }

  perf_totals.tx_frames++;
  perf_totals.tx_bytes += frame_len;
  return true;
}

static void process_perf_packet(sl_rail_handle_t rail_handle,
                                const uint8_t *frame,
                                uint16_t frame_len)
{
  if (frame_len < SERVER_PERF_FRAME_LEN) {
    return;
  }
  if (frame[0] != SERVER_PERF_FRAME_PAYLOAD_LEN) {
    return;
  }
  if (read_u32_le(&frame[1]) != SERVER_PERF_MAGIC) {
    return;
  }

  if (session.active) {
    return;
  }

  if (frame[5] != SERVER_PERF_TYPE_REQUEST) {
    perf_totals.perf_invalid++;
    return;
  }

  uint8_t echo_frame[SERVER_PERF_FRAME_LEN];
  memcpy(echo_frame, frame, SERVER_PERF_FRAME_LEN);
  echo_frame[5] = SERVER_PERF_TYPE_RESPONSE;

  perf_totals.perf_req_rx++;
  if (send_raw_frame(rail_handle, echo_frame, SERVER_PERF_FRAME_LEN)) {
    perf_totals.perf_resp_tx++;
  }
}

static uint32_t read_u32_le(const uint8_t *src)
{
  return ((uint32_t)src[0])
         | ((uint32_t)src[1] << 8)
         | ((uint32_t)src[2] << 16)
         | ((uint32_t)src[3] << 24);
}

static bool send_frame(sl_rail_handle_t rail_handle,
                       const OtaPacketHeader_t *header,
                       const uint8_t *payload,
                       uint16_t payload_len)
{
  uint16_t payload_frame_len = (uint16_t)(sizeof(*header) + payload_len);
  uint16_t frame_len = (uint16_t)(1u + payload_frame_len);
  if (payload_frame_len == 0u || payload_frame_len > 255u) {
    perf_totals.tx_failures++;
    return false;
  }
  if (frame_len > sizeof(tx_frame)) {
    perf_totals.tx_failures++;
    return false;
  }

  tx_frame[0] = (uint8_t)payload_frame_len;
  memcpy(&tx_frame[1], header, sizeof(*header));
  if (payload_len > 0u && payload != NULL) {
    memcpy(&tx_frame[1u + sizeof(*header)], payload, payload_len);
  }

  tx_done = false;
  tx_error = false;

  if (sl_rail_set_tx_fifo(rail_handle, tx_fifo, SERVER_TX_BUFFER_LENGTH, 0, 0) != SL_RAIL_STATUS_NO_ERROR) {
    perf_totals.tx_failures++;
    return false;
  }
  if (sl_rail_write_tx_fifo(rail_handle, tx_frame, frame_len, true) != frame_len) {
    perf_totals.tx_failures++;
    return false;
  }
  if (sl_rail_start_tx(rail_handle, 0, SL_RAIL_TX_OPTIONS_DEFAULT, NULL) != SL_RAIL_STATUS_NO_ERROR) {
    perf_totals.tx_failures++;
    return false;
  }

  uint32_t timeout = SERVER_WAIT_SPIN_COUNT;
  while (!tx_done && !tx_error && timeout > 0u) {
    timeout--;
  }

  if (sl_rail_start_rx(rail_handle, 0, NULL) != SL_RAIL_STATUS_NO_ERROR) {
    perf_totals.tx_failures++;
    return false;
  }

  if (!tx_done || tx_error) {
    perf_totals.tx_failures++;
    return false;
  }

  perf_totals.tx_frames++;
  perf_totals.tx_bytes += frame_len;
  return true;
}

static void session_clear(void)
{
  session = (server_session_t){ 0 };
}

static void session_start(OtaUpdateKind_t offer_kind, AppSlot_t target_slot)
{
  session_clear();
  session.active = true;
  session.target_slot = target_slot;
  session.offer_kind = offer_kind;
  session.image_index = 0u;
  session.transfer_id = SERVER_TRANSFER_ID;
}

static bool session_send_begin(sl_rail_handle_t rail_handle)
{
  OtaUpdateKind_t image_kind;
  const uint8_t *image_data = NULL;
  uint32_t image_size = 0u;

  if (!session.active) {
    return false;
  }

  if (!select_server_image(session.target_slot,
                           session.offer_kind,
                           session.image_index,
                           &image_kind,
                           &image_data,
                           &image_size)) {
    session_clear();
    return false;
  }

  session.current_image_kind = image_kind;
  session.current_image_data = image_data;
  session.current_image_size = image_size;
  session.current_chunk_index = 0u;
  session.current_chunk_count = (image_size + OTA_MAX_CHUNK_BYTES - 1u) / OTA_MAX_CHUNK_BYTES;
  session.next_progress_percent = SERVER_PROGRESS_STEP_PERCENT;
  session.phase = SERVER_PHASE_WAIT_BEGIN_ACK;

  OtaPacketHeader_t begin = {
    .magic = OTA_PROTOCOL_MAGIC,
    .version = OTA_PROTOCOL_VERSION,
    .packet_type = OTA_PACKET_IMAGE_BEGIN,
    .update_kind = (uint8_t)session.offer_kind,
    .image_kind = (uint8_t)image_kind,
    .transfer_id = session.transfer_id,
    .total_bytes = image_size,
    .chunk_index = 0xFFFFFFFFUL,
    .chunk_bytes = 0u,
    .total_chunks = (uint16_t)session.current_chunk_count,
  };

  return send_frame(rail_handle, &begin, NULL, 0u);
}

static bool session_send_next_chunk(sl_rail_handle_t rail_handle)
{
  if (!session.active || session.current_image_data == NULL) {
    return false;
  }

  uint32_t offset = session.current_chunk_index * OTA_MAX_CHUNK_BYTES;
  uint32_t remaining = session.current_image_size - offset;
  uint16_t chunk_len = (remaining > OTA_MAX_CHUNK_BYTES) ? OTA_MAX_CHUNK_BYTES : (uint16_t)remaining;

  OtaPacketHeader_t chunk = {
    .magic = OTA_PROTOCOL_MAGIC,
    .version = OTA_PROTOCOL_VERSION,
    .packet_type = OTA_PACKET_IMAGE_CHUNK,
    .update_kind = (uint8_t)session.offer_kind,
    .image_kind = (uint8_t)session.current_image_kind,
    .transfer_id = session.transfer_id,
    .total_bytes = session.current_image_size,
    .chunk_index = session.current_chunk_index,
    .chunk_bytes = chunk_len,
    .total_chunks = (uint16_t)session.current_chunk_count,
  };

  session.phase = SERVER_PHASE_WAIT_CHUNK_ACK;
  return send_frame(rail_handle, &chunk, session.current_image_data + offset, chunk_len);
}

static bool session_send_end(sl_rail_handle_t rail_handle)
{
  OtaPacketHeader_t end = {
    .magic = OTA_PROTOCOL_MAGIC,
    .version = OTA_PROTOCOL_VERSION,
    .packet_type = OTA_PACKET_IMAGE_END,
    .update_kind = (uint8_t)session.offer_kind,
    .image_kind = (uint8_t)session.current_image_kind,
    .transfer_id = session.transfer_id,
    .total_bytes = session.current_image_size,
    .chunk_index = session.current_chunk_count,
    .chunk_bytes = 0u,
    .total_chunks = (uint16_t)session.current_chunk_count,
  };

  session.phase = SERVER_PHASE_WAIT_END_ACK;
  return send_frame(rail_handle, &end, NULL, 0u);
}

static void session_finish(sl_rail_handle_t rail_handle)
{
  OtaPacketHeader_t done = {
    .magic = OTA_PROTOCOL_MAGIC,
    .version = OTA_PROTOCOL_VERSION,
    .packet_type = OTA_PACKET_DONE,
    .update_kind = (uint8_t)session.offer_kind,
    .image_kind = 0u,
    .transfer_id = session.transfer_id,
    .total_bytes = 0u,
    .chunk_index = 0u,
    .chunk_bytes = 0u,
    .total_chunks = 0u,
  };

  (void) send_frame(rail_handle, &done, NULL, 0u);
  perf_totals.ota_sessions_finished++;
  session_clear();
  app_log_info("OTA transfer complete\n");
}

static void session_handle_ack(sl_rail_handle_t rail_handle, const OtaPacketHeader_t *ack)
{
  if (!session.active || ack->transfer_id != session.transfer_id) {
    return;
  }

  switch (session.phase) {
    case SERVER_PHASE_WAIT_BEGIN_ACK:
      if (ack->packet_type == OTA_PACKET_ACK && ack->chunk_index == 0xFFFFFFFFUL) {
        if (session.current_chunk_count == 0u) {
          (void) session_send_end(rail_handle);
        } else {
          session.current_chunk_index = 0u;
          (void) session_send_next_chunk(rail_handle);
        }
      }
      break;

    case SERVER_PHASE_WAIT_CHUNK_ACK:
      if (ack->packet_type == OTA_PACKET_ACK && ack->chunk_index == session.current_chunk_index) {
        session.current_chunk_index++;

        if (session.current_chunk_count > 0u) {
          uint32_t progress_percent = (session.current_chunk_index * 100u) / session.current_chunk_count;
          if (session.current_chunk_index == session.current_chunk_count
              || progress_percent >= session.next_progress_percent) {
            app_log_info("OTA progress: slot=%c image=%u %lu%% (%lu/%lu chunks)\n",
                         slot_label(session.target_slot),
                         (unsigned)session.image_index,
                         (unsigned long)progress_percent,
                         (unsigned long)session.current_chunk_index,
                         (unsigned long)session.current_chunk_count);

            while (session.next_progress_percent <= progress_percent
                   && session.next_progress_percent < 100u) {
              session.next_progress_percent =
                (uint8_t)(session.next_progress_percent + SERVER_PROGRESS_STEP_PERCENT);
            }
          }
        }

        if (session.current_chunk_index < session.current_chunk_count) {
          (void) session_send_next_chunk(rail_handle);
        } else {
          (void) session_send_end(rail_handle);
        }
      }
      break;

    case SERVER_PHASE_WAIT_END_ACK:
      if (ack->packet_type == OTA_PACKET_ACK && ack->chunk_index == session.current_chunk_count) {
        session.image_index++;
        if (!session_send_begin(rail_handle)) {
          session_finish(rail_handle);
        }
      }
      break;

    default:
      break;
  }

  if (session.active
      && session.offer_kind != OTA_UPDATE_FULL
      && session.phase == SERVER_PHASE_WAIT_END_ACK
      && session.image_index > 0u
      && ack->chunk_index == session.current_chunk_count) {
    session_finish(rail_handle);
  }
}

static void maybe_report_perf_metrics(sl_rail_handle_t rail_handle)
{
  uint32_t now = (uint32_t)sl_rail_get_time(rail_handle);
  if ((int32_t)(now - perf_next_report_time_us) < 0) {
    return;
  }

  uint32_t elapsed_us = now - perf_last_report_time_us;
  if (elapsed_us == 0u) {
    elapsed_us = 1u;
  }

  server_perf_counters_t current = {
    .rx_packets = perf_totals.rx_packets,
    .rx_bytes = perf_totals.rx_bytes,
    .rx_frame_errors = perf_totals.rx_frame_errors,
    .rx_fatal_errors = perf_totals.rx_fatal_errors,
    .tx_frames = perf_totals.tx_frames,
    .tx_bytes = perf_totals.tx_bytes,
    .tx_failures = perf_totals.tx_failures,
    .ota_queries = perf_totals.ota_queries,
    .ota_acks = perf_totals.ota_acks,
    .ota_sessions_started = perf_totals.ota_sessions_started,
    .ota_sessions_finished = perf_totals.ota_sessions_finished,
    .perf_req_rx = perf_totals.perf_req_rx,
    .perf_resp_tx = perf_totals.perf_resp_tx,
    .perf_invalid = perf_totals.perf_invalid,
    .cal_needed = perf_totals.cal_needed,
    .cal_fail = perf_totals.cal_fail,
  };

  server_perf_counters_t delta = {
    .rx_packets = current.rx_packets - perf_last_report.rx_packets,
    .rx_bytes = current.rx_bytes - perf_last_report.rx_bytes,
    .rx_frame_errors = current.rx_frame_errors - perf_last_report.rx_frame_errors,
    .rx_fatal_errors = current.rx_fatal_errors - perf_last_report.rx_fatal_errors,
    .tx_frames = current.tx_frames - perf_last_report.tx_frames,
    .tx_bytes = current.tx_bytes - perf_last_report.tx_bytes,
    .tx_failures = current.tx_failures - perf_last_report.tx_failures,
    .ota_queries = current.ota_queries - perf_last_report.ota_queries,
    .ota_acks = current.ota_acks - perf_last_report.ota_acks,
    .ota_sessions_started = current.ota_sessions_started - perf_last_report.ota_sessions_started,
    .ota_sessions_finished = current.ota_sessions_finished - perf_last_report.ota_sessions_finished,
    .perf_req_rx = current.perf_req_rx - perf_last_report.perf_req_rx,
    .perf_resp_tx = current.perf_resp_tx - perf_last_report.perf_resp_tx,
    .perf_invalid = current.perf_invalid - perf_last_report.perf_invalid,
    .cal_needed = current.cal_needed - perf_last_report.cal_needed,
    .cal_fail = current.cal_fail - perf_last_report.cal_fail,
  };

  uint64_t elapsed_ms = ((uint64_t)elapsed_us) / 1000ULL;
  if (elapsed_ms == 0u) {
    elapsed_ms = 1u;
  }

  uint64_t rx_bytes_per_s = ((uint64_t)delta.rx_bytes * 1000000ULL) / elapsed_us;
  uint64_t tx_bytes_per_s = ((uint64_t)delta.tx_bytes * 1000000ULL) / elapsed_us;
  uint64_t rx_packets_per_min = ((uint64_t)delta.rx_packets * 60000000ULL) / elapsed_us;
  uint64_t tx_packets_per_min = ((uint64_t)delta.tx_frames * 60000000ULL) / elapsed_us;
  uint64_t perf_resp_rate_pct = (delta.perf_req_rx > 0u)
                                ? ((uint64_t)delta.perf_resp_tx * 100ULL) / delta.perf_req_rx
                                : 0u;

  app_log_info("[SERVER-PERF] dt_ms=%lu rx_pkt=%lu tx_pkt=%lu rx_Bps=%lu tx_Bps=%lu ppm_rx=%lu ppm_tx=%lu rx_err=%lu rx_fatal=%lu ota(q/a/s/f)=%lu/%lu/%lu/%lu perf(req/resp/rate/invalid)=%lu/%lu/%lu%%/%lu tx_fail=%lu cal=%lu cal_fail=%lu\n",
               (unsigned long)elapsed_ms,
               (unsigned long)delta.rx_packets,
               (unsigned long)delta.tx_frames,
               (unsigned long)rx_bytes_per_s,
               (unsigned long)tx_bytes_per_s,
               (unsigned long)rx_packets_per_min,
               (unsigned long)tx_packets_per_min,
               (unsigned long)delta.rx_frame_errors,
               (unsigned long)delta.rx_fatal_errors,
               (unsigned long)delta.ota_queries,
               (unsigned long)delta.ota_acks,
               (unsigned long)delta.ota_sessions_started,
               (unsigned long)delta.ota_sessions_finished,
               (unsigned long)delta.perf_req_rx,
               (unsigned long)delta.perf_resp_tx,
               (unsigned long)perf_resp_rate_pct,
               (unsigned long)delta.perf_invalid,
               (unsigned long)delta.tx_failures,
               (unsigned long)delta.cal_needed,
               (unsigned long)delta.cal_fail);

  perf_last_report = current;
  perf_last_report_time_us = now;
  perf_next_report_time_us = now + (SERVER_PERF_REPORT_PERIOD_MS * 1000u);
}

SL_CODE_RAM void sl_rail_util_on_event(sl_rail_handle_t rail_handle, sl_rail_events_t events)
{
  if (events & SL_RAIL_EVENTS_RX_COMPLETION) {
    if (events & SL_RAIL_EVENT_RX_PACKET_RECEIVED) {
      sl_rail_hold_rx_packet(rail_handle);
      packet_received = true;
    } else {
      perf_totals.rx_frame_errors++;
      // Frame errors are common in continuous RX and are not actionable here.
      const sl_rail_events_t fatal_rx_events = (SL_RAIL_EVENT_RX_FIFO_FULL
                                                | SL_RAIL_EVENT_RX_FIFO_OVERFLOW
                                                | SL_RAIL_EVENT_RX_PACKET_ABORTED);
      sl_rail_events_t rx_fatal = events & fatal_rx_events;
      if (rx_fatal != 0U) {
        perf_totals.rx_fatal_errors++;
        app_log_warning("Radio RX fatal event(s): %llX\n", rx_fatal);
      }
    }
  }

  if (events & SL_RAIL_EVENTS_TX_COMPLETION) {
    if (events & SL_RAIL_EVENT_TX_PACKET_SENT) {
      tx_done = true;
    } else {
      tx_error = true;
    }
  }

  if (events & SL_RAIL_EVENT_CAL_NEEDED) {
    perf_totals.cal_needed++;
    sl_rail_status_t status = sl_rail_calibrate(rail_handle, NULL, SL_RAIL_CAL_ALL_PENDING);
    if (status != SL_RAIL_STATUS_NO_ERROR) {
      perf_totals.cal_fail++;
      app_log_warning("Radio calibration error: %u\n", (unsigned)status);
    }
  }
}