/***************************************************************************//**
 * @file app_settings.h
 * @brief Application settings handler
 *******************************************************************************
 * # License
 * <b>Copyright 2020 Silicon Laboratories Inc. www.silabs.com</b>
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

#ifndef APP_SETTINGS_H
#define APP_SETTINGS_H

#include <stdint.h>
#include "sl_status.h"
#include "sl_wisun_api.h"
#include "sl_wisun_cli_util.h"

#ifdef SL_CATALOG_POWER_MANAGER_PRESENT
#include "sl_power_manager.h"
#endif

#define SL_WISUN_PING_PATTERN_SIZE 16

#ifdef SL_CATALOG_POWER_MANAGER_PRESENT
#define EM_MAX SL_POWER_MANAGER_EM3
#endif

typedef enum
{
  APP_CERTIFICATE_CHAIN_SILABS = 0,
#ifdef WISUN_FAN_CERTIFICATION
  APP_CERTIFICATE_CHAIN_CERTIF = 1
#endif
} app_certificate_chains_t;

typedef struct {
  char allowed_channels[APP_UTIL_PRINTABLE_DATA_MAX_LENGTH+1];
  char network_name[SL_WISUN_NETWORK_NAME_SIZE+1];
  uint8_t regulatory_domain;
  uint8_t operating_class;
  uint16_t operating_mode;
  uint8_t network_size;
  int8_t tx_power;
  uint8_t uc_dwell_interval_ms;
  uint16_t number_of_channels;
  uint32_t ch0_frequency;
  uint16_t channel_spacing; // channel spacing in kHz
  uint8_t trace_filter[SL_WISUN_FILTER_BITFIELD_SIZE];
  uint8_t regulation;
  int8_t regulation_warning_threshold;
  int8_t regulation_alert_threshold;
  uint8_t certificate_chain;
  uint8_t device_type;
  uint8_t chan_plan_id;
  uint8_t phy_mode_id;
  uint8_t phy_config_type;
  uint8_t fec;
  uint8_t rx_phy_mode_ids[SL_WISUN_MAX_PHY_MODE_ID_COUNT];
  uint8_t rx_phy_mode_ids_count;
  uint8_t rx_mdr_capable;
  uint16_t protocol_id;
  uint16_t channel_id;
  uint8_t lfn_profile;
  uint8_t crc_type;
  uint8_t preamble_length;
  uint8_t stf_length;
  uint8_t mac_neighbor_table_size;
} app_settings_wisun_t;

typedef struct {
  uint16_t identifier;
  uint16_t sequence_number;
  uint16_t packet_interval;
  uint16_t packet_length;
  uint16_t pattern_length;
  uint8_t pattern[SL_WISUN_PING_PATTERN_SIZE];
} app_settings_ping_t;

typedef struct {
  uint8_t printable_data_as_hex;
  uint8_t printable_data_length;
  uint8_t autoconnect;
  uint8_t pti_state;
} app_settings_app_t;

extern app_settings_wisun_t app_settings_wisun;
extern app_settings_ping_t app_settings_ping;
extern app_settings_app_t app_settings_app;

extern const app_enum_t app_settings_wisun_join_state_enum_ffn[];
extern const app_enum_t app_settings_wisun_join_state_enum_lfn[];

#if SLI_WISUN_DISABLE_SECURITY
extern uint32_t app_security_state;
#endif

#ifdef SL_CATALOG_POWER_MANAGER_PRESENT
extern uint32_t lfn_em_time_ms[EM_MAX + 1];
#endif

sl_status_t app_settings_get_channel_mask(const char *str, sl_wisun_channel_mask_t *channel_mask);

#endif  // APP_SETTINGS_H
