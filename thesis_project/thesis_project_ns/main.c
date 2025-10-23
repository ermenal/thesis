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
#include "sl_system_init.h"
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
        // NSC_LED_Toggle()
    }
}

int main(void)
{
    sl_system_init();

    //CMU_ClockEnable(cmuClock_GPIO, true);

    
     // Set LED pin as push-pull output (Port B, Pin 2)
     GPIO_PinModeSet(gpioPortB, 2, gpioModePushPull, 0);
     // Set Button pin as input with pull-up (Port B, Pin 1)
     GPIO_PinModeSet(gpioPortB, 1, gpioModeInputPull, 1);

     volatile uint32_t *illegal_gpio_ptr = (uint32_t *)0x4003C000; // Pointer to GPIO registers (illegal access from NW)
    //*illegal_gpio_ptr = 0xFFFFFFFF; // Attempt to write to GPIO registers (should cause a fault)

    run();
    return 0;

//  // Initialize Silicon Labs device, system, service(s) and protocol stack(s).
//  // Note that if the kernel is present, processing task(s) will be created by
//  // this call.
//
//  // Initialize the application. For example, create periodic timer(s) or
//  // task(s) if the kernel is present.
//  app_init();
//
//#if defined(SL_CATALOG_KERNEL_PRESENT)
//  // Start the kernel. Task(s) created in app_init() will start running.
//  sl_system_kernel_start();
//#else // SL_CATALOG_KERNEL_PRESENT
//  while (1) {
//    // Do not remove this call: Silicon Labs components process action routine
//    // must be called from the super loop.
//    sl_system_process_action();
//
//    // Application process.
//    app_process_action();
//
//#if defined(SL_CATALOG_POWER_MANAGER_PRESENT)
//    // Let the CPU go to sleep if the system allows it.
//    sl_power_manager_sleep();
//#endif
//  }
//#endif // SL_CATALOG_KERNEL_PRESENT



}

// -----------------------------------------------------------------------------
//                          Static Function Definitions
// -----------------------------------------------------------------------------
