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
#include "sl_component_catalog.h"
#include "sl_rail.h"
#include "rail.h"
#include "sl_code_classification.h"
#include "em_gpio.h"
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>

#if defined(SL_CATALOG_KERNEL_PRESENT)
#include "app_task_init.h"
#endif

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
static bool rx_started = false;
static volatile bool rx_packet_pending = false;
static sl_rail_handle_t app_rail_handle = NULL;
static uint32_t rx_packet_count = 0u;

static uint8_t rx_payload[256];

#define RX_CHANNEL  (0u)
#define RX_LED_PORT (gpioPortB)
#define RX_LED_PIN  (2u)

// -----------------------------------------------------------------------------
//                          Public Function Definitions
// -----------------------------------------------------------------------------
/******************************************************************************
 * Application state machine, called infinitely
 *****************************************************************************/
void sl_rail_util_on_rf_ready(sl_rail_handle_t rail_handle)
{
	app_rail_handle = rail_handle;
	GPIO_PinModeSet(RX_LED_PORT, RX_LED_PIN, gpioModePushPull, 0u);

	if (RAIL_StartRx(app_rail_handle, RX_CHANNEL, NULL) == RAIL_STATUS_NO_ERROR) {
		rx_started = true;
		printf("RX server listening on channel %u\n", (unsigned int)RX_CHANNEL);
	} else {
		printf("RX server failed to start RX\n");
	}
}

void app_process_action(void)
{
	RAIL_RxPacketInfo_t packet_info;
	RAIL_RxPacketHandle_t packet_handle;
	uint16_t copy_len;

	if (!rx_packet_pending) {
		return;
	}

	if ((app_rail_handle == NULL) || !rx_started) {
		rx_packet_pending = false;
		return;
	}

	rx_packet_pending = false;

	packet_handle = RAIL_GetRxPacketInfo(app_rail_handle,
																			 RAIL_RX_PACKET_HANDLE_NEWEST,
																			 &packet_info);
	if (packet_handle == RAIL_RX_PACKET_HANDLE_INVALID) {
		return;
	}

	copy_len = packet_info.packetBytes;
	if (copy_len >= sizeof(rx_payload)) {
		copy_len = sizeof(rx_payload) - 1u;
	}

	RAIL_CopyRxPacket(rx_payload, &packet_info);

	rx_payload[copy_len] = '\0';
	rx_packet_count++;
	GPIO_PinOutToggle(RX_LED_PORT, RX_LED_PIN);

	printf("RX packet #%lu (%u bytes): %s\n",
				 (unsigned long)rx_packet_count,
				 (unsigned int)copy_len,
				 (char *)rx_payload);

	(void)RAIL_ReleaseRxPacket(app_rail_handle, packet_handle);
}

/******************************************************************************
 * RAIL callback, called if a RAIL event occurs
 *****************************************************************************/
SL_CODE_RAM void sl_rail_util_on_event(sl_rail_handle_t rail_handle, sl_rail_events_t events)
{
	(void)rail_handle;

	if ((events & RAIL_EVENT_RX_PACKET_RECEIVED) != 0u) {
		rx_packet_pending = true;
	}
}

// -----------------------------------------------------------------------------
//                          Static Function Definitions
// -----------------------------------------------------------------------------

