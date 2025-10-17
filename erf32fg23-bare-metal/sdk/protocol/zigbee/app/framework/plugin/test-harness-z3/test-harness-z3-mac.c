/***************************************************************************//**
 * @file
 * @brief ZigBee 3.0 mac layer test harness functionality
 *******************************************************************************
 * # License
 * <b>Copyright 2018 Silicon Laboratories Inc. www.silabs.com</b>
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

#include "app/framework/include/af.h"

#include "test-harness-z3-core.h"
#include "network-steering-config.h"
// -----------------------------------------------------------------------------
// Globals

//
#define NEGATIVE_BEHAVIOR_BAD_NWK_PROTOCOL_VERSION (BIT32(0))
#define NEGATIVE_BEHAVIOR_NO_ROUTER_CAPACITY       (BIT32(1))
#define NEGATIVE_BEHAVIOR_NO_END_DEVICE_CAPACITY   (BIT32(2))
#define NEGATIVE_BEHAVIOR_BAD_STACK_PROFILE        (BIT32(3))
#define NEGATIVE_BEHAVIOR_BAD_PROTOCOL_ID          (BIT32(4))
#define NEGATIVE_BEHAVIOR_RESERVED_BIT_16_ENABLED  (BIT32(5))
#define NEGATIVE_BEHAVIOR_RESERVED_BIT_17_ENABLED  (BIT32(6))
#define NEGATIVE_BEHAVIOR_2_BYTE_PAYLOAD           (BIT32(7))
#define NEGATIVE_BEHAVIOR_11_BYTE_PAYLOAD          (BIT32(8))
#define NEGATIVE_BEHAVIOR_PAYLOAD_TOO_LONG         (BIT32(9))
#define NEGATIVE_BEHAVIOR_SWITCH_OFF_RADIO         (BIT32(10))

// Beacon offsets from internal stack header
// These offsets are from the start of the beacon payload
#define BEACON_NWK_PROTOCOL_ID_OFFSET  0
#define BEACON_STACK_PROFILE_OFFSET    1
#define BEACON_DEVICE_CAPACITY_OFFSET  2
#define BEACON_EXTENDED_PAN_ID_OFFSET  3
#define BEACON_TX_OFFSET_OFFSET        11
#define BEACON_NWK_UPDATE_ID_OFFSET    14
#define BEACON_PAYLOAD_SIZE            15

// Delay before turning radio off after sending a beacon
#define BEACON_RADIO_OFF_DELAY_MS 1000

// Private stack API's

static uint32_t beaconConfigNegativeBehaviorMask = 0;
sl_zigbee_event_t emberAfPluginTestHarnessZ3BeaconSendEvent;
#define z3BeaconSendEventControl (&emberAfPluginTestHarnessZ3BeaconSendEvent)
void emberAfPluginTestHarnessZ3BeaconSendEventHandler(sl_zigbee_event_t * event);

// -----------------------------------------------------------------------------
// Beacon CLI Commands

static void radioControl(bool state)
{
  // Based on emberAfPluginTestHarnessRadioOnOffCommand() in Test Harness plugin
  bool radioOff = !state;
  EmberStatus status;
  if (radioOff) {
    status = emberStartScan(EMBER_START_RADIO_OFF_SCAN,
                            0,   // channels (doesn't matter)
                            0);  // duration (doesn't matter)
  } else {
    status = emberStopScan();
  }
  emberAfCorePrintln("Radio %p status: 0x%X",
                     (radioOff ? "OFF" : "ON"),
                     status);
}

// plugin test-harness z3 beacon beacon-req
void sli_zigbee_af_test_harness_z3_beacon_beacon_req_command(SL_CLI_COMMAND_ARG)
{
  EmberStatus status;
  // Per the ZTT API, we scan on the configured primary channels.
  extern uint32_t sli_zigbee_af_network_steering_primary_channel_mask;

  // Restore the default power, in case we're doing a beacon request
  // (otherwise the radio will be on minimum power if just switched on)
  emberSetRadioPower(EMBER_AF_PLUGIN_NETWORK_STEERING_RADIO_TX_POWER);

  status = emberStartScan(EMBER_ACTIVE_SCAN,
                          sli_zigbee_af_network_steering_primary_channel_mask,
                          4); // 4 = 261 msec - will cause problems if too short

  emberAfCorePrintln("%s: %s: 0x%X",
                     TEST_HARNESS_Z3_PRINT_NAME,
                     "Beacon request",
                     status);
}

// plugin test-harness z3 beacon beacons-config <options:4>
void sli_zigbee_af_test_harness_z3_beacon_beacons_config_command(SL_CLI_COMMAND_ARG)
{
  EmberStatus status = EMBER_INVALID_CALL;

#ifndef EZSP_HOST

  uint32_t options = sl_cli_get_argument_uint32(arguments, 0);

  beaconConfigNegativeBehaviorMask = 0;

  if (options) {
    if (options & BIT32(0)) {
      beaconConfigNegativeBehaviorMask |= NEGATIVE_BEHAVIOR_BAD_NWK_PROTOCOL_VERSION;
    }
    if (options & BIT32(1)) {
      beaconConfigNegativeBehaviorMask |= NEGATIVE_BEHAVIOR_NO_ROUTER_CAPACITY;
    }
    if (options & BIT32(2)) {
      beaconConfigNegativeBehaviorMask |= NEGATIVE_BEHAVIOR_NO_END_DEVICE_CAPACITY;
    }
    if (options & BIT32(3)) {
      beaconConfigNegativeBehaviorMask |= NEGATIVE_BEHAVIOR_BAD_STACK_PROFILE;
    }
    if (options & BIT32(4)) {
      beaconConfigNegativeBehaviorMask |= NEGATIVE_BEHAVIOR_BAD_PROTOCOL_ID;
    }
    if (options & BIT32(5)) {
      beaconConfigNegativeBehaviorMask |= NEGATIVE_BEHAVIOR_RESERVED_BIT_16_ENABLED;
    }
    if (options & BIT32(6)) {
      beaconConfigNegativeBehaviorMask |= NEGATIVE_BEHAVIOR_RESERVED_BIT_17_ENABLED;
    }
    if (options & BIT32(7)) {
      beaconConfigNegativeBehaviorMask |= NEGATIVE_BEHAVIOR_2_BYTE_PAYLOAD;
    }
    if (options & BIT32(8)) {
      beaconConfigNegativeBehaviorMask |= NEGATIVE_BEHAVIOR_11_BYTE_PAYLOAD;
    }
    if (options & BIT32(9)) {
      beaconConfigNegativeBehaviorMask |= NEGATIVE_BEHAVIOR_PAYLOAD_TOO_LONG;
    }
    if (options & BIT32(10)) {
      beaconConfigNegativeBehaviorMask |= NEGATIVE_BEHAVIOR_SWITCH_OFF_RADIO;
    }
  }
  status = EMBER_SUCCESS;
#endif /* EZSP_HOST */

  // All options are handled in the negative behaviour callbacks
  emberAfCorePrintln("%s: %s: 0x%X",
                     TEST_HARNESS_Z3_PRINT_NAME,
                     "Beacon",
                     status);
}

