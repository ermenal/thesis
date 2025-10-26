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
#include "sli_tz_s_interface.h"


#define GPIO_BASE_NS (0x5003C000UL)
#define GPIO_BASE_S  (0x4003C000UL)

#define GPIO_PORTB_DOUT_SET ((volatile uint32_t *)(GPIO_BASE_NS + 0x70))

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

    // werkende loop als GPIO nonsecure is 
    // for (;;) {
    //     *GPIO_PORTB_DOUT_SET = (0b100); // Toggle PB02 on
    //    delay(1000000);
    //    *GPIO_PORTB_DOUT_SET = 0x0; // Toggle PB02 off
    //    delay(1000000);
    // }

    // Werkende loop als GPIO secure is
    for (;;){
        secure_blink();
        //delay(1000000);
    }

    
     // Set LED pin as push-pull output (Port B, Pin 2)
     //   GPIO_PinModeSet(gpioPortB, 2, gpioModePushPull, 0);
     // Set Button pin as input with pull-up (Port B, Pin 1)
     //   GPIO_PinModeSet(gpioPortB, 1, gpioModeInputPull, 1);



    //volatile uint32_t *illegal_gpio_ptr = (uint32_t *)0x4003C000; // Pointer to GPIO registers (illegal access from NW)
    //*illegal_gpio_ptr = 0xFFFFFFFF; // Attempt to write to GPIO registers (should cause a fault)

    run();
    return 0;
}