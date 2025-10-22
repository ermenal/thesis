/***************************************************************************//**
 * @file main.c
 * @brief The main() function.
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

// -----------------------------------------------------------------------------
//                                   Includes
// -----------------------------------------------------------------------------
#include "sl_component_catalog.h"
#include "sl_system_init.h"
#if defined(SL_CATALOG_POWER_MANAGER_PRESENT)
#include "sl_power_manager.h"
#endif
#if defined(SL_CATALOG_KERNEL_PRESENT)
#include "sl_system_kernel.h"
#else // SL_CATALOG_KERNEL_PRESENT
#include "sl_system_process_action.h"
#endif // SL_CATALOG_KERNEL_PRESENT
#include "app_init.h"
#include "app_process.h"

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

/***************************************************************************//**
 * Main function
 ******************************************************************************/
#include "em_gpio.h"
#include "em_cmu.h"
#include <stdint.h>

GPIO_TypeDef *gdb_gpio = GPIO;

void delay(volatile uint32_t count) {
    while (count--) {
        __NOP();
    }
}

void run(void) {
    // Nothing to do here, all handled by interrupt
    while (1) {
        delay(1000000);
        // Toggle LED state
        GPIO_PinOutToggle(gpioPortB, 2);
    }
}


int main(void)
{
  // Initialize Silicon Labs device, system, service(s) and protocol stack(s).
  // Note that if the kernel is present, processing task(s) will be created by
  // this call.
  sl_system_init();

  // Initialize the application. For example, create periodic timer(s) or
  // task(s) if the kernel is present.
//  app_init();

    CMU_ClockEnable(cmuClock_GPIO, true);
    // Set LED pin as push-pull output (Port B, Pin 2)
    GPIO_PinModeSet(gpioPortB, 2, gpioModePushPull, 0);
    // Set Button pin as input with pull-up (Port B, Pin 1)
    GPIO_PinModeSet(gpioPortB, 1, gpioModeInputPull, 1);

    run();
    return 0;

}

// -----------------------------------------------------------------------------
//                          Static Function Definitions
// -----------------------------------------------------------------------------
