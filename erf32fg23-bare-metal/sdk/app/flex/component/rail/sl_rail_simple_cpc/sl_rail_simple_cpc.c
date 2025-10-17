/***************************************************************************//**
 * @file
 * @brief Simple RAIL CPC for NCP projects Interface for CPC
 *******************************************************************************
 * # License
 * <b>Copyright 2022 Silicon Laboratories Inc. www.silabs.com</b>
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

#include <string.h>
#include "sl_rail_simple_cpc.h"
#include "sl_rail_simple_cpc_config.h"
#include "sli_cpc.h"

// Receive and transmit buffers
static uint8_t rx_buf[SL_RAIL_SIMPLE_CPC_RX_BUF_SIZE] = { 0 };
static uint8_t tx_buf[SL_RAIL_SIMPLE_CPC_TX_BUF_SIZE] = { 0 };

static sl_cpc_endpoint_handle_t endpoint_handle;
static bool cpc_connected = false;

// Write completed signal
typedef struct {
  uint8_t     write_completed;
  sl_status_t wr_comp_status;
} sig_wr_comp;

// Signals to handle communication between callback functions
static uint8_t signal_write = 0;
static sig_wr_comp signal_wr_comp = { 0 };
static uint8_t signal_read = 0;
static uint8_t signal_init = 1;

static uint8_t *rx_buf_p;

void cpc_tx_cb(sl_cpc_user_endpoint_id_t endpoint_id,
               void *buffer,
               void *arg,
               sl_status_t status);
void cpc_rx_cb(uint8_t endpoint_id, void *arg);
void cpc_error_cb(uint8_t endpoint_id, void *arg);
bool cpc_is_ep_free(void);

// -----------------------------------------------------------------------------
// Public functions (API implementation)

/**************************************************************************//**
 * Simple COM initialization function
 *****************************************************************************/
void sl_rail_simple_cpc_init(void)
{
  sl_status_t status;

  // clear RX and TX buffers
  memset(rx_buf, 0, sizeof(rx_buf));
  memset(tx_buf, 0, sizeof(tx_buf));

  rx_buf_p = &rx_buf[0];

  status = sli_cpc_open_service_endpoint(&endpoint_handle,
                                         SL_RAIL_SIMPLE_CPC_CHANNEL, 0, 1);
  EFM_ASSERT(status == SL_STATUS_OK);
  status = sl_cpc_set_endpoint_option(&endpoint_handle,
                                      SL_CPC_ENDPOINT_ON_IFRAME_WRITE_COMPLETED,
                                      (void *)cpc_tx_cb);
  EFM_ASSERT(status == SL_STATUS_OK);
  status = sl_cpc_set_endpoint_option(&endpoint_handle,
                                      SL_CPC_ENDPOINT_ON_IFRAME_RECEIVE,
                                      (void *)cpc_rx_cb);
  EFM_ASSERT(status == SL_STATUS_OK);
  status = sl_cpc_set_endpoint_option(&endpoint_handle,
                                      SL_CPC_ENDPOINT_ON_ERROR,
                                      (void*)cpc_error_cb);
  EFM_ASSERT(status == SL_STATUS_OK);

  cpc_connected = true;
}

/**************************************************************************//**
 * Simple COM step function
 *****************************************************************************/
void sl_rail_simple_cpc_step(void)
{
  sl_status_t status;
  uint16_t len;

  // Check if the endpoint is open. If not, we need to reopen it,
  // but first we need to check if it has been freed by CPC
  if (!cpc_connected) {
    if (cpc_is_ep_free()) {
      sl_rail_simple_cpc_init();
    } else {
      return;
    }
  }

  // If something is in tx buffer, and initial handshake was done, transmit it
  if ((signal_write > 0) && !signal_init) {
    (void)sl_cpc_write(&endpoint_handle, tx_buf, signal_write, 0, NULL);
    signal_write = 0;
  }

  if (signal_read > 0) {
    status = sl_cpc_read(&endpoint_handle, (void **) &rx_buf_p, &len, 0, 0);
    if (status != SL_STATUS_OK) {
      // Drop packet
      len = 0;
    } else if (signal_init) {
      // Drop first signaling (handshake) packet
      signal_init = 0;
      len = 0;
      sl_rail_simple_cpc_os_task_proceed();
    } else {
      // Everything OK, send msg to upper layers
      memcpy(rx_buf, rx_buf_p, len);
      sl_rail_simple_cpc_receive_cb(status, len, rx_buf);
      sl_cpc_free_rx_buffer((void *) &rx_buf);
      memset(rx_buf, 0, sizeof(rx_buf));
    }

    signal_read--;
  }

  if (signal_wr_comp.write_completed > 0) {
    if (!signal_init) {
      memset(tx_buf, 0, sizeof(tx_buf));
      sl_rail_simple_cpc_transmit_cb(signal_wr_comp.wr_comp_status);
      signal_wr_comp.wr_comp_status = SL_STATUS_FAIL;
      signal_wr_comp.write_completed--;
    }
  }
}

