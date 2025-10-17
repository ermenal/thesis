/***************************************************************************//**
 * @file  sl_btmesh_hsl_signal_transition_handler.c
 * @brief HSL Transition Handler Module
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

/* C Standard Library headers */
#include <stdlib.h>
#include <stdio.h>

#include "app_assert.h"
#include "em_common.h"
#include "sl_status.h"

#include "app_timer.h"
#include "sl_sleeptimer.h"

#ifdef SL_COMPONENT_CATALOG_PRESENT
#include "sl_component_catalog.h"
#endif // SL_COMPONENT_CATALOG_PRESENT

#include "sl_btmesh_hsl_server.h"
#include "sl_btmesh_hsl_signal_transition_handler.h"
#include "sl_btmesh_hsl_server_config.h"

/***************************************************************************//**
 * @addtogroup HSL Transition Handler
 * @{
 ******************************************************************************/

#define NO_FLAGS              0       ///< No flags used for message
#define IMMEDIATE             0       ///< Immediate transition time is 0 seconds
#define NO_CALLBACK_DATA      NULL    // Callback has no parameters
#define HIGH_PRIORITY         0       // High Priority

/// current hue level
static uint16_t current_hue = SL_BTMESH_HSL_SERVER_DEFAULT_HUE_CFG_VAL;
/// starting level of hue transition
static uint16_t start_hue;
/// target level of hue transition
static uint16_t target_hue;

/// current saturation level
static uint16_t current_saturation = SL_BTMESH_HSL_SERVER_DEFAULT_SATURATION_CFG_VAL;
/// starting level of saturation transition
static uint16_t start_saturation;
/// target level of saturation transition
static uint16_t target_saturation;

/// hue transition time in ms
static uint32_t hue_transtime_ms;
/// time elapsed from hue transition start
static uint32_t hue_transtime_elapsed;
/// non-zero if hue transition is active
static uint8_t hue_transitioning;
/// timestamp of the last sleeptimer tick
static uint64_t hue_last_tick;

/// saturation transition time in ms
static uint32_t saturation_transtime_ms;
/// time elapsed from saturation transition start
static uint32_t saturation_transtime_elapsed;
/// non-zero if saturation transition is active
static uint8_t saturation_transitioning;
/// timestamp of the last sleeptimer tick
static uint64_t saturation_last_tick;

static app_timer_t hue_transition_timer;
static app_timer_t saturation_transition_timer;

// Timer callbacks
static void hue_transition_timer_cb(app_timer_t *timer, void *data);
static void saturation_transition_timer_cb(app_timer_t *timer, void *data);

////////////////////////////////////////////////////////////////////////////////
//    HSL Callbacks                                                           //
////////////////////////////////////////////////////////////////////////////////

SL_WEAK void sl_btmesh_hsl_hue_cb(uint16_t hue)
{
  (void)hue;
}

SL_WEAK void sl_btmesh_hsl_saturation_cb(uint16_t saturation)
{
  (void)saturation;
}

SL_WEAK void sl_btmesh_hsl_hue_on_ui_update(uint16_t hue)
{
  (void)hue;
}

SL_WEAK void sl_btmesh_hsl_saturation_on_ui_update(uint16_t saturation)
{
  (void)saturation;
}

/***************************************************************************//**
 * Handler for Hue Transition Timer, which manages LEDs transitions.
 ******************************************************************************/
static void hue_transition_timer_cb(app_timer_t *timer, void *data)
{
  (void)data;
  (void)timer;

  // Use sleeptimer to account for scheduling errors
  uint64_t current_tick = sl_sleeptimer_get_tick_count64();
  uint64_t period_ms = 0;
  sl_sleeptimer_tick64_to_ms(current_tick - hue_last_tick, &period_ms);
  hue_last_tick = current_tick;

  // Initialize the variable to UI update period in order to trigger a UI update
  // at the beginning of the transition.
  static uint16_t time_elapsed_since_ui_update = SL_BTMESH_HSL_SERVER_HUE_UI_UPDATE_PERIOD_CFG_VAL;

  if (!hue_transitioning) {
    sl_status_t sc = app_timer_stop(&hue_transition_timer);
    app_assert_status_f(sc, "Failed to stop Periodic Hue Transition Timer");
    return;
  } else {
    hue_transtime_elapsed += period_ms;

    if (hue_transtime_elapsed >= hue_transtime_ms) {
      // transition complete
      hue_transitioning = 0;
      current_hue = target_hue;

      // Set the variable to UI update period in order to trigger a UI update
      // at the beginning of the next transition.
      time_elapsed_since_ui_update = SL_BTMESH_HSL_SERVER_HUE_UI_UPDATE_PERIOD_CFG_VAL;

      // Trigger a UI update in order to provide the target values at the end
      // of the current transition
      sl_btmesh_hsl_hue_on_ui_update(current_hue);
    } else {
      // calculate current hue based on elapsed transition time
      if (target_hue >= start_hue) {
        current_hue = start_hue
                      + (target_hue - start_hue)
                      * (uint64_t)hue_transtime_elapsed
                      / hue_transtime_ms;
      } else {
        current_hue = start_hue
                      - (start_hue - target_hue)
                      * (uint64_t)hue_transtime_elapsed
                      / hue_transtime_ms;
      }

      // When transition is ongoing generate an event to application once every
      // SL_BTMESH_HSL_SERVER_HUE_UI_UPDATE_PERIOD_CFG_VAL ms because the event is used to update
      // display status and therefore the rate should not be too high
      time_elapsed_since_ui_update += SL_BTMESH_HSL_SERVER_HUE_UPDATE_PERIOD_CFG_VAL;

      if (SL_BTMESH_HSL_SERVER_HUE_UI_UPDATE_PERIOD_CFG_VAL <= time_elapsed_since_ui_update) {
        time_elapsed_since_ui_update -= SL_BTMESH_HSL_SERVER_HUE_UI_UPDATE_PERIOD_CFG_VAL;
        sl_btmesh_hsl_hue_on_ui_update(current_hue);
      }
    }
  }

  sl_btmesh_hsl_hue_cb(current_hue);
}

