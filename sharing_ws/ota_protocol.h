#include <stdint.h>

#define APP_SLOT_A_START_ADDR  ((uint32_t)0x08008000u)
#define APP_SLOT_B_START_ADDR  ((uint32_t)0x08044000u)
#define APP_SLOT_SIZE_BYTES    (APP_SLOT_B_START_ADDR - APP_SLOT_A_START_ADDR)

#define NVM_BOOT_STATE_PAGE_A  ((uint32_t)0x08004000u)
#define NVM_BOOT_STATE_PAGE_B  ((uint32_t)0x08006000u)

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

typedef enum {
    OTA_UPDATE_FULL = 0,
    OTA_UPDATE_SECURE_ONLY = 1,
    OTA_UPDATE_NONSECURE_ONLY = 2
} OtaUpdateKind_t;

typedef enum {
    OTA_PACKET_QUERY = 1,
    OTA_PACKET_RESPONSE = 2,
    OTA_PACKET_IMAGE_BEGIN = 3,
    OTA_PACKET_IMAGE_CHUNK = 4,
    OTA_PACKET_IMAGE_END = 5,
    OTA_PACKET_ACK = 6,
    OTA_PACKET_DONE = 7
} OtaPacketType_t;

#define OTA_PROTOCOL_MAGIC        ((uint32_t)0x4F544132u) /* OTA2 */
#define OTA_PROTOCOL_VERSION      ((uint8_t)1u)
#define OTA_MAX_CHUNK_BYTES       ((uint16_t)96u)

typedef struct __attribute__((packed)) {
    uint32_t magic;
    uint8_t version;
    uint8_t packet_type;
    uint8_t update_kind;
    uint8_t image_kind;
    uint32_t transfer_id;
    uint32_t total_bytes;
    uint32_t chunk_index;
    uint16_t chunk_bytes;
    uint16_t total_chunks;
} OtaPacketHeader_t;

typedef struct {
    uint32_t version;
    AppSlot_t active_slot;
    UpdateStatus_t pending_slot;
    uint8_t boot_attempts;
    uint8_t reserved[1];
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