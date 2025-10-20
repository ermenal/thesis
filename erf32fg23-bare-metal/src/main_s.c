#include "em_device.h"
#include "tz_config.h"

// Define the entry point for the Non-Secure application
#define NON_SECURE_START_ADDRESS (0x08010000)

// Function pointer to the Non-Secure Reset Handler
typedef void (*NonSecureResetHandler_t)(void) __attribute__((cmse_nonsecure_call));

// Implementation of our first Secure API function
void SECURE_hello_world(void) __attribute__((cmse_nonsecure_entry));
void SECURE_hello_world(void)
{
  // This function is called from the Non-Secure world!
  // We can add a breakpoint here to verify.
  __asm("NOP");
}

int main(void)
{
  // 1. Initialize Secure world components (e.g., clocks, peripherals)

  // 2. Configure system security via the SMU (Security Management Unit)
  //    - This is where we will partition peripherals (PPU) and bus masters (BMPU)
  SMU->PPUSATD0 &= ~SMU_PPUSATD0_USART0; // Set USART0 to Non-secure

  // 3. Set up the Non-Secure vector table and stack pointer
  //    The Non-Secure vector table is located at the start of the Non-Secure flash region.
  uint32_t* ns_vector_table = (uint32_t*)NON_SECURE_START_ADDRESS;
  SCB_NS->VTOR = (uint32_t)ns_vector_table;

  // 4. Get the Non-Secure Reset Handler address from the vector table
  NonSecureResetHandler_t NonSecure_ResetHandler = (NonSecureResetHandler_t)(*(ns_vector_table + 1));

  // 5. Jump to the Non-Secure application
  NonSecure_ResetHandler();

  // This part should not be reached
  while(1);
}