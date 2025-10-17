/***************************************************************************//**
 * @file
 * @brief app_tick.c
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
#include <stdint.h>
#include "sl_component_catalog.h"
#include "simple_rail_assistance.h"
#include "rail.h"
#include "app_process.h"
#include "sl_simple_button_instances.h"
#include "sl_flex_rail_package_assistant.h"
#include "sl_flex_rail_config.h"
#include "sl_flex_rail_channel_selector.h"

#if defined(SL_CATALOG_KERNEL_PRESENT)
#include "app_task_init.h"
#endif

#include "rail_types.h"
#include "cmsis_compiler.h"

// -----------------------------------------------------------------------------
//                              Macros and Typedefs
// -----------------------------------------------------------------------------
/// Transmit data length
#define TX_PAYLOAD_LENGTH (16U)

/// States of the Auto-ACK app
typedef enum {
  S_IDLE,             //!< Idle state waiting for TX or RX
  S_TRANSMIT,         //!< CLI or button push request to TX a packet
  S_RECEIVE,          //!< Receiving a packet or an ACK for previous TX
  S_ERROR             //!< An error occurred
} state_t;

// -----------------------------------------------------------------------------
//                          Static Function Declarations
// -----------------------------------------------------------------------------
/**************************************************************************//**
 * Starts listening for radio packets.
 *
 * @param rail_handle Handle to the RAIL context
 * @returns None
 *****************************************************************************/
static void start_receiving(RAIL_Handle_t rail_handle);

/**************************************************************************//**
 * Transmits the data packet.
 *
 * @param rail_handle Handle to the RAIL context
 * @returns None
 *****************************************************************************/
static void handle_packet_transmission(RAIL_Handle_t rail_handle);

/**************************************************************************//**
 * Check the received packet (data or ACK).
 *
 * @param rail_handle Handle to the RAIL context
 * @returns None
 *****************************************************************************/
static void handle_received_packet(RAIL_Handle_t rail_handle);

/**************************************************************************//**
 * Handle errors detected in RAIL events.
 *
 * @param None
 * @returns None
 *****************************************************************************/
static void handle_error_state(void);

// -----------------------------------------------------------------------------
//                                Global Variables
// -----------------------------------------------------------------------------
/// Flag, indicating transmit request (button was pressed / CLI transmit request has occurred)
/// Also used in the application state machine
volatile bool tx_requested = false;
/// Flag, indicating received packet is forwarded on CLI or not
volatile bool rx_requested = true;

// -----------------------------------------------------------------------------
//                                Static Variables
// -----------------------------------------------------------------------------
/// The variable shows the actual state of the state machine
static volatile state_t state = S_IDLE;

/// Contains the status of RAIL Calibration
static volatile RAIL_Status_t calibration_status = 0;

/// RAIL Rx packet handle
static volatile RAIL_RxPacketHandle_t rx_packet_handle = RAIL_RX_PACKET_HANDLE_INVALID;

/// Receive and Send FIFO
static __ALIGNED(RAIL_FIFO_ALIGNMENT) uint8_t rx_fifo[SL_FLEX_RAIL_RX_FIFO_SIZE];
static __ALIGNED(RAIL_FIFO_ALIGNMENT) uint8_t tx_fifo[SL_FLEX_RAIL_TX_FIFO_SIZE];

/// Transmit packet
static uint8_t out_packet[TX_PAYLOAD_LENGTH] = {
  0x0F, 0x16, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66,
  0x77, 0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE,
};

/// State machine flags and conditions
/// Notify end of packet transmission
static bool rail_packet_sent = false;

/// Notify reception of packet
static bool rail_packet_received = false;

/// Notify RAIL Tx or Rx error
static bool rail_error = false;

/// Request start receiving
static bool start_rx = true;

/// Copy of last RAIL events to process
static RAIL_Events_t rail_last_state = RAIL_EVENTS_NONE;

// -----------------------------------------------------------------------------
//                          Public Function Definitions
// -----------------------------------------------------------------------------
/******************************************************************************
 * Set up the rail TX fifo for later usage
 * @param rail_handle Which rail handler should be updated
 *****************************************************************************/
