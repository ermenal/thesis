#!/usr/bin/env bash

# Increase slot_A versions met 1, slot_B versions met 2
# call van thesis_proj1 dir

set -euo pipefail

update_version_define() {
  local file="$1"
  local macro="$2"
  local step="$3"

  if [[ ! -f "$file" ]]; then
    echo "File not found: $file" >&2
    exit 1
  fi

  local line
  line="$(grep -m1 -E "^[[:space:]]*#define[[:space:]]+${macro}[[:space:]]+[0-9]+[uU]?[[:space:]]*$" "$file" || true)"

  if [[ -z "$line" ]]; then
    echo "Could not find ${macro} define in $file" >&2
    exit 1
  fi

  local current next
  current="$(printf '%s\n' "$line" | sed -E "s/^[[:space:]]*#define[[:space:]]+${macro}[[:space:]]+([0-9]+)[uU]?[[:space:]]*$/\\1/")"
  next="$((current + step))"

  sed -Ei "0,/^[[:space:]]*#define[[:space:]]+${macro}[[:space:]]+[0-9]+[uU]?[[:space:]]*$/s|(^[[:space:]]*#define[[:space:]]+${macro}[[:space:]]+)[0-9]+([uU]?[[:space:]]*$)|\1${next}\2|" "$file"

  echo "Updated $file: ${macro} ${current} -> ${next}"
}

update_version_define "image_slot_A/rtz_ns/main.c" "NONSECURE_WORLD_MARKER_VERSION" 1
update_version_define "image_slot_B/rtz_ns/main.c" "NONSECURE_WORLD_MARKER_VERSION" 2
update_version_define "image_slot_A/rtz_s/second_main.c" "SECURE_WORLD_MARKER_VERSION" 1
update_version_define "image_slot_B/rtz_s/second_main.c" "SECURE_WORLD_MARKER_VERSION" 2