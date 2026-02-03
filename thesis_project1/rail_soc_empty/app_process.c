/***************************************************************************//**
 * @file
 * @brief app_process.c
 *******************************************************************************
 * # License
 * <b>Copyright 2018 Silicon Laboratories Inc. www.silabs.com</b>
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

// -----------------------------------------------------------------------------
//                                   Includes
// -----------------------------------------------------------------------------
#include "rail.h"
#include "rail_config.h"
#include "rail_types.h"
#include "sl_button.h"
#include "sl_component_catalog.h"
#include "sl_rail.h"
#include "sl_code_classification.h"
#include <stdint.h>
#include <stdio.h>

#if defined(SL_CATALOG_KERNEL_PRESENT)
#include "app_task_init.h"
#endif
#include "sl_common.h"
#include "sl_rail_sdk_fifo_size_config.h"

// -----------------------------------------------------------------------------
//                              Macros and Typedefs
// -----------------------------------------------------------------------------


// -----------------------------------------------------------------------------
//                          Static Function Declarations
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
//                                Global Variables
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
//                                Static Variables
// -----------------------------------------------------------------------------
#define PAYLOAD_LENGTH 16
static uint8_t payload[PAYLOAD_LENGTH] =
    {PAYLOAD_LENGTH - 1, 0x01, 0x02, 0x03, 0x04,
  0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x00 };
static volatile bool send_packet = false;

static uint8_t secret_payload[PAYLOAD_LENGTH] =
    {0x01, 0x02, 0x03, 0xCC, 0xDD,
  0xEE, 0xFF, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99 };
static uint16_t send_secret = 0;

static uint8_t rx_buffer[PAYLOAD_LENGTH*2]; // Extra bytes voor appended information van RAIL
static RAIL_RxPacketHandle_t packet_handle;
static RAIL_RxPacketInfo_t packet_info;
static RAIL_RxPacketDetails_t packet_details;
// -----------------------------------------------------------------------------
//                          Public Function Definitions
// -----------------------------------------------------------------------------
/******************************************************************************
 * Application state machine, called infinitely
 *****************************************************************************/
/*
 void app_process_action(RAIL_Handle_t rail_handle)
{
  if (send_packet) {
    send_packet = false;
    if (send_secret % 3 == 0) {
      RAIL_WriteTxFifo(rail_handle,
                     secret_payload,
                     PAYLOAD_LENGTH,
                     false);
    } else {
    payload[PAYLOAD_LENGTH - 1]++;
    RAIL_WriteTxFifo(rail_handle,
                     payload,
                     PAYLOAD_LENGTH,
                     false);
    }
    // printf("Buffer after writeTxFifo: %u\n", RAIL_GetTxFifoSpaceAvailable(rail_handle));
    const RAIL_ChannelConfig_t *mijnConfig = channelConfigs[0];
    RAIL_StartTx(rail_handle,
                 mijnConfig->configs->channelNumberStart,
                 RAIL_TX_OPTIONS_DEFAULT,
                 NULL);
    }
  packet_handle = RAIL_GetRxPacketInfo(rail_handle,
                                       RAIL_RX_PACKET_HANDLE_OLDEST_COMPLETE,
                                       &packet_info);
  if (packet_handle != RAIL_RX_PACKET_HANDLE_INVALID) {
    RAIL_CopyRxPacket(rx_buffer, &packet_info);
    RAIL_Status_t status =
      RAIL_GetRxPacketDetails(rail_handle, packet_handle, &packet_details);
    if (status != RAIL_STATUS_NO_ERROR) {
      printf("RAIL_GetRxPacketDetails failed: %lu\n", status);
      while(1);
    }
    status = RAIL_ReleaseRxPacket(rail_handle, packet_handle);
    if (status != RAIL_STATUS_NO_ERROR) {
      printf("RAIL_ReleaseRxPacket failed: %lu\n", status);
      while(1);
    }
    printf("RX PACKET RECEIVED: ");
    for (int i=0; i<packet_info.packetBytes; i++) {
      printf("0x%02X", rx_buffer[i]);
    }
    printf("\n");
  }
}
*/
/******************************************************************************
 * RAIL callback, called if a RAIL event occurs
 *****************************************************************************/
/*
 SL_CODE_RAM void sl_rail_util_on_event(sl_rail_handle_t rail_handle, sl_rail_events_t events)
{
  (void) rail_handle;
  if (events & RAIL_EVENTS_TX_COMPLETION) {
    printf("EVENT: TX completed\n");
  }
  if (events & RAIL_EVENTS_RX_COMPLETION) {
    if (events & RAIL_EVENT_RX_PACKET_RECEIVED) {
      printf("EVENT: RX packet received\n");
      // Zeg RAIL dat we het packet willen houden in de rx_fifo
      // Anders verwijdert RAIL het packet na deze callback
      // Nu kunnen we de packet downloaden buiten deze callback
      // Alternatief: Direct hier rx packet downloaden, maar mogelijks grote memcpy in interrupt ... 
      if (RAIL_HoldRxPacket(rail_handle) == RAIL_RX_PACKET_HANDLE_INVALID) {
        printf("RAIL_HoldRxPacket failed\n");
        while(1);
      }
    }
    else {
      printf("EVENT: RX completed, niet packet received (error dus)\n");
    }
  }
  if (events & RAIL_EVENT_CAL_NEEDED) {
    printf("EVENT: Calibration needed\n");
    RAIL_Status_t status = RAIL_Calibrate(rail_handle, NULL, RAIL_CAL_ALL_PENDING);
    if (status != RAIL_STATUS_NO_ERROR) {
      printf("RAIL_Calibrate failed: %lu\n", status);
      while(1);
    }
  }
}

#include "sl_simple_led_instances.h"
// #include "sl_led.h"
void sl_button_on_change(const sl_button_t *handle)
{
  if (handle->get_state(handle) == 1) {
    sl_led_toggle(&sl_led_led0);
    send_packet = true;
    send_secret++;
  }
}

// -----------------------------------------------------------------------------
//                          Static Function Definitions
// -----------------------------------------------------------------------------
*/