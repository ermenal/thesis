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
// #include "efr32fg23_wdog.h"
#include "em_cmu.h"
#include "em_wdog.h"
#include "simplicity_sdk_2025.6.2/platform/emlib/inc/em_msc.h"
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "../boot_state.h"

void setup_watchdog(void);
void setup_sau_for_fsb(void);
void jump_to_application(uint32_t app_start_address);

#define CRC32_INITIAL_VALUE 0xFFFFFFFFu
#define CRC32_XOR_OUT       0xFFFFFFFFu
#define CRC32_POLYNOMIAL    0xEDB88320u

#define BOOT_STATE_CRC_LENGTH (offsetof(NvmBootState_t, crc32))

static uint32_t crc32_compute(const void *data, size_t length)
{
    const uint8_t *bytes = (const uint8_t *)data;
    uint32_t crc = CRC32_INITIAL_VALUE;

    for (size_t i = 0; i < length; i++) {
        crc ^= bytes[i];
        for (uint8_t bit = 0; bit < 8; bit++) {
            if (crc & 1u) {
                crc = (crc >> 1) ^ CRC32_POLYNOMIAL;
            } else {
                crc >>= 1;
            }
        }
    }

    return crc ^ CRC32_XOR_OUT;
}

static bool slot_value_valid(AppSlot_t slot)
{
    return (slot == SLOT_A) || (slot == SLOT_B);
}

static bool pending_value_valid(UpdateStatus_t status)
{
    switch (status) {
        case UPDATE_NONE:
        case UPDATE_PENDING_A:
        case UPDATE_PENDING_B:
            return true;
        default:
            return false;
    }
}

static bool NVM_IsStateValid(const NvmBootState_t *state)
{
    if (state->magic != BOOT_STATE_MAGIC) {
        return false;
    }

    if (!slot_value_valid(state->active_slot)) {
        return false;
    }

    if (!pending_value_valid(state->pending_slot)) {
        return false;
    }

    uint32_t computed_crc = crc32_compute(state, BOOT_STATE_CRC_LENGTH);
    return (computed_crc == state->crc32);
}

static bool NVM_ReadLatestState(NvmBootState_t *out_state, uint32_t *out_page_addr)
{
    const NvmBootState_t *state_A = (const NvmBootState_t *)NVM_BOOT_STATE_PAGE_A;
    const NvmBootState_t *state_B = (const NvmBootState_t *)NVM_BOOT_STATE_PAGE_B;

    bool valid_A = NVM_IsStateValid(state_A);
    bool valid_B = NVM_IsStateValid(state_B);

    if (!valid_A && !valid_B) {
        return false;
    }

    const NvmBootState_t *chosen = NULL;
    uint32_t chosen_page = 0u;

    if (valid_A && valid_B) {
        if (state_A->version >= state_B->version) {
            chosen = state_A;
            chosen_page = NVM_BOOT_STATE_PAGE_A;
        } else {
            chosen = state_B;
            chosen_page = NVM_BOOT_STATE_PAGE_B;
        }
    } else if (valid_A) {
        chosen = state_A;
        chosen_page = NVM_BOOT_STATE_PAGE_A;
    } else {
        chosen = state_B;
        chosen_page = NVM_BOOT_STATE_PAGE_B;
    }

    memcpy(out_state, chosen, sizeof(NvmBootState_t));
    *out_page_addr = chosen_page;
    return true;
}

static uint32_t NVM_GetAlternatePage(uint32_t current_page)
{
    return (current_page == NVM_BOOT_STATE_PAGE_A) ? NVM_BOOT_STATE_PAGE_B : NVM_BOOT_STATE_PAGE_A;
}

static void NVM_WriteStateToPage(const NvmBootState_t *state, uint32_t page_address)
{
    MSC_Init();

    MSC_Status_TypeDef status = MSC_ErasePage((uint32_t *)page_address);
    if (status != mscReturnOk) {
        while (1) {}
    }

    status = MSC_WriteWord((uint32_t *)page_address, (const void *)state, sizeof(NvmBootState_t));
    if (status != mscReturnOk) {
        while (1) {}
    }

    MSC_Deinit();
}

static void NVM_CommitState(NvmBootState_t *state,
                            uint32_t *state_page_address,
                            AppSlot_t active_slot,
                            UpdateStatus_t pending_slot,
                            uint8_t boot_attempts)
{
    NvmBootState_t new_state = {
        .magic = BOOT_STATE_MAGIC,
        .version = state->version + 1u,
        .active_slot = active_slot,
        .pending_slot = pending_slot,
        .boot_attempts = boot_attempts,
        .reserved = {0},
        .crc32 = 0u,
    };

    new_state.crc32 = crc32_compute(&new_state, BOOT_STATE_CRC_LENGTH);

    uint32_t target_page = NVM_GetAlternatePage(*state_page_address);
    NVM_WriteStateToPage(&new_state, target_page);

    *state = new_state;
    *state_page_address = target_page;
}

