# RAIL OTA Update Server

## Introduction

This project now acts as an OTA update server for the TrustZone board in `rtz`.
It listens for `OTA_MSG_QUERY`, responds with either `OTA_MSG_RESP_NO_UPDATE` or
`OTA_MSG_RESP_UPDATE_AVAILABLE`, then streams chunks and an EOF packet.

It can serve Secure and Non-secure images independently by absolute flash
address:

- Secure image base: `0x08000000`
- Non-secure image base: `0x08040000`

## Prerequisites

The Empty Example application is supported on every EFR32 generations and
families that support proprietary software.

## Getting Started

1. Build Secure and/or Non-secure firmware in `rtz`.
2. Convert each image to `.bin` if needed.
3. Generate `ota_server_images.h` in this folder.
4. Build and flash `rail_soc_empty` to the second board.

Example:

```bash
arm-none-eabi-objcopy -O binary ../rtz/rtz_s/build/debug/rtz_s.out /tmp/rtz_s.bin
arm-none-eabi-objcopy -O binary ../rtz/rtz_ns/build/debug/rtz_ns.out /tmp/rtz_ns.bin
python3 tools/generate_ota_server_images_header.py \
  --secure-bin /tmp/rtz_s.bin \
  --nonsecure-bin /tmp/rtz_ns.bin \
  --out ota_server_images.h
```

If you want to update only one world, omit the other `--*-bin` argument.

----

You can make the example energy friendly as simple as installing the `Power
Manager` component. Doing that the device will go to EM2 state after
initialization.

----

Adding basic packet TX/RX capabilities you might install the `Simple RAIL
Tx`/`Simple RAIL Rx` components.

## Protocol

Shared protocol must be kept in sync between `ota_protocol.h` in this project
and `rtz/rtz_s/ota_protocol.h`.

- `OTA_MAX_CHUNK_SIZE` is set to `60` bytes to fit the current radio frame setup.
- The server marks each image as consumed after a full transfer, so each image is
  offered once after boot.

## Notes

- This is a proof-of-concept flow with no authentication, integrity checks,
  rollback, or anti-replay.
- Images are programmed directly to target flash ranges by the secure world.

## Resources

- `ota_protocol.h`
- `app_process.c`

## Report Bugs & Get Support

You are always encouraged and welcome to report any issues you found to us via
[Silicon Labs
Community](https://community.silabs.com/s/topic/0TO1M000000qHaKWAU/proprietary?language=en_US).
