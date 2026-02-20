#ifndef OTA_PROTOCOL_H
#define OTA_PROTOCOL_H

#include <stdint.h>

#define OTA_MAX_CHUNK_SIZE 60u

enum {
  OTA_MSG_QUERY = 0x01u,
  OTA_MSG_RESP_NO_UPDATE = 0x02u,
  OTA_MSG_RESP_UPDATE_AVAILABLE = 0x03u,
  OTA_MSG_DATA_CHUNK = 0x04u,
  OTA_MSG_EOF = 0x05u,
  OTA_MSG_ERROR = 0x7Fu
};

enum {
  OTA_TARGET_SECURE = 0u,
  OTA_TARGET_NON_SECURE = 1u
};

typedef struct __attribute__((packed)) {
  uint8_t type;
} ota_simple_frame_t;

typedef struct __attribute__((packed)) {
  uint8_t type;
  uint8_t target;
  uint16_t chunk_size;
  uint32_t total_size;
} ota_update_available_frame_t;

typedef struct __attribute__((packed)) {
  uint8_t type;
  uint8_t target;
  uint16_t length;
  uint32_t offset;
  uint8_t payload[OTA_MAX_CHUNK_SIZE];
} ota_chunk_frame_t;

#define OTA_CHUNK_HEADER_SIZE ((uint16_t)(sizeof(ota_chunk_frame_t) - OTA_MAX_CHUNK_SIZE))

typedef struct __attribute__((packed)) {
  uint8_t type;
  uint8_t status;
} ota_eof_frame_t;

#endif