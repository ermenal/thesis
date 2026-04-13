#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SHARING_S_DIR="$ROOT_DIR/sharing/sharing_s"
SHARING_NS_DIR="$ROOT_DIR/sharing/sharing_ns"
SERVER_GENERATED_DIR="$ROOT_DIR/rail_soc_simple_trx/generated"

S_LINKER="$SHARING_S_DIR/autogen/linkerfile.ld"
NS_LINKER="$SHARING_NS_DIR/autogen/linkerfile.ld"

APP_SLOT_A_START_ADDR=0x08008000
APP_SLOT_B_START_ADDR=0x08044000
SLOT_OFFSET=$((APP_SLOT_B_START_ADDR - APP_SLOT_A_START_ADDR))

if command -v nproc >/dev/null 2>&1; then
  DEFAULT_JOBS="$(nproc)"
else
  DEFAULT_JOBS=4
fi
JOBS="${JOBS:-$DEFAULT_JOBS}"

require_tool() {
  local tool_name="$1"
  if ! command -v "$tool_name" >/dev/null 2>&1; then
    echo "Missing required tool: $tool_name" >&2
    exit 1
  fi
}

patch_linker_for_slot_b() {
  local input_file="$1"
  local output_file="$2"
  SLOT_OFFSET_HEX="$(printf "0x%X" "$SLOT_OFFSET")" perl -e '
    use strict;
    use warnings;

    my $offset = hex($ENV{SLOT_OFFSET_HEX});

    while (<>) {
      s/(FLASH\s+\(rx\)\s*:\s*ORIGIN\s*=\s*)0x([0-9A-Fa-f]+)/sprintf("%s0x%X", $1, hex($2) + $offset)/e;
      s/(__main_flash_end__\s*=\s*)0x([0-9A-Fa-f]+)(\s*\+\s*0x[0-9A-Fa-f]+\s*;)/sprintf("%s0x%X%s", $1, hex($2) + $offset, $3)/e;
      s/(app_flash_end\s*=\s*)0x([0-9A-Fa-f]+)(\s*\+\s*0x[0-9A-Fa-f]+\s*;)/sprintf("%s0x%X%s", $1, hex($2) + $offset, $3)/e;
      print;
    }
  ' "$input_file" > "$output_file"
}

build_pair() {
  local output_secure_bin="$1"
  local output_nonsecure_bin="$2"

  make -C "$SHARING_S_DIR" -f sharing_s.Makefile clean
  make -C "$SHARING_S_DIR" -f sharing_s.Makefile -j"$JOBS" debug

  make -C "$SHARING_NS_DIR" -f sharing_ns.Makefile clean
  make -C "$SHARING_NS_DIR" -f sharing_ns.Makefile -j"$JOBS" debug

  cp "$SHARING_S_DIR/build/debug/sharing_s.bin" "$output_secure_bin"
  cp "$SHARING_NS_DIR/build/debug/sharing_ns.bin" "$output_nonsecure_bin"
}

emit_header() {
  local input_bin="$1"
  local symbol_name="$2"
  local output_header="$3"
  local temp_header="$output_header.tmp"

  xxd -i -n "$symbol_name" "$input_bin" > "$temp_header"
  sed -e 's/^unsigned char /const unsigned char /' \
      -e 's/^unsigned int /const unsigned int /' \
      "$temp_header" > "$output_header"
  rm -f "$temp_header"
}

restore_linkers() {
  cp "$BACKUP_S_LINKER" "$S_LINKER"
  cp "$BACKUP_NS_LINKER" "$NS_LINKER"
}

require_tool make
require_tool perl
require_tool xxd

TMP_DIR="$(mktemp -d)"
BACKUP_S_LINKER="$TMP_DIR/linkerfile_s.orig.ld"
BACKUP_NS_LINKER="$TMP_DIR/linkerfile_ns.orig.ld"

cp "$S_LINKER" "$BACKUP_S_LINKER"
cp "$NS_LINKER" "$BACKUP_NS_LINKER"

cleanup() {
  restore_linkers
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

mkdir -p "$SERVER_GENERATED_DIR"

echo "[1/3] Building slot A binaries"
build_pair "$TMP_DIR/sharing_s_slot_a.bin" "$TMP_DIR/sharing_ns_slot_a.bin"

echo "[2/3] Building slot B binaries"
patch_linker_for_slot_b "$BACKUP_S_LINKER" "$S_LINKER"
patch_linker_for_slot_b "$BACKUP_NS_LINKER" "$NS_LINKER"
build_pair "$TMP_DIR/sharing_s_slot_b.bin" "$TMP_DIR/sharing_ns_slot_b.bin"

restore_linkers

echo "[3/3] Generating slot-specific OTA image headers"
emit_header "$TMP_DIR/sharing_s_slot_a.bin" "sharing_s_slot_a_image" "$SERVER_GENERATED_DIR/sharing_s_slot_a_image.h"
emit_header "$TMP_DIR/sharing_ns_slot_a.bin" "sharing_ns_slot_a_image" "$SERVER_GENERATED_DIR/sharing_ns_slot_a_image.h"
emit_header "$TMP_DIR/sharing_s_slot_b.bin" "sharing_s_slot_b_image" "$SERVER_GENERATED_DIR/sharing_s_slot_b_image.h"
emit_header "$TMP_DIR/sharing_ns_slot_b.bin" "sharing_ns_slot_b_image" "$SERVER_GENERATED_DIR/sharing_ns_slot_b_image.h"

echo "Done. Generated:"
echo "  $SERVER_GENERATED_DIR/sharing_s_slot_a_image.h"
echo "  $SERVER_GENERATED_DIR/sharing_ns_slot_a_image.h"
echo "  $SERVER_GENERATED_DIR/sharing_s_slot_b_image.h"
echo "  $SERVER_GENERATED_DIR/sharing_ns_slot_b_image.h"