void set_up_tx_fifo(RAIL_Handle_t rail_handle)
{
  uint16_t allocated_tx_fifo_size = 0;
  allocated_tx_fifo_size = RAIL_SetTxFifo(rail_handle, tx_fifo, 0, SL_FLEX_RAIL_TX_FIFO_SIZE);
  app_assert(allocated_tx_fifo_size == SL_FLEX_RAIL_TX_FIFO_SIZE,
             "RAIL_SetTxFifo() failed to allocate a large enough fifo (%d bytes instead of %d bytes)\n",
             allocated_tx_fifo_size,
             SL_FLEX_RAIL_TX_FIFO_SIZE);
}

/******************************************************************************
 * Application state machine, called infinitely
 *****************************************************************************/
void app_process_action(RAIL_Handle_t rail_handle)
{
  // Handle errors if pending
  if (rail_error) {
    rail_error = false;
    state = S_ERROR;
  }

  switch (state) {
    case S_IDLE:
      if (start_rx) {
        // Start receiving upon entering the state
        start_rx = false;
        start_receiving(rail_handle);
      } else if (rail_packet_received) {
        // Go to RECEIVE state
        rail_packet_received = false;
        state = S_RECEIVE;
#if defined(SL_CATALOG_KERNEL_PRESENT)
        app_task_notify();
#endif
      } else if (tx_requested) {
        // Transition to TRANSMIT if requested
        state = S_TRANSMIT;
#if defined(SL_CATALOG_KERNEL_PRESENT)
        app_task_notify();
#endif
      }
      break;
    case S_TRANSMIT:
      // Send packet upon entering state
      if (tx_requested) {
        tx_requested = false;
        handle_packet_transmission(rail_handle);
      } else if (rail_packet_sent) {
        app_log_info("Packet has been sent\n");
        state = S_IDLE;
        rail_packet_sent = false;
#if defined(SL_CATALOG_KERNEL_PRESENT)
        app_task_notify();
#endif
      }
      break;
    case S_RECEIVE:
      handle_received_packet(rail_handle);
      // Request Rx when entering IDLE state
      start_rx = true;
      state = S_IDLE;
#if defined(SL_CATALOG_KERNEL_PRESENT)
      app_task_notify();
#endif
      break;
    case S_ERROR:
      handle_error_state();
      break;
    default:
      // Unexpected state
      app_log_error("Unexpected state occurred:%d\n", state);
      break;
  }

  // Reset copy of RAIL events
  rail_last_state = RAIL_EVENTS_NONE;
}

/******************************************************************************
 * RAIL callback, called if a RAIL event occurs.
 *****************************************************************************/
void sl_rail_util_on_event(RAIL_Handle_t rail_handle, RAIL_Events_t events)
{
  // Make a copy of the events
  rail_last_state = events;

  // Handle Tx events
  if ( events & RAIL_EVENTS_TX_COMPLETION) {
    if (events & RAIL_EVENT_TX_PACKET_SENT) {
      rail_packet_sent = true;
    } else {
      rail_error = true;
    }
  }

  // Handle Rx events
  if ( events & RAIL_EVENTS_RX_COMPLETION ) {
    if (events & RAIL_EVENT_RX_PACKET_RECEIVED) {
      // Keep the packet in the radio buffer, download it later at the state machine
      rx_packet_handle = RAIL_HoldRxPacket(rail_handle);
      rail_packet_received = true;
    } else {
      rail_error = true;
    }
  }

  // Perform all calibrations when needed or indicate error if failed
  if ( events & RAIL_EVENT_CAL_NEEDED ) {
    calibration_status = RAIL_Calibrate(rail_handle, NULL, RAIL_CAL_ALL_PENDING);
    if (calibration_status != RAIL_STATUS_NO_ERROR) {
      rail_error = true;
    }
  }
#if defined(SL_CATALOG_KERNEL_PRESENT)
  app_task_notify();
#endif
}

/******************************************************************************
 * Button callback, called if any button is pressed or released.
 *****************************************************************************/
void sl_button_on_change(const sl_button_t *handle)
{
  if (sl_button_get_state(handle) == SL_SIMPLE_BUTTON_PRESSED) {
    tx_requested = true;
  }
#if defined(SL_CATALOG_KERNEL_PRESENT)
  app_task_notify();
#endif
}

// -----------------------------------------------------------------------------
//                          Static Function Definitions
// -----------------------------------------------------------------------------
/*******************************************************************************
 * Use RAIL to transmit a data packet
 ******************************************************************************/
