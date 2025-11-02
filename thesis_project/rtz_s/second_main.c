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
#include "sl_rail_util_init.h"
#include <stdbool.h>
#include <stdio.h>
#include "sl_common.h"
#include "rail_config.h"
#include <string.h>


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

#define PACKET_MAX_LENGTH 16
#define RX_PACKET_BUFFER_SIZE (PACKET_MAX_LENGTH * 2) // Extra voor appended info
static uint8_t secure_rx_buffer[RX_PACKET_BUFFER_SIZE];

#define SECURE_COMMAND_SEQUENCE_LENGTH 3
const uint8_t secure_command_sequence[SECURE_COMMAND_SEQUENCE_LENGTH] = {0x01, 0x02, 0x03};

/*
* Button callback (GPIO odd interrupt, gericht op SW)
* Forward "button was pressed" naar NSW via SW1 IRQ
*/
void buttonCb(uint8_t intNo) 
{
  (void) intNo;
  NVIC_SetPendingIRQ(SW1_IRQn);
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
    printf("TX FIFO set, size: %u\n", size);
  }

  RAIL_Status_t status = RAIL_ConfigEvents(rail_handle,
                                           RAIL_EVENTS_ALL,
                                           RAIL_EVENTS_TX_COMPLETION
                                           | RAIL_EVENTS_RX_COMPLETION
                                           | RAIL_EVENT_CAL_NEEDED);
  if (status != RAIL_STATUS_NO_ERROR) {
    printf("RAIL_ConfigEvents failed: %u\n", status);
    while(1);
  }

  status = RAIL_SetRxFifo(rail_handle, rx_fifo, &rx_fifo_size);
  if (status != RAIL_STATUS_NO_ERROR) {
    printf("RAIL_SetRxFifo failed: %u\n", status);
    while(1);
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
  printf("SECURE COMMAND RECEIVED! COMMAND: %.*s\n", packet_length, secure_rx_buffer);
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
      NVIC_SetPendingIRQ(SW0_IRQn);
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