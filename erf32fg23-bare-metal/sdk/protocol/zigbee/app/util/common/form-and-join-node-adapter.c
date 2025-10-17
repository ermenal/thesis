/***************************************************************************//**
 * @file
 * @brief this file adapts the form-and-join library to work
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

#include PLATFORM_HEADER     // Micro and compiler specific typedefs and macros

#include "stack/include/ember.h"
#include "hal/hal.h" // for ATOMIC()
#include "form-and-join.h"
#include "form-and-join-adapter.h"
#include "app/framework/include/af.h"

#if defined(EMBER_SCRIPTED_TEST)
  #define HIDDEN
#else
  #define HIDDEN static
#endif

// We use message buffers for caching energy scan results,
// pan id candidates, and joinable beacons.
HIDDEN EmberMessageBuffer dataCache = EMBER_NULL_MESSAGE_BUFFER;

#if !defined(EMBER_AF_PLUGIN_FORM_AND_JOIN)
// We are NOT compiled in the context of an App Framework application
// (e.g. Sensor/sink) and the event is the normal name here.
HIDDEN EmberEventControl cleanupEvent;
#else
// Compiled in the context of an Afv2 application and AppBuilder will generate
// event names and functions.
extern sl_zigbee_event_t emberAfPluginFormAndJoinCleanupEvent;
#define cleanupEvent (&emberAfPluginFormAndJoinCleanupEvent)
#endif

#define CLEANUP_TIMEOUT_QS 120

uint8_t formAndJoinStackProfile(void)
{
  return emberStackProfile();
}

// We're relying on the fact that message buffers are a multiple of 16 bytes
// in size, so that NetworkInfo records do not cross buffer boundaries.
NetworkInfo *formAndJoinGetNetworkPointer(uint8_t index)
{
  return (NetworkInfo *) emberGetLinkedBuffersPointer(dataCache,
                                                      index << NETWORK_STORAGE_SIZE_SHIFT);
}

void formAndJoinSetCleanupTimeout(void)
{
  sl_zigbee_event_set_delay_qs(cleanupEvent, CLEANUP_TIMEOUT_QS);
}

bool formAndJoinAllocateBuffer(void)
{
  dataCache = sli_legacy_buffer_manager_allocate_buffer(32);
  return (dataCache == EMBER_NULL_MESSAGE_BUFFER ? false : true);
}
uint8_t*   getFormAndJoinBufferPointer(void)
{
  return sli_legacy_buffer_manager_get_buffer_pointer(dataCache);
}

// Set the dataCache length in terms of the number of NetworkInfo entries.

EmberStatus formAndJoinSetBufferLength(uint8_t entryCount)
{
  // Don't store more networks than our storage method can accommodate.
  if (entryCount > FORM_AND_JOIN_MAX_NETWORKS ) {
    return EMBER_INVALID_CALL;
  }

  return emberSetLinkedBuffersLength(dataCache,
                                     entryCount << NETWORK_STORAGE_SIZE_SHIFT);
}

void formAndJoinReleaseBuffer(void)
{
  if (dataCache != EMBER_NULL_MESSAGE_BUFFER) {
    emberReleaseMessageBuffer(dataCache);
    dataCache = EMBER_NULL_MESSAGE_BUFFER;
  }
  sl_zigbee_event_set_inactive(cleanupEvent);
}

void formAndJoinMarkBuffers(void)
{
  sli_legacy_buffer_manager_mark_buffer(&dataCache);
}
