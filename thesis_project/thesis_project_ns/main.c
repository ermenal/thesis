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
#include "em_gpio.h"
#include "em_cmu.h"
#include "sl_system_init.h"
#include "sli_tz_ns_interface.h"
#include <stdint.h>
#include "nsc_gpio.h"


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
        // GPIO_PinOutToggle(gpioPortB, 2);
sli_tz_ns_interface_dispatch_noarg((sli_tz_veneer_noarg_fn) nsc_led_toggle);
        // NSC_LED_Toggle()
    }
}

int main(void)
{
    sl_system_init();

    //GPIO_PinModeSet(gpioPortB, 2, gpioModePushPull, 0);
    for (;;) {
       *GPIO_PORTB_DOUT_SET = (0b100); // Toggle PB02 on
       delay(1000000);
       *GPIO_PORTB_DOUT_SET = 0x0; // Toggle PB02 off
       delay(1000000);
    }

    
    // Set LED pin as push-pull output (Port B, Pin 2)

    // crashen
    //volatile uint32_t *illegal_ptr = (uint32_t *)(GPIO_BASE_S);
    //*illegal_ptr = 0xFFFFFFFF;
  

    run();
    return 0;
}