static void handle_packet_transmission(RAIL_Handle_t rail_handle)
{
  /// Status indicator of the RAIL API calls
  RAIL_Status_t rail_status;

  prepare_package(rail_handle, out_packet, sizeof(out_packet));
  rail_status = RAIL_StartTx(rail_handle, get_selected_channel(), RAIL_TX_OPTION_WAIT_FOR_ACK, NULL);
  if (rail_status != RAIL_STATUS_NO_ERROR) {
    app_log_warning("RAIL_StartTx() result:%d ", rail_status);
  }
}

/*******************************************************************************
 * Use RAIL to start listening for radio packets
 ******************************************************************************/
static void start_receiving(RAIL_Handle_t rail_handle)
{
  /// Status indicator of the RAIL API calls
  RAIL_Status_t rail_status;

  rail_status = RAIL_StartRx(rail_handle, get_selected_channel(), NULL);
  if (rail_status != RAIL_STATUS_NO_ERROR) {
    app_log_warning("RAIL_StartRx() result:%d", rail_status);
  }
}

/*******************************************************************************
 * Process the received packet (print data packet or indicate ACK)
 ******************************************************************************/
static void handle_received_packet(RAIL_Handle_t rail_handle)
{
  RAIL_RxPacketInfo_t packet_info;
  RAIL_RxPacketDetails_t packet_details;
  RAIL_Status_t packet_status;
  /// Status indicator of the RAIL API calls
  RAIL_Status_t rail_status;

  //  - Check whether RAIL_HoldRxPacket() was successful, i.e. packet handle is valid
  //  - Copy it to the application FIFO
  //  - Free up the radio FIFO
  //  - Return to IDLE state i.e. RAIL Rx
  if (rx_packet_handle == RAIL_RX_PACKET_HANDLE_INVALID) {
    app_log_error("RAIL_HoldRxPacket() error: RAIL_RX_PACKET_HANDLE_INVALID\n"
                  "No such RAIL rx packet yet exists or rail_handle is not active");
  }
  rx_packet_handle = RAIL_GetRxPacketInfo(rail_handle, RAIL_RX_PACKET_HANDLE_OLDEST_COMPLETE, &packet_info);
  if (rx_packet_handle == RAIL_RX_PACKET_HANDLE_INVALID) {
    app_log_error("RAIL_GetRxPacketInfo() error: RAIL_RX_PACKET_HANDLE_INVALID\n");
  }
  if (rx_packet_handle != RAIL_RX_PACKET_HANDLE_INVALID) {
    // Get packet details to identify ACK of last Tx
    packet_status =  RAIL_GetRxPacketDetails(rail_handle, rx_packet_handle, &packet_details);
    if (packet_status != RAIL_STATUS_NO_ERROR) {
      app_log_error("RAIL_GetRxPacketDetails() error: %d\n", packet_status);
    }

    uint8_t *start_of_packet = 0;
    uint16_t packet_size = 0;
    // Check the packet status if this RX is an ACK for our last TX
    if (packet_details.isAck) {
      toggle_send_led();
    } else {
      toggle_receive_led();
      packet_size = unpack_packet(rx_fifo, &packet_info, &start_of_packet);
    }
    rail_status = RAIL_ReleaseRxPacket(rail_handle, rx_packet_handle);
    if (rail_status != RAIL_STATUS_NO_ERROR) {
      app_log_warning("RAIL_ReleaseRxPacket() result:%d", rail_status);
    }
    if (packet_details.isAck) {
      app_log_info("ACK was received\n");
    } else if (rx_requested) {
      printf_rx_packet(start_of_packet, packet_size);
    }
  }
}

/*******************************************************************************
 * This helper function handles the S_ERROR state of the state machine.
 ******************************************************************************/
static void handle_error_state(void)
{
  // Handle Rx error
  if (rail_last_state & RAIL_EVENTS_RX_COMPLETION) {
    app_log_error("Radio RX Error occurred\nEvents: %lld\n", rail_last_state);
    // Handle Tx error
  } else if (rail_last_state & RAIL_EVENTS_TX_COMPLETION) {
    app_log_error("Radio TX Error occurred\nEvents: %lld\n", rail_last_state);
    // Handle calibration error
  } else if (rail_last_state & RAIL_EVENT_CAL_NEEDED) {
    app_log_warning("Radio Calibration Error occurred\nEvents: %lld\nRAIL_Calibrate() result:%d\n",
                    rail_last_state,
                    calibration_status);
  }
  start_rx = true;
  state = S_IDLE;
#if defined(SL_CATALOG_KERNEL_PRESENT)
  app_task_notify();
#endif
}
