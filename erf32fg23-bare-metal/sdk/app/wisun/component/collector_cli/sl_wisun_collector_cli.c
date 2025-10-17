/***************************************************************************//**
 * @file
 * @brief Application commandline interface handler
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

// -----------------------------------------------------------------------------
//                                   Includes
// -----------------------------------------------------------------------------
#include <stdio.h>
#include "sl_cli.h"
#include "sl_status.h"
#include "sl_wisun_cli_core.h"
#include "sl_wisun_collector.h"
#include "sl_wisun_meter_collector_config.h"
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

// -----------------------------------------------------------------------------
//                          Public Function Definitions
// -----------------------------------------------------------------------------

void app_register_meter(sl_cli_command_arg_t *arguments)
{
  const char *meter_ip = NULL;

  sockaddr_in6_t meter_addr = {
    .sin6_family = AF_INET6,
    .sin6_addr = {
      .address = { 0U },
    },
    .sin6_port = SL_WISUN_METER_PORT
  };
  sl_status_t stat = SL_STATUS_FAIL;

  app_wisun_cli_mutex_lock();

  meter_ip = sl_cli_get_argument_string(arguments, 0);
  if (meter_ip == NULL) {
    app_wisun_release_cli_mutex_and_return();
  }
  if (inet_pton(AF_INET6, meter_ip, &meter_addr.sin6_addr) == SOCKET_RETVAL_ERROR ) {
    printf("[Failed: invalid remote address parameter]\r\n");
    app_wisun_release_cli_mutex_and_return();
  }

  stat = sl_wisun_collector_register_meter(&meter_addr);
  if (stat == SL_STATUS_ALREADY_EXISTS) {
    printf("[Failed: meter is already registered]\r\n");
  } else if (stat == SL_STATUS_FAIL) {
    printf("[Failed: meter cannot be registered]\n");
  } else {
    printf("[Registration request sent to %s]\n", meter_ip);
  }

  app_wisun_cli_mutex_unlock();
}

void app_remove_meter(sl_cli_command_arg_t *arguments)
{
  const char *meter_ip = NULL;

  sockaddr_in6_t meter_addr = {
    .sin6_family = AF_INET6,
    .sin6_addr = {
      .address = { 0U },
    },
    .sin6_port = SL_WISUN_METER_PORT
  };
  sl_status_t stat = SL_STATUS_FAIL;

  app_wisun_cli_mutex_lock();

  meter_ip = sl_cli_get_argument_string(arguments, 0);
  if (meter_ip == NULL) {
    app_wisun_release_cli_mutex_and_return();
  }
  if (inet_pton(AF_INET6, meter_ip, &meter_addr.sin6_addr) == SOCKET_RETVAL_ERROR ) {
    printf("[Failed: invalid remote address parameter]\r\n");
    app_wisun_release_cli_mutex_and_return();
  }

  stat = sl_wisun_collector_remove_meter(&meter_addr);
  if (stat == SL_STATUS_OK) {
    printf("[%s meter has been removed]\r\n", meter_ip);
  } else {
    printf("[Failed: meter is not registered]\r\n");
  }

  app_wisun_cli_mutex_unlock();
}

void app_async_request(sl_cli_command_arg_t *arguments)
{
  const char *meter_ip = NULL;

  static sockaddr_in6_t meter_addr = {
    .sin6_family = AF_INET6,
    .sin6_addr = {
      .address = { 0U },
    },
    .sin6_port = SL_WISUN_METER_PORT
  };
  sl_status_t stat = SL_STATUS_FAIL;

  app_wisun_cli_mutex_lock();

  meter_ip = sl_cli_get_argument_string(arguments, 0);
  if (meter_ip == NULL) {
    app_wisun_release_cli_mutex_and_return();
  }
  if (inet_pton(AF_INET6, meter_ip, &meter_addr.sin6_addr) == SOCKET_RETVAL_ERROR ) {
    printf("[Failed: invalid remote address parameter]\r\n");
    app_wisun_release_cli_mutex_and_return();
  }

  stat = sl_wisun_send_async_request(&meter_addr);
  if (stat == SL_STATUS_FAIL) {
    printf("[Failed: async request failed]\n");
  } else {
    printf("[Async request sent to %s]\n", meter_ip);
  }

  app_wisun_cli_mutex_unlock();
}

void app_list_meters(sl_cli_command_arg_t *arguments)
{
  (void) arguments;
  app_wisun_cli_mutex_lock();
  sl_wisun_collector_print_meters();
  app_wisun_cli_mutex_unlock();
}

SL_WEAK void app_led_toggle(sl_cli_command_arg_t *arguments)
{
  (void) arguments;
  app_wisun_cli_mutex_lock();
  printf("[Not supported]\n");
  app_wisun_cli_mutex_unlock();
}

// -----------------------------------------------------------------------------
//                          Static Function Definitions
// -----------------------------------------------------------------------------
