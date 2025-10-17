/***************************************************************************//**
 * @file
 * @brief Provisioning decorator module
 *******************************************************************************
 * # License
 * <b>Copyright 2020 Silicon Laboratories Inc. www.silabs.com</b>
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

#include "sl_status.h"
#include "sl_bt_api.h"
#include "sl_btmesh_api.h"

#include "em_common.h"
#include "app_assert.h"
#include "app_timer.h"

#ifdef SL_COMPONENT_CATALOG_PRESENT
#include "sl_component_catalog.h"
#endif // SL_COMPONENT_CATALOG_PRESENT

#ifdef SL_CATALOG_APP_LOG_PRESENT
#include "app_log.h"
#endif // SL_CATALOG_APP_LOG_PRESENT

#include "sl_btmesh_provisioning_decorator.h"
#include "sl_btmesh_provisioning_decorator_config.h"

// Warning! The app_btmesh_util shall be included after the component configuration
// header file in order to provide the component specific logging macro.
#include "app_btmesh_util.h"

/***************************************************************************//**
 * @addtogroup ProvisioningDecorator
 * @{
 ******************************************************************************/

// -----------------------------------------------------------------------------
// Provisioning Callbacks

/*******************************************************************************
 * Called at node initialization time to provide provisioning information
 *
 * @param[in] provisioned  true: provisioned, false: unprovisioned
 * @param[in] address      Unicast address of the primary element of the node.
                           Ignored if unprovisioned.
 * @param[in] iv_index     IV index for the first network of the node
                           Ignored if unprovisioned.
 *
 * This is a callback which can be implemented in the application.
 * @note If no implementation is provided in the application,
 *       then the default weak implementation will be an empty function.
 ******************************************************************************/
SL_WEAK void sl_btmesh_on_provision_init_status(bool provisioned,
                                                uint16_t address,
                                                uint32_t iv_index)
{
  (void) provisioned;
  (void) address;
  (void) iv_index;
}

/*******************************************************************************
 * Called when the Provisioning starts
 *
 * @param[in] result  Result code. 0: success, non-zero: error
 *
 * This is a callback which can be implemented in the application.
 * @note If no implementation is provided in the application,
 *       then the default weak implementation will be an empty function.
 ******************************************************************************/
SL_WEAK void sl_btmesh_on_node_provisioning_started(uint16_t result)
{
  (void) result;
}

/*******************************************************************************
 * Called when the Provisioning finishes successfully
 *
 * @param[in] address      Unicast address of the primary element of the node.
                           Ignored if unprovisioned.
 * @param[in] iv_index     IV index for the first network of the node
                           Ignored if unprovisioned.

 * This is a callback which can be implemented in the application.
 * @note If no implementation is provided in the application,
 *       then the default weak implementation will be an empty function.
 ******************************************************************************/
SL_WEAK void sl_btmesh_on_node_provisioned(uint16_t address,
                                           uint32_t iv_index)
{
  (void) address;
  (void) iv_index;
}

/*******************************************************************************
 * Called when the Provisioning fails
 *
 * @param[in] result  Result code. 0: success, non-zero: error
 *
 * This is a callback which can be implemented in the application.
 * @note If no implementation is provided in the application,
 *       then the default weak implementation will be an empty function.
 ******************************************************************************/
SL_WEAK void sl_btmesh_on_node_provisioning_failed(uint16_t result)
{
  (void) result;
}

// -----------------------------------------------------------------------------
// Provisioning Decorator Callbacks

/*******************************************************************************
 * Handling of Provisioning Decorator stack events.
 *
 * @param[in] evt  Event type
 ******************************************************************************/
void sl_btmesh_handle_provisioning_decorator_event(sl_btmesh_msg_t *evt)
{
  if (NULL == evt) {
    return;
  }

  // Handle events
  switch (SL_BT_MSG_ID(evt->header)) {
    case sl_btmesh_evt_node_initialized_id:
      sl_btmesh_on_provision_init_status(evt->data.evt_node_initialized.provisioned,
                                         evt->data.evt_node_initialized.address,
                                         evt->data.evt_node_initialized.iv_index);
      break;

    case sl_btmesh_evt_node_provisioning_started_id:
      sl_btmesh_on_node_provisioning_started(evt->data.evt_node_provisioning_started.result);
      break;

    case sl_btmesh_evt_node_provisioned_id:
      sl_btmesh_on_node_provisioned(evt->data.evt_node_provisioned.address,
                                    evt->data.evt_node_provisioned.iv_index);
      break;

    case sl_btmesh_evt_node_provisioning_failed_id: {
      sl_btmesh_on_node_provisioning_failed(evt->data.evt_node_provisioning_failed.result);
      break;
    }

    default:
      break;
  }
}
/** @} (end addtogroup ProvisioningDecorator) */
