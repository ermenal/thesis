/***************************************************************************//**
 * @file
 * @brief OTS Object Server configuration header
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
#ifndef SL_BT_OTS_SERVER_CONFIG_H
#define SL_BT_OTS_SERVER_CONFIG_H

/***********************************************************************************************//**
 * @addtogroup ots_server
 * @{
 **************************************************************************************************/

// <<< Use Configuration Wizard in Context Menu >>>

// <h> General settings

// <o SL_BT_OTS_SERVER_CONFIG_INDICATION_QUEUE_SIZE> Indication Queue size per connection <2-10>
// <i> Default: 5
// <i> Size of indication Queue per connection
#define SL_BT_OTS_SERVER_CONFIG_INDICATION_QUEUE_SIZE                      5

// </h>

// <<< end of configuration section >>>

/** @} (end addtogroup ots_server) */
#endif // SL_BT_OTS_SERVER_INSTANCE_CONFIG_H
