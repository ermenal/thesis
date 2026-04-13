#!/usr/bin/env bash
set -euo pipefail

SCRIPT_NAME="$(basename "$0")"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SECURE_FILE="$ROOT_DIR/sharing/sharing_s/simplicity_sdk_2025.6.2/platform/security/sl_component/sl_trustzone/src/sli_tz_secure_main.c"
NS_FILE="$ROOT_DIR/sharing/sharing_ns/main.c"
GEN_SCRIPT="$ROOT_DIR/scripts/generate_ota_slot_images.sh"
SERVER_DIR="$ROOT_DIR/rail_soc_simple_trx"
SERVER_S37="$SERVER_DIR/build/debug/rail_soc_simple_trx.s37"

if command -v nproc >/dev/null 2>&1; then
  DEFAULT_JOBS="$(nproc)"
else
  DEFAULT_JOBS=4
fi

JOBS="$DEFAULT_JOBS"
BUMP_KIND="patch"
S_VERSION_OVERRIDE=""
NS_VERSION_OVERRIDE=""
BUILD_SERVER=1
FLASH_SERVER=0
CONNECT_VCOM=0
DRY_RUN=0
SERVER_SERIAL="${SERVER_SERIAL:-440262075}"

usage() {
  cat <<EOF
Usage: $SCRIPT_NAME [options]

Bump S/NS version macros, regenerate slot A/B OTA image headers,
and (optionally) flash the update server board.

Options:
  --bump {patch|minor|major|none}  Version bump type (default: patch)
  --s-version X.Y.Z                Set secure version explicitly
  --ns-version X.Y.Z               Set non-secure version explicitly
  --jobs N                         Parallel build jobs (default: $DEFAULT_JOBS)
  --no-build-server                Skip update server build
  --flash-server                   Flash update server board after build
  --server-serial SERIAL           Update server serial number (default: $SERVER_SERIAL)
  --connect-vcom                   Run 'commander-cli vcom connect' after flashing
  --dry-run                        Show what would happen without changing files
  -h, --help                       Show this help

Examples:
  $SCRIPT_NAME
  $SCRIPT_NAME --bump minor
  $SCRIPT_NAME --s-version 0.2.0 --ns-version 0.2.0
  $SCRIPT_NAME --bump patch --flash-server --server-serial 440262075
EOF
}

die() {
  echo "Error: $*" >&2
  exit 1
}

require_tool() {
  local tool_name="$1"
  command -v "$tool_name" >/dev/null 2>&1 || die "Missing required tool: $tool_name"
}

version_is_valid() {
  [[ "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]
}

get_version_from_define() {
  local file_path="$1"
  local macro_name="$2"
  local tag_prefix="$3"
  local line

  line="$(grep -E "^#define ${macro_name} \"${tag_prefix}[0-9]+\.[0-9]+\.[0-9]+\"" "$file_path" | head -n1 || true)"
  [[ -n "$line" ]] || die "Could not find ${macro_name} in $file_path"

  sed -E "s/^#define ${macro_name} \"${tag_prefix}([0-9]+\.[0-9]+\.[0-9]+)\"$/\1/" <<< "$line"
}

bump_semver() {
  local version="$1"
  local kind="$2"
  local major minor patch

  IFS='.' read -r major minor patch <<< "$version"

  case "$kind" in
    patch)
      patch=$((patch + 1))
      ;;
    minor)
      minor=$((minor + 1))
      patch=0
      ;;
    major)
      major=$((major + 1))
      minor=0
      patch=0
      ;;
    none)
      ;;
    *)
      die "Unsupported bump kind: $kind"
      ;;
  esac

  printf "%d.%d.%d" "$major" "$minor" "$patch"
}

replace_define_version() {
  local file_path="$1"
  local macro_name="$2"
  local tag_prefix="$3"
  local new_version="$4"
  local escaped_new="${tag_prefix}${new_version}"

  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[dry-run] Would set ${macro_name} to ${escaped_new} in $file_path"
    return
  fi

  sed -E -i "s|^#define ${macro_name} \"${tag_prefix}[0-9]+\.[0-9]+\.[0-9]+\"|#define ${macro_name} \"${escaped_new}\"|" "$file_path"
}

