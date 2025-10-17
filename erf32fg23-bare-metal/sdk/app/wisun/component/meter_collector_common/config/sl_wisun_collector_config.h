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
#ifndef SL_WISUN_COLLECTOR_CONFIG_H
#define SL_WISUN_COLLECTOR_CONFIG_H

#include "sl_component_catalog.h"

// <<< Use Configuration Wizard in Context Menu >>>

// <h>Wi-SUN Collector configuration
// <o SL_WISUN_COLLECTOR_MAX_REG_METER> Maximum count of registerable Meters
// <i> Default: 32
#define SL_WISUN_COLLECTOR_MAX_REG_METER                                32U

// <h>Wi-SUN Collector configuration
// <o SL_WISUN_COLLECTOR_MAX_REG_METER> Maximum count of async Meters
// <i> Default: 32
#define SL_WISUN_COLLECTOR_MAX_ASYNC_METER                              32U

// </h>
// <o SL_WISUN_COLLECTOR_STACK_SIZE_WORD> Collector thread stack size in word
// <i> Default: 256
#define SL_WISUN_COLLECTOR_STACK_SIZE_WORD                              256U

// </h>
// <o SL_WISUN_COLLECTOR_REQUEST_TIMEOUT> Maximum waiting time [ms] for requests
// <i> Default: 360000
#define SL_WISUN_COLLECTOR_REQUEST_TIMEOUT                              360000U

// <<< end of configuration section >>>

#endif // SL_WISUN_COLLECTOR_CONFIG_H