/***************************************************************************//**
 * Handler for Saturation Transition Timer, which manages LEDs transitions.
 ******************************************************************************/
static void saturation_transition_timer_cb(app_timer_t *timer, void *data)
{
  (void)data;
  (void)timer;

  // Use sleeptimer to account for scheduling errors
  uint64_t current_tick = sl_sleeptimer_get_tick_count64();
  uint64_t period_ms = 0;
  sl_sleeptimer_tick64_to_ms(current_tick - saturation_last_tick, &period_ms);
  saturation_last_tick = current_tick;

  // Initialize the variable to UI update period in order to trigger a UI update
  // at the beginning of the transition.
  static uint16_t time_elapsed_since_ui_update = SL_BTMESH_HSL_SERVER_SATURATION_UI_UPDATE_PERIOD_CFG_VAL;

  if (!saturation_transitioning) {
    sl_status_t sc = app_timer_stop(&saturation_transition_timer);
    app_assert_status_f(sc, "Failed to stop Periodic Saturation Transition Timer");
    return;
  } else {
    saturation_transtime_elapsed += period_ms;

    if (saturation_transtime_elapsed >= saturation_transtime_ms) {
      // transition complete
      saturation_transitioning = 0;
      current_saturation = target_saturation;

      // Set the variable to UI update period in order to trigger a UI update
      // at the beginning of the next transition.
      time_elapsed_since_ui_update = SL_BTMESH_HSL_SERVER_SATURATION_UI_UPDATE_PERIOD_CFG_VAL;

      // Trigger a UI update in order to provide the target values at the end
      // of the current transition
      sl_btmesh_hsl_saturation_on_ui_update(current_saturation);
    } else {
      // calculate current hue based on elapsed transition time
      if (target_saturation >= start_saturation) {
        current_saturation = start_saturation
                             + (target_saturation - start_saturation)
                             * (uint64_t)saturation_transtime_elapsed
                             / saturation_transtime_ms;
      } else {
        current_saturation = start_saturation
                             - (target_saturation - start_saturation)
                             * (uint64_t)saturation_transtime_elapsed
                             / saturation_transtime_ms;
      }

      // When transition is ongoing generate an event to application once every
      // SL_BTMESH_HSL_SERVER_SATURATION_UI_UPDATE_PERIOD_CFG_VAL ms because the event is used to update
      // display status and therefore the rate should not be too high
      time_elapsed_since_ui_update += SL_BTMESH_HSL_SERVER_SATURATION_UPDATE_PERIOD_CFG_VAL;

      if (SL_BTMESH_HSL_SERVER_SATURATION_UI_UPDATE_PERIOD_CFG_VAL <= time_elapsed_since_ui_update) {
        time_elapsed_since_ui_update -= SL_BTMESH_HSL_SERVER_SATURATION_UI_UPDATE_PERIOD_CFG_VAL;
        sl_btmesh_hsl_saturation_on_ui_update(current_saturation);
      }
    }
  }

  sl_btmesh_hsl_saturation_cb(current_saturation);
}

/*******************************************************************************
 * Set LED hue in given transition time.
 *
 * @param[in] hue            Hue level.
 * @param[in] transition_ms  Transition time in milliseconds.
 ******************************************************************************/