uint32_t get_slot_address(AppSlot_t slot)
{
    return (slot == SLOT_A) ? APP_SLOT_A_START_ADDR : APP_SLOT_B_START_ADDR;
}

int main(void)
{
  // sl_main_init();

  //setup_sau_for_fsb();
  // setup_watchdog();

  NvmBootState_t state = {0};
  uint32_t state_page = NVM_BOOT_STATE_PAGE_A;

  bool have_state = NVM_ReadLatestState(&state, &state_page);
  if (!have_state) {
      NvmBootState_t initial_state = { 0 };
      initial_state.magic = BOOT_STATE_MAGIC;
      initial_state.version = 1u;
      initial_state.active_slot = SLOT_A;
      initial_state.pending_slot = UPDATE_NONE;
      initial_state.boot_attempts = 0u;
      initial_state.crc32 = crc32_compute(&initial_state, BOOT_STATE_CRC_LENGTH);

      NVM_WriteStateToPage(&initial_state, NVM_BOOT_STATE_PAGE_A);

      state = initial_state;
      state_page = NVM_BOOT_STATE_PAGE_A;
      have_state = true;
  }

  AppSlot_t boot_slot = state.active_slot;

  // 2. Check for a pending update (just downloaded and "activated")
  if (state.pending_slot != UPDATE_NONE) {
      AppSlot_t new_slot = (state.pending_slot == UPDATE_PENDING_A) ? SLOT_A : SLOT_B;

      NVM_CommitState(&state, &state_page, new_slot, UPDATE_NONE, 1u);

      boot_slot = new_slot;
  }
  // 3. Check for an un-committed, failing application
  else if (state.boot_attempts > 0u) {
      if (state.boot_attempts >= MAX_BOOT_RETRIES) {
          AppSlot_t last_known_good_slot = (state.active_slot == SLOT_A) ? SLOT_B : SLOT_A;

          NVM_CommitState(&state, &state_page, last_known_good_slot, UPDATE_NONE, 0u);

          NVIC_SystemReset();
          while (1) {}
      } else {
          uint8_t next_attempt = (uint8_t)(state.boot_attempts + 1u);
          NVM_CommitState(&state, &state_page, state.active_slot, UPDATE_NONE, next_attempt);
          boot_slot = state.active_slot;
      }
  } else {
      boot_slot = state.active_slot;
  }

  uint32_t boot_address = get_slot_address(boot_slot);
  jump_to_application(boot_address);
  while (1) {}
}

void setup_sau_for_fsb(void)
{
    // The FSB, running in Secure state, must protect itself and the
    // metadata page before handing off control.
    
    // The App_S, once it starts, will configure the S/NS/NSC 
    // regions for the application itself.
    // Issue: secure gebruikt al veel regions ... 

    // Region 0: Protect FSB (16K)
    SAU->RNR = 0;
    SAU->RBAR = 0x08000000 & SAU_RBAR_BADDR_Msk;
    SAU->RLAR = (0x08003FFF & SAU_RLAR_LADDR_Msk) | SAU_RLAR_ENABLE_Msk; // Secure, NSC=0
    
    // Region 1: Protect Metadata (8K)
    SAU->RNR = 1;
    SAU->RBAR = 0x0807C000 & SAU_RBAR_BADDR_Msk;
    SAU->RLAR = (0x0807DFFF & SAU_RLAR_LADDR_Msk) | SAU_RLAR_ENABLE_Msk; // Secure, NSC=0

    // Enable the SAU
    SAU->CTRL |= SAU_CTRL_ENABLE_Msk;
}

void setup_watchdog(void)
{
    // Enable clocks for WDOG
    CMU_ClockEnable(cmuClock_WDOG0, true);
    // CMU_OscillatorEnable(cmuOsc_ULFRCO, true, true); // Use 1kHz LF osc

    WDOG_TypeDef *wdog = WDOG0;
    WDOG_Init_TypeDef wdog_init = WDOG_INIT_DEFAULT;
    
    // Set a long timeout period (e.g., ~4 minutes) for the app to commit
    wdog_init.perSel = wdogPeriod_256k; 
    wdog_init.lock = true; // Lock WDOG config

    WDOGn_Init(wdog, &wdog_init);
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
