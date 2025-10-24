#include "secure_gpio.h"

// This function can only be called by other code in the Secure world.
void secure_led_toggle(void)
{
  // The LED is on Port B, Pin 2
  GPIO_PinOutToggle(gpioPortB, 2);
  GPIO_PinOutToggle(gpioPortB, 2);
}