run_cmd() {
  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[dry-run] $*"
  else
    echo "+ $*"
    "$@"
  fi
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --bump)
      [[ $# -ge 2 ]] || die "--bump requires a value"
      BUMP_KIND="$2"
      shift 2
      ;;
    --s-version)
      [[ $# -ge 2 ]] || die "--s-version requires a value"
      S_VERSION_OVERRIDE="$2"
      shift 2
      ;;
    --ns-version)
      [[ $# -ge 2 ]] || die "--ns-version requires a value"
      NS_VERSION_OVERRIDE="$2"
      shift 2
      ;;
    --jobs)
      [[ $# -ge 2 ]] || die "--jobs requires a value"
      JOBS="$2"
      shift 2
      ;;
    --no-build-server)
      BUILD_SERVER=0
      shift
      ;;
    --flash-server)
      FLASH_SERVER=1
      shift
      ;;
    --server-serial)
      [[ $# -ge 2 ]] || die "--server-serial requires a value"
      SERVER_SERIAL="$2"
      shift 2
      ;;
    --connect-vcom)
      CONNECT_VCOM=1
      shift
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      die "Unknown argument: $1"
      ;;
  esac
done

[[ "$BUMP_KIND" =~ ^(patch|minor|major|none)$ ]] || die "--bump must be patch, minor, major, or none"
[[ "$JOBS" =~ ^[0-9]+$ ]] || die "--jobs must be numeric"

if [[ -n "$S_VERSION_OVERRIDE" ]] && ! version_is_valid "$S_VERSION_OVERRIDE"; then
  die "--s-version must look like X.Y.Z"
fi
if [[ -n "$NS_VERSION_OVERRIDE" ]] && ! version_is_valid "$NS_VERSION_OVERRIDE"; then
  die "--ns-version must look like X.Y.Z"
fi
if [[ "$FLASH_SERVER" -eq 1 ]] && [[ "$BUILD_SERVER" -eq 0 ]]; then
  die "--flash-server requires server build (remove --no-build-server)"
fi

require_tool grep
require_tool sed
require_tool make
require_tool bash
[[ -x "$GEN_SCRIPT" ]] || die "Generation script not found or not executable: $GEN_SCRIPT"

if [[ "$FLASH_SERVER" -eq 1 ]] || [[ "$CONNECT_VCOM" -eq 1 ]]; then
  require_tool commander-cli
fi

current_s_version="$(get_version_from_define "$SECURE_FILE" "S_VERSION" "S-")"
current_ns_version="$(get_version_from_define "$NS_FILE" "NS_VERSION" "NS-")"

if [[ -n "$S_VERSION_OVERRIDE" ]]; then
  target_s_version="$S_VERSION_OVERRIDE"
else
  target_s_version="$(bump_semver "$current_s_version" "$BUMP_KIND")"
fi

if [[ -n "$NS_VERSION_OVERRIDE" ]]; then
  target_ns_version="$NS_VERSION_OVERRIDE"
else
  target_ns_version="$(bump_semver "$current_ns_version" "$BUMP_KIND")"
fi

echo "Secure version   : S-$current_s_version -> S-$target_s_version"
echo "Non-secure ver.  : NS-$current_ns_version -> NS-$target_ns_version"

replace_define_version "$SECURE_FILE" "S_VERSION" "S-" "$target_s_version"
replace_define_version "$NS_FILE" "NS_VERSION" "NS-" "$target_ns_version"

run_cmd env JOBS="$JOBS" "$GEN_SCRIPT"

if [[ "$BUILD_SERVER" -eq 1 ]]; then
  run_cmd make -C "$SERVER_DIR" -f rail_soc_simple_trx.Makefile -j"$JOBS" debug
fi

if [[ "$FLASH_SERVER" -eq 1 ]]; then
  run_cmd commander-cli flash --masserase --serialno "$SERVER_SERIAL" "$SERVER_S37"
fi

if [[ "$CONNECT_VCOM" -eq 1 ]]; then
  run_cmd commander-cli vcom connect --serialno "$SERVER_SERIAL"
fi

echo "Done."
