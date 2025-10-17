/***************************************************************************//**
 * @file
 * @brief Automatic IV Update by sequence number implementation
 *******************************************************************************
 * # License
 * <b>Copyright 2023 Silicon Laboratories Inc. www.silabs.com</b>
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

#include "em_common.h"
#include "sl_status.h"

#include "sl_bt_api.h"
#include "sl_btmesh_api.h"
#include "sl_btmesh_dcd.h"

#include <stdbool.h>
#include "app_assert.h"
#include "app_timer.h"

#ifdef SL_COMPONENT_CATALOG_PRESENT
#include "sl_component_catalog.h"
#endif // SL_COMPONENT_CATALOG_PRESENT

#ifdef SL_CATALOG_APP_LOG_PRESENT
#include "app_log.h"
#endif // SL_CATALOG_APP_LOG_PRESENT

#include "sl_btmesh_iv_update_by_seq_num.h"
#include "sl_btmesh_iv_update_config.h"

// Warning! The app_btmesh_util shall be included after the component configuration
// header file in order to provide the component specific logging macro.
#include "app_btmesh_util.h"

/***************************************************************************//**
 * @addtogroup iv_update
 * @{
 ******************************************************************************/

#define NORMAL_OPERATION 0
#define IV_UPDATE_IN_PROGRESS 1

static app_timer_t seq_num_testing_timer;
static void on_seq_num_testing_timer(app_timer_t *handle, void *data);

static void seq_num_testing_start(void);
static void seq_num_testing_stop(void);

static void handle_seq_num_testing(void);

/***************************************************************************//**
 *  Handling of mesh iv_update related events.
 *  @param[in] evt  Pointer to incoming event.
 ******************************************************************************/
void sl_btmesh_iv_update_by_seq_num_on_event(sl_btmesh_msg_t* evt)
{
  switch (SL_BT_MSG_ID(evt->header)) {
    case sl_btmesh_evt_node_initialized_id:
      if (evt->data.evt_node_initialized.provisioned) {
        handle_seq_num_testing();
      }
      break;
    case sl_btmesh_evt_prov_initialized_id:
    case sl_btmesh_evt_node_provisioned_id:
    case sl_btmesh_evt_node_changed_ivupdate_state_id:
      handle_seq_num_testing();
      break;
    default:
      break;
  }
}

static void handle_seq_num_testing(void)
{
  uint8_t iv_update_state;
  uint32_t iv_index;
  sl_status_t sc = sl_btmesh_node_get_ivupdate_state(&iv_index, &iv_update_state);
  log_status_error_f(sc, "Can't get IV update state");
  if (iv_update_state == NORMAL_OPERATION) {
    seq_num_testing_start();
  } else {
    seq_num_testing_stop();
  }
}

/***************************************************************************//**
 *  Check if any element's current sequence number is above the threshold
 ******************************************************************************/
static void on_seq_num_testing_timer(app_timer_t *handle, void *data)
{
  (void)data;
  (void)handle;
  sl_status_t sc;
  for (uint16_t i = 0; i < SL_BTMESH_CONFIG_MAX_ELEMENTS; i++) {
    uint32_t seqnum;
    sc = sl_btmesh_node_get_element_seqnum(i, &seqnum);
    app_assert_status_f(sc, "Failed to get sequence number");
    if (seqnum > SL_BTMESH_IV_UPDATE_SEQ_NUM_THRESHOLD) {
      sc = sl_btmesh_node_request_ivupdate();
      log_status_error_f(sc, "Failed to request IV Update" NL);
      return;
    }
  }
}

/***************************************************************************//**
 *  Start testing the sequence numbers
 ******************************************************************************/
static void seq_num_testing_start(void)
{
  sl_status_t sc = app_timer_start(&seq_num_testing_timer,
                                   SL_BTMESH_IV_UPDATE_SEQ_NUM_TESTING_PERIOD_S * 1000,
                                   on_seq_num_testing_timer,
                                   NULL,
                                   true);
  app_assert_status_f(sc, "Failed to start timer");
}

/***************************************************************************//**
 *  Stop testing the sequence numbers
 ******************************************************************************/
static void seq_num_testing_stop(void)
{
  sl_status_t sc = app_timer_stop(&seq_num_testing_timer);
  app_assert_status_f(sc, "Failed to stop timer");
}

/** @} (end addtogroup iv_update) */