/**************************************************************************//**
 * Transmit function
 *
 * Transmits len bytes of data through the UART interface using DMA.
 *
 * @param[out] len Message lenght
 * @param[out] data Message data
 *****************************************************************************/
void sl_rail_simple_cpc_transmit(uint32_t len, uint8_t *data)
{
  // Store msg to buffer until transmit callback is not called
  signal_write = len;
  memcpy((void *)tx_buf, (void *)data, (size_t)len);

  // Only send msg after signaling handshake was done
  if (!signal_init) {
    (void)sl_cpc_write(&endpoint_handle,
                       tx_buf,
                       signal_write,
                       0,
                       (void *)cpc_tx_cb);
    signal_write = 0;
  }

  sl_rail_simple_cpc_os_task_proceed();
}

/**************************************************************************//**
 * Receive function
 *****************************************************************************/
void sl_rail_simple_cpc_receive(void)
{
  // Not needed in CPC communication
}

/**************************************************************************//**
 * Transmit completed callback
 *
 * Called after transmit is finished.
 *
 * @param[in] status Status of the transmission
 *
 * @note Weak implementation
 *  Called after DMA is complete, the UART transmission might be still ongoing
 *****************************************************************************/
SL_WEAK void sl_rail_simple_cpc_transmit_cb(sl_status_t status)
{
  (void)status;
}

/**************************************************************************//**
 * Receive completed callback
 *
 * Called after receive is finished.
 *
 * @param[in] status Status of the reception
 * @param[in] len Received message length
 * @param[in] data Data received
 *
 * @note Weak implementation
 *****************************************************************************/
SL_WEAK void sl_rail_simple_cpc_receive_cb(sl_status_t status,
                                           uint32_t len,
                                           uint8_t *data)
{
  (void)status;
  (void)data;
  (void)len;
}

// -----------------------------------------------------------------------------
// Private functions

/**************************************************************************//**
 * CPC receive completed callback
 *****************************************************************************/
void cpc_rx_cb(uint8_t endpoint_id, void *arg)
{
  (void)endpoint_id;
  (void)arg;

  signal_read++;
  sl_rail_simple_cpc_os_task_proceed();
}

/**************************************************************************//**
 * CPC transmit completed callback
 *****************************************************************************/
void cpc_tx_cb(sl_cpc_user_endpoint_id_t endpoint_id,
               void *buffer,
               void *arg,
               sl_status_t status)
{
  (void)(endpoint_id);
  (void)(buffer);
  (void)(arg);

  CORE_ATOMIC_SECTION(
    signal_wr_comp.wr_comp_status = status;
    signal_wr_comp.write_completed++;
    )
  sl_rail_simple_cpc_os_task_proceed();
}

/**************************************************************************//**
 * CPC error callback
 *****************************************************************************/
void cpc_error_cb(uint8_t endpoint_id, void *arg)
{
  (void)endpoint_id;
  (void)arg;
  uint8_t state = sl_cpc_get_endpoint_state(&endpoint_handle);
  if (state == SL_CPC_STATE_ERROR_DESTINATION_UNREACHABLE) {
    sl_status_t status = sl_cpc_close_endpoint(&endpoint_handle);
    EFM_ASSERT(status == SL_STATUS_OK);
    cpc_connected = false;
  }
}

/**************************************************************************//**
 * Returns whether the CPC endpoint has been freed
 *****************************************************************************/
bool cpc_is_ep_free(void)
{
  if (sl_cpc_get_endpoint_state(&endpoint_handle) == SL_CPC_STATE_FREED) {
    return true;
  }
  return false;
}

/**************************************************************************//**
 * Function to trigger the OS task to proceed
 *
 * @note Weak implementation.
 *****************************************************************************/
SL_WEAK void sl_rail_simple_cpc_os_task_proceed(void)
{
  // No action on bare metal implementation
}