void emberAfPluginTestHarnessZ3BeaconSendEventHandler(sl_zigbee_event_t * event)
{
  sl_zigbee_event_set_inactive(z3BeaconSendEventControl);
  sl_zigbee_app_debug_println("SendEventHandler - Switching radio off");
  radioControl(false); // switch radio off
}
extern uint8_t sl_mac_lower_mac_get_radio_channel(uint8_t mac_index);

// Allow the framework to modify the beacon, for negative conformance test cases.
// The function is called from our implementation of emberAfOutgoingPacketFilterCallback.
EmberPacketAction sli_zigbee_af_test_harness_z3_modify_beacon_payload(uint8_t *beaconPayload, uint8_t *payloadLength)
{
  sl_zigbee_app_debug_println("%s %d %s %d", "sli_zigbee_af_test_harness_z3_modify_beacon_payload: Logical channel:",
                              emberGetRadioChannel(), "Radio channel:", sl_mac_lower_mac_get_radio_channel(PHY_INDEX_NATIVE));
  if (beaconConfigNegativeBehaviorMask) {
    sl_zigbee_app_debug_println("Modifying beacon, mask = %04X", beaconConfigNegativeBehaviorMask);

    if (beaconConfigNegativeBehaviorMask & NEGATIVE_BEHAVIOR_BAD_NWK_PROTOCOL_VERSION) {
      beaconPayload[BEACON_STACK_PROFILE_OFFSET] = (beaconPayload[BEACON_STACK_PROFILE_OFFSET] & 0x0f) | 0x80;;
    }
    if (beaconConfigNegativeBehaviorMask & NEGATIVE_BEHAVIOR_NO_ROUTER_CAPACITY) {
      beaconPayload[BEACON_DEVICE_CAPACITY_OFFSET] &= ~0x04;
    }
    if (beaconConfigNegativeBehaviorMask & NEGATIVE_BEHAVIOR_NO_END_DEVICE_CAPACITY) {
      beaconPayload[BEACON_DEVICE_CAPACITY_OFFSET] &= ~0x80;
    }
    if (beaconConfigNegativeBehaviorMask & NEGATIVE_BEHAVIOR_BAD_STACK_PROFILE) {
      beaconPayload[BEACON_STACK_PROFILE_OFFSET] = (beaconPayload[BEACON_STACK_PROFILE_OFFSET] & 0xf0) | 0x03;
    }
    if (beaconConfigNegativeBehaviorMask & NEGATIVE_BEHAVIOR_BAD_PROTOCOL_ID) {
      beaconPayload[BEACON_NWK_PROTOCOL_ID_OFFSET] = 0x01;
    }
    if (beaconConfigNegativeBehaviorMask & NEGATIVE_BEHAVIOR_RESERVED_BIT_16_ENABLED) {
      beaconPayload[BEACON_DEVICE_CAPACITY_OFFSET] = (beaconPayload[BEACON_DEVICE_CAPACITY_OFFSET] & 0xfe) | 0x01;
    }
    if (beaconConfigNegativeBehaviorMask & NEGATIVE_BEHAVIOR_RESERVED_BIT_17_ENABLED) {
      beaconPayload[BEACON_DEVICE_CAPACITY_OFFSET] = (beaconPayload[BEACON_DEVICE_CAPACITY_OFFSET] & 0xfd) | 0x02;
    }
    if (beaconConfigNegativeBehaviorMask & NEGATIVE_BEHAVIOR_2_BYTE_PAYLOAD) {
      *payloadLength = 2;
    }
    if (beaconConfigNegativeBehaviorMask & NEGATIVE_BEHAVIOR_11_BYTE_PAYLOAD) {
      *payloadLength = 11;
    }
    if (beaconConfigNegativeBehaviorMask & NEGATIVE_BEHAVIOR_PAYLOAD_TOO_LONG) {
      assert(EXTRA_COMMAND_BYTES >= 5);
      MEMSET(beaconPayload + *payloadLength, 0x00, 5);
      *payloadLength += 5;
    }
    if (beaconConfigNegativeBehaviorMask & NEGATIVE_BEHAVIOR_SWITCH_OFF_RADIO) {
      emberAfDebugPrintln("Setting Send event active");
      sl_zigbee_event_set_delay_ms(z3BeaconSendEventControl,
                                   BEACON_RADIO_OFF_DELAY_MS);
    }
    return EMBER_MANGLE_PACKET;
  } else {
    sl_zigbee_app_debug_println("Not modifying beacon, mask = %04X", beaconConfigNegativeBehaviorMask);
    return EMBER_ACCEPT_PACKET;
  }
}