void sl_btmesh_hsl_set_hue_level(uint16_t hue, uint32_t transition_ms)
{
#if SL_BTMESH_HSL_SERVER_MINIMUM_HUE_CFG_VAL != (0)
  if (hue < SL_BTMESH_HSL_SERVER_MINIMUM_HUE_CFG_VAL) {
    hue = SL_BTMESH_HSL_SERVER_MINIMUM_HUE_CFG_VAL;
  }
#endif

#if SL_BTMESH_HSL_SERVER_MAXIMUM_HUE_CFG_VAL != (65535)
  if (hue > SL_BTMESH_HSL_SERVER_MAXIMUM_HUE_CFG_VAL) {
    hue = SL_BTMESH_HSL_SERVER_MAXIMUM_HUE_CFG_VAL;
  }
#endif

  // get last tick before running the first transition timer
  hue_last_tick = sl_sleeptimer_get_tick_count64();

  if (transition_ms == 0) {
    current_hue = hue;

    sl_btmesh_hsl_hue_cb(current_hue);

    /* if a transition was in progress, cancel it */
    if (hue_transitioning) {
      hue_transitioning = 0;
      sl_status_t sc = app_timer_stop(&hue_transition_timer);
      app_assert_status_f(sc, "Failed to stop periodic Hue Transition Timer");
    }
    sl_btmesh_hsl_hue_on_ui_update(current_hue);
    return;
  }

  hue_transtime_ms = transition_ms;

  start_hue = current_hue;
  target_hue = hue;

  hue_transtime_elapsed = 0;
  hue_transitioning = 1;

  // enabling timer IRQ -> the temperature is adjusted in timer interrupt
  // gradually until target temperature is reached.
  sl_status_t sc = app_timer_start(&hue_transition_timer,
                                   SL_BTMESH_HSL_SERVER_HUE_UPDATE_PERIOD_CFG_VAL,
                                   hue_transition_timer_cb,
                                   NO_CALLBACK_DATA,
                                   true);
  app_assert_status_f(sc, "Failed to start periodic Hue Transition Timer");

  // run first transition since the timer will not trigger now
  hue_transition_timer_cb(NULL, NULL);

  return;
}

/*******************************************************************************
 * Set LED saturation in given transition time.
 *
 * @param[in] saturation     Saturation level.
 * @param[in] transition_ms  Transition time in milliseconds.
 ******************************************************************************/
void sl_btmesh_hsl_set_saturation_level(uint16_t saturation, uint32_t transition_ms)
{
#if SL_BTMESH_HSL_SERVER_MINIMUM_SATURATION_CFG_VAL != (0)
  if (saturation < SL_BTMESH_HSL_SERVER_MINIMUM_SATURATION_CFG_VAL) {
    saturation = SL_BTMESH_HSL_SERVER_MINIMUM_SATURATION_CFG_VAL;
  }
#endif

#if SL_BTMESH_HSL_SERVER_MAXIMUM_SATURATION_CFG_VAL != (65535)
  if (saturation > SL_BTMESH_HSL_SERVER_MAXIMUM_SATURATION_CFG_VAL) {
    saturation = SL_BTMESH_HSL_SERVER_MAXIMUM_SATURATION_CFG_VAL;
  }
#endif

  // get last tick before running the first transition timer
  saturation_last_tick = sl_sleeptimer_get_tick_count64();

  if (transition_ms == 0) {
    current_saturation = saturation;

    sl_btmesh_hsl_saturation_cb(current_saturation);

    /* if a transition was in progress, cancel it */
    if (saturation_transitioning) {
      saturation_transitioning = 0;
      sl_status_t sc = app_timer_stop(&saturation_transition_timer);
      app_assert_status_f(sc, "Failed to stop periodic Saturation Transition Timer");
    }
    sl_btmesh_hsl_saturation_on_ui_update(current_saturation);
    return;
  }

  saturation_transtime_ms = transition_ms;

  start_saturation = current_saturation;
  target_saturation = saturation;

  saturation_transtime_elapsed = 0;
  saturation_transitioning = 1;

  // enabling timer IRQ -> the temperature is adjusted in timer interrupt
  // gradually until target temperature is reached.
  sl_status_t sc = app_timer_start(&saturation_transition_timer,
                                   SL_BTMESH_HSL_SERVER_SATURATION_UPDATE_PERIOD_CFG_VAL,
                                   saturation_transition_timer_cb,
                                   NO_CALLBACK_DATA,
                                   true);
  app_assert_status_f(sc, "Failed to start periodic Saturation Transition Timer");

  // run first transition since the timer will not trigger now
  saturation_transition_timer_cb(NULL, NULL);

  return;
}

/*******************************************************************************
 * Function for retrieving current hue.
 *
 * @return Current hue level.
 ******************************************************************************/
uint16_t sl_btmesh_get_hue(void)
{
  return(current_hue);
}

/*******************************************************************************
 * Function for retrieving current saturation.
 *
 * @return Current saturation level.
 ******************************************************************************/
uint16_t sl_btmesh_get_saturation(void)
{
  return(current_saturation);
}

/** @} (end addtogroup HSL Transition Handler) */
