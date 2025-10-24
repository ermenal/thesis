#include "arm_cmse.h"
#include "nsc_gpio.h"
#include "secure_gpio.h"

// This function is the secure gateway. The __attribute__ tells the
// compiler to place an SG instruction at the start of this function,
// making it a valid entry point from the Non-secure world.
__attribute__((cmse_nonsecure_entry))
void nsc_led_toggle(void)
{
  // The gateway function calls the internal secure function.
  // In a real-world application, you would perform security checks
  // on any parameters passed from the Non-secure world here.
  secure_led_toggle();
}