#ifndef BOOT_STATE_H
#define BOOT_STATE_H

#include <stdint.h>

#define APP_SLOT_A_START_ADDR  ((uint32_t)0x08008000u)
#define APP_SLOT_B_START_ADDR  ((uint32_t)0x08044000u)
#define APP_SLOT_SIZE_BYTES    (APP_SLOT_B_START_ADDR - APP_SLOT_A_START_ADDR)

#define NVM_BOOT_STATE_PAGE_A  ((uint32_t)0x08004000u)
#define NVM_BOOT_STATE_PAGE_B  ((uint32_t)0x08006000u)

#define BOOT_STATE_MAGIC 0x424F4F54UL /* "BOOT" */
#define MAX_BOOT_RETRIES 3u

typedef enum {
    SLOT_A = 0,
    SLOT_B = 1
} AppSlot_t;

typedef enum {
    UPDATE_NONE = 0,
    UPDATE_PENDING_A = 1,
    UPDATE_PENDING_B = 2
} UpdateStatus_t;

typedef struct {
    uint32_t magic;
    uint32_t version;
    AppSlot_t active_slot;
    UpdateStatus_t pending_slot;
    uint8_t boot_attempts;
    uint8_t reserved[1];
    uint32_t crc32;
} NvmBootState_t;

static inline uint32_t boot_state_slot_address(AppSlot_t slot)
{
    return (slot == SLOT_A) ? APP_SLOT_A_START_ADDR : APP_SLOT_B_START_ADDR;
}

static inline uint32_t boot_state_slot_end(AppSlot_t slot)
{
    return boot_state_slot_address(slot) + APP_SLOT_SIZE_BYTES;
}

static inline UpdateStatus_t boot_state_pending_flag_for_slot(AppSlot_t slot)
{
    return (slot == SLOT_A) ? UPDATE_PENDING_A : UPDATE_PENDING_B;
}

static inline AppSlot_t boot_state_other_slot(AppSlot_t slot)
{
    return (slot == SLOT_A) ? SLOT_B : SLOT_A;
}

#endif /* BOOT_STATE_H */
