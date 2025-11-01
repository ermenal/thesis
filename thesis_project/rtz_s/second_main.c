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
#include "em_gpio.h"
#include "gpiointerrupt.h"
#include "rail.h"
#include "second_main.h"
#include "rail_types.h"
#include "simplicity_sdk_2025.6.2/platform/emlib/inc/em_cmu.h"
#include "sl_rail_util_init.h"
#include <stdbool.h>
#include <stdio.h>
#include "sl_common.h"
#include "rail_config.h"


// TX FIFO dingen
#define TX_FIFO_SIZE 256

SL_ALIGN(RAIL_FIFO_ALIGNMENT)
static uint8_t tx_fifo[TX_FIFO_SIZE]
SL_ATTRIBUTE_ALIGN(RAIL_FIFO_ALIGNMENT);

// RX FIFO dingen 
#define RX_FIFO_SIZE 256
static uint16_t rx_fifo_size = RX_FIFO_SIZE;

SL_ALIGN(RAIL_FIFO_ALIGNMENT)
static uint8_t rx_fifo[RX_FIFO_SIZE]
SL_ATTRIBUTE_ALIGN(RAIL_FIFO_ALIGNMENT);

// App process dingen 
#define PAYLOAD_LENGTH 16
static uint8_t payload[PAYLOAD_LENGTH] =
    {PAYLOAD_LENGTH - 1, 0x01, 0x02, 0x03, 0x04,
  0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x00 };
static volatile bool send_packet = false;

static uint8_t rx_buffer[PAYLOAD_LENGTH*2]; // Extra bytes voor appended information van RAIL
static RAIL_RxPacketHandle_t packet_handle;
static RAIL_RxPacketInfo_t packet_info;
static RAIL_RxPacketDetails_t packet_details;

void buttonCb(uint8_t intNo) {
  send_packet = true;
  // GPIO_PinOutToggle(gpioPortB, 2);
  // tijdelijk, teveel in cb ofc
  process_action_secure_radio(); 
}

void init_secure_radio(void)
{
  RAIL_Handle_t rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST);

  uint16_t size = RAIL_SetTxFifo(rail_handle, tx_fifo, 0, TX_FIFO_SIZE);
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
    printf("RAIL_ConfigEvents failed: %lu\n", status);
    while(1);
  }

  status = RAIL_SetRxFifo(rail_handle, rx_fifo, &rx_fifo_size);
  if (status != RAIL_STATUS_NO_ERROR) {
    printf("RAIL_SetRxFifo failed: %lu\n", status);
    while(1);
  }
  const RAIL_ChannelConfig_t *mijnConfig = channelConfigs[0];
  status = RAIL_StartRx(rail_handle,
                        mijnConfig->configs->channelNumberStart,
                        NULL);
  if (status != RAIL_STATUS_NO_ERROR) {
    printf("RAIL_StartRx failed: %lu\n", status);
    while(1);
  }

  // setup LED
  GPIO_PinModeSet(gpioPortB, 2, gpioModePushPull, false);
  
  CMU_ClockEnable(cmuClock_GPIO, true);
  GPIOINT_Init();
  GPIO_PinModeSet(gpioPortB, 1, gpioModeInputPull, 1);
  GPIOINT_CallbackRegister(1, buttonCb);
  GPIO_ExtIntConfig(gpioPortB, 1, 1, false, true, true);
}

void process_action_secure_radio(void) 
{
  // RAIL_RadioState_t radio_state = RAIL_GetRadioState(rail_handle);
  // printf("Radio state: %u\n", radio_state);
  // wel degelijk altijd in rx state ... 
  // send_packet = true;
  RAIL_Handle_t rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST);
  if (send_packet) {
    send_packet = false;
    
    payload[PAYLOAD_LENGTH - 1]++;

    RAIL_WriteTxFifo(rail_handle,
                     payload,
                     PAYLOAD_LENGTH,
                     false);
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

SL_CODE_RAM void sl_rail_util_on_event(sl_rail_handle_t rail_handle, sl_rail_events_t events)
{
  (void) rail_handle;
  // printf("EVENT: %lu\n", events);

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