/***************************************************************************//**
 * @file app_process.c
 * @brief Top level application functions.
 *******************************************************************************
 * # License
 * <b>Copyright 2022 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * The licensor of this software is Silicon Laboratories Inc. Your use of this
 * software is governed by the terms of Silicon Labs Master Software License
 * Agreement (MSLA) available at
 * www.silabs.com/about-us/legal/master-software-license-agreement. This
 * software is distributed to you in Source Code format and is governed by the
 * sections of the MSLA applicable to Source Code.
 *
 ******************************************************************************/


#include "app_process.h"
#include "rail.h"
#include "sl_rail_util_init.h"
#include "sl_simple_button_instances.h"
#include "em_gpio.h"
#include <inttypes.h>
#include <stdio.h>

static uint32_t heartbeat_divider = 0u;
static RAIL_Handle_t ns_rail_handle = RAIL_EFR32_HANDLE;
static volatile bool ns_tx_in_progress = false;
static volatile bool ns_button_press_pending = false;

static uint8_t ns_tx_fifo[128];
static const uint8_t ns_tx_payload[] = "NS TX packet";

#define NS_TX_CHANNEL (0u)
#define NS_LED_PORT (gpioPortB)
#define NS_LED_PIN  (2u)

void sl_rail_util_on_rf_ready(RAIL_Handle_t rail_handle)
{
  ns_rail_handle = rail_handle;
  (void)RAIL_SetTxFifo(ns_rail_handle,
                       ns_tx_fifo,
                       0u,
                       sizeof(ns_tx_fifo));
}

void sl_rail_util_on_event(RAIL_Handle_t rail_handle, RAIL_Events_t events)
{
  (void)rail_handle;
  if ((events & (RAIL_EVENTS_TX_COMPLETION
                 | RAIL_EVENTS_TXACK_COMPLETION)) != 0u) {
    ns_tx_in_progress = false;
  }
  // printf("NS event: 0x%016" PRIX64 "\n", (uint64_t)events);
}

void sl_button_on_change(const sl_button_t *handle)
{
  if ((handle == &sl_button_btn0)
      && (sl_button_get_state(handle) == SL_SIMPLE_BUTTON_PRESSED)) {
    ns_button_press_pending = true;
  }
}
/***************************************************************************//**
 * Application state machine, called infinitely.
 ******************************************************************************/
void app_process_action(void)
{
  heartbeat_divider++;
  if ((heartbeat_divider % 500000u) == 0u) {
    printf("NS alive\n");
  }

  if (!ns_button_press_pending) {
    // geen button press, execute rest niet
    return;
  }
  ns_button_press_pending = false;

  if ((ns_rail_handle == NULL) || (ns_rail_handle == RAIL_EFR32_HANDLE)) {
    printf("Bad ns rail handle\n");
    return;
  }

  if (ns_tx_in_progress) {
    if ((RAIL_GetRadioState(ns_rail_handle) & RAIL_RF_STATE_TX) == 0u) {
      ns_tx_in_progress = false;
    } else {
      printf("ns tx in progress already\n");
    }
    return;
  }

  if (RAIL_WriteTxFifo(ns_rail_handle,
                       ns_tx_payload,
                       sizeof(ns_tx_payload),
                       true) != sizeof(ns_tx_payload)) {
    printf("ns failed to write tx fifo\n");
    return;
  }

  if (RAIL_StartTx(ns_rail_handle,
                   NS_TX_CHANNEL,
                   RAIL_TX_OPTIONS_DEFAULT,
                   NULL) == RAIL_STATUS_NO_ERROR) {
    printf("ns started tx\n");
    ns_tx_in_progress = true;
    GPIO_PinOutToggle(NS_LED_PORT, NS_LED_PIN);
  }
}
