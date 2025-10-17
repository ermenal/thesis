/***************************************************************************//**
 * @file
 * @brief
 *******************************************************************************
 * # License
 * <b>Copyright 2021 Silicon Laboratories Inc. www.silabs.com</b>
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

#ifndef __SL_WISUN_COAP_COLLECTOR_H__
#define __SL_WISUN_COAP_COLLECTOR_H__

#ifdef __cplusplus
extern "C" {
#endif

// -----------------------------------------------------------------------------
//                                   Includes
// -----------------------------------------------------------------------------
#include "sl_status.h"
#include "sl_wisun_app_core.h"
#include "sl_wisun_coap.h"
#include "sli_wisun_meter_collector.h"
#include "sl_wisun_collector.h"
#include "sl_wisun_coap_meter_collector_config.h"
#include "sl_wisun_collector_config.h"

// -----------------------------------------------------------------------------
//                              Macros and Typedefs
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
//                                Global Variables
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
//                          Public Function Declarations
// -----------------------------------------------------------------------------
/**************************************************************************//**
 * @brief Init coap collector.
 * @details init collec
 *****************************************************************************/
void sl_wisun_coap_collector_init(void);

/**************************************************************************//**
 * @brief Prepare CoAP request.
 * @details Should be used in thread init part
 * @param[in] req_type Request type
 * @param[out] req Pointer to the request
 * @return SL_STATUS_OK Success
 * @return SL_STATUS_FAIL Failure
 *****************************************************************************/
sl_status_t sl_wisun_coap_collector_prepare_request(const sl_wisun_request_type_t req_type,
                                                    sl_wisun_meter_request_t * const req);

/**************************************************************************//**
* @brief Prepare LED Toggle request.
* @details It should be used before sending
* @param[in] led_id LED ID
* @return SL_STATUS_OK Success
* @return SL_STATUS_FAIL Failure
******************************************************************************/
sl_status_t sl_wisun_coap_collector_prepare_led_toggle_request(const uint8_t led_id);

/**************************************************************************//**
* @brief Send LED toggle request.
* @details Send the prepared request to the meter
* @param[in] meter_addr Meter address
* @return SL_STATUS_OK Success
* @return SL_STATUS_FAIL Failure
******************************************************************************/
sl_status_t sl_wisun_coap_collector_send_led_toggle_request(const sockaddr_in6_t *meter_addr);

#ifdef __cplusplus
}
#endif

#endif
