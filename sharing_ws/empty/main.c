/***************************************************************************//**
 * @file main.c
 * @brief main() function.
 *******************************************************************************
 * # License
 * <b>Copyright 2025 Silicon Laboratories Inc. www.silabs.com</b>
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
#include "simplicity_sdk_2025.6.2/platform/emlib/inc/em_msc.h"
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "../ota_protocol.h"

void jump_to_application(uint32_t app_start_address);

uint32_t get_slot_address(AppSlot_t slot)
{
    return (slot == SLOT_A) ? APP_SLOT_A_START_ADDR : APP_SLOT_B_START_ADDR;
}

int main(void)
{
  /*
  * TODO 
  * - get boot state from slot_a_state_page
  *   
  * - check if any update going on etc
  *
  * - boot into correct slot 
  * 
  * For now just boot into slot A
  */

  AppSlot_t boot_slot = SLOT_A; // TODO determine based on state
  uint32_t app_start_address = boot_state_slot_address(boot_slot);
  jump_to_application(app_start_address);
  while (1) {}
}

__attribute__((noreturn))
void jump_to_address(uint32_t msp, uint32_t reset_vector)
{
    __asm__ volatile (
        "MSR MSP, %0\n"      // Set the Main Stack Pointer (MSP_S)
        "BX %1\n"            // Branch to the reset vector
        : /* no outputs */
        : "r" (msp), "r" (reset_vector)
        : /* no clobbers */
    );
    while(1); // This line is never reached
}

void jump_to_application(uint32_t app_start_address)
{
    // This is a Secure-to-Secure jump.
    // The target address is the start of the application's *Secure* vector table.
    
    // 1. Get the application's initial Stack Pointer (MSP_S)
    uint32_t app_stack_pointer = *((uint32_t *)app_start_address);

    // 2. Get the application's Reset Handler (Secure entry point)
    uint32_t app_reset_handler_addr = *((uint32_t *)(app_start_address + 4));

    SCB->VTOR = app_start_address;
    __DSB();
    __ISB();

    // 3. Set the application's stack pointer
    __set_MSP(app_stack_pointer);

    // 4. Create a function pointer to the app's reset handler and call it
    jump_to_address(app_stack_pointer, app_reset_handler_addr);
}