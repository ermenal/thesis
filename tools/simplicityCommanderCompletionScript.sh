#!/usr/bin/env bash
#
# bash/zsh completion support for the `scmder` (Simplicity Commander) command.
#
# Installation:
#   A. Source this script in your `.bash_profile` or `.zshrc` to enable completion for the `scmder` command.
# 
#   B. Alternatively, for a one-time installation that will automatically keep itself up to date, add the following line to your `.bash_profile` or `.zshrc`:
#
#      source <(scmder completion generate bash --alias scmder)
#
#      NOTE: This assumes that the `scmder` command is in your PATH or otherwise visible to your shell.
#

if [ -n "$BASH_VERSION" ]; then
  # Enable programmable completion facilities when using bash
  shopt -s progcomp
elif [ -n "$ZSH_VERSION" ]; then
  # Make alias a distinct command for completion purposes when using zsh
  setopt COMPLETE_ALIASES
  alias compopt=complete

  # Enable bash completion in zsh
  autoload -U +X compinit && compinit
  autoload -U +X bashcompinit && bashcompinit
fi

function __scmder_COMP_WORDS_contains_array() {
  declare -a localArray
  localArray=("$@")
  local findme
  for findme in "${localArray[@]}"; do
    if __scmder_element_not_in_COMP_WORDS "$findme"; then return 1; fi
  done
  return 0
}

function __scmder_element_not_in_COMP_WORDS() {
  local findme="$1"
  local element
  for element in "${COMP_WORDS[@]}"; do
    if [[ "$findme" = "$element" ]]; then return 1; fi
  done
  return 0
}

function __scmder_complete_serial_number() {
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  local available_serial_nos=$(scmder completion listserialnos --hide-from-log)
  COMPREPLY=($(compgen -W "${available_serial_nos}" -- "${curr_word}"))
}

function __scmder_complete_ip() {
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  local available_ips=$(scmder completion listips --hide-from-log)
  COMPREPLY=($(compgen -W "${available_ips}" -- "${curr_word}"))
}

__scmder_available_devices=$(scmder completion listopns --hide-from-log)

function __scmder_complete_device() {
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  COMPREPLY=($(compgen -W "${__scmder_available_devices}" -- "${curr_word}"))
}


# Bash completion entry point function.
# __complete_scmder finds which commands and subcommands have been specified
# on the command line and delegates to the appropriate function
# to generate possible options and subcommands for the last specified subcommand.
function __complete_scmder() {
  local prev_word=${COMP_WORDS[COMP_CWORD-1]}
  if [[ $prev_word == "--serialno" ]] || [[ $prev_word == "-s" ]]; then 
    __scmder_complete_serial_number
    return $?
  fi

  if [[ $prev_word == "--ip" ]]; then 
    __scmder_complete_ip
    return $?
  fi

  if [[ $prev_word == "--device" ]] || [[ $prev_word == "-d" ]]; then 
    __scmder_complete_device
    return $?
  fi

  if __scmder_COMP_WORDS_contains_array "adapter"; then __scmder_adapter; return $?; fi
  if __scmder_COMP_WORDS_contains_array "aem"; then __scmder_aem; return $?; fi
  if __scmder_COMP_WORDS_contains_array "completion"; then __scmder_completion; return $?; fi
  if __scmder_COMP_WORDS_contains_array "configure"; then __scmder_configure; return $?; fi
  if __scmder_COMP_WORDS_contains_array "ctune"; then __scmder_ctune; return $?; fi
  if __scmder_COMP_WORDS_contains_array "device"; then __scmder_device; return $?; fi
  if __scmder_COMP_WORDS_contains_array "ebl"; then __scmder_ebl; return $?; fi
  if __scmder_COMP_WORDS_contains_array "extflash"; then __scmder_extflash; return $?; fi
  if __scmder_COMP_WORDS_contains_array "gbl3"; then __scmder_gbl3; return $?; fi
  if __scmder_COMP_WORDS_contains_array "gbl4"; then __scmder_gbl4; return $?; fi
  if __scmder_COMP_WORDS_contains_array "littlefs"; then __scmder_littlefs; return $?; fi
  if __scmder_COMP_WORDS_contains_array "mfg917"; then __scmder_mfg917; return $?; fi
  if __scmder_COMP_WORDS_contains_array "nvm3"; then __scmder_nvm3; return $?; fi
  if __scmder_COMP_WORDS_contains_array "ota"; then __scmder_ota; return $?; fi
  if __scmder_COMP_WORDS_contains_array "rps"; then __scmder_rps; return $?; fi
  if __scmder_COMP_WORDS_contains_array "rtt"; then __scmder_rtt; return $?; fi
  if __scmder_COMP_WORDS_contains_array "security"; then __scmder_security; return $?; fi
  if __scmder_COMP_WORDS_contains_array "serial"; then __scmder_serial; return $?; fi
  if __scmder_COMP_WORDS_contains_array "swo"; then __scmder_swo; return $?; fi
  if __scmder_COMP_WORDS_contains_array "tokens"; then __scmder_tokens; return $?; fi
  if __scmder_COMP_WORDS_contains_array "util"; then __scmder_util; return $?; fi
  if __scmder_COMP_WORDS_contains_array "vcom"; then __scmder_vcom; return $?; fi
  if __scmder_COMP_WORDS_contains_array "vuart"; then __scmder_vuart; return $?; fi

  # Top-level only commands
  if __scmder_COMP_WORDS_contains_array "convert"; then __scmder_convert; return $?; fi
  if __scmder_COMP_WORDS_contains_array "flash"; then __scmder_flash; return $?; fi
  if __scmder_COMP_WORDS_contains_array "postbuild"; then __scmder_postbuild; return $?; fi
  if __scmder_COMP_WORDS_contains_array "readmem"; then __scmder_readmem; return $?; fi
  if __scmder_COMP_WORDS_contains_array "verify"; then __scmder_verify; return $?; fi

  # No subcommands were specified; generate completions for the top-level command.
  __scmder_top_level; return $?;
}

# Generates completions for the options and subcommands of the `scmder` command.
function __scmder_top_level() {
  # Get completion data
  local curr_word=${COMP_WORDS[COMP_CWORD]}
  local prev_word=${COMP_WORDS[COMP_CWORD-1]}

  local commands="adapter aem completion configure ctune device ebl extflash gbl3 gbl4 littlefs mfg917 nvm3 ota rps rtt security serial swo tokens util vcom vuart convert flash postbuild readmem verify"
  local options="--help --version"

  compopt +o default

  case ${prev_word} in
    --help)
      return
      ;;
    --version)
      return
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  else
    COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `adapter` subcommand.
function __scmder_adapter() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="dbgmode drivermode fwupgrade fwupgradecheck ip list nick power probe reset voltage"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    dbgmode)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport"
      ;;
    drivermode)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport"
      ;;
    fwupgrade)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --nocheck"
      ;;
    fwupgradecheck)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport"
      ;;
    ip)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --dhcp --addr --dns --gw"
      ;;
    list)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --net --filter"
      ;;
    nick)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --clear"
      ;;
    power)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport"
      ;;
    probe)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --fw --kit --boards"
      ;;
    reset)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport"
      ;;
    voltage)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --nocalibrate"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `aem` subcommand.
function __scmder_aem() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="calibrate dump measure"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    calibrate)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport"
      ;;
    dump)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --outfile --datarate --duration --triggerabove --triggerbelow --triggertimeout --pretrigger --noheader --calibrate"
      ;;
    measure)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --windowlength --calibrate"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `completion` subcommand.
function __scmder_completion() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="generate"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    generate)
      options="--version --help --help-all --device --force --timestamp --json --alias --outfile"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `configure` subcommand.
function __scmder_configure() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="log"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    log)
      options="--version --help --help-all --device --force --timestamp --json"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `ctune` subcommand.
function __scmder_ctune() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="autoset get set"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    autoset)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre"
      ;;
    get)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre"
      ;;
    set)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --value"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `device` subcommand.
function __scmder_device() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="info lock masserase pageerase protect recover reset unlock zwave-qrcode"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    info)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre"
      ;;
    lock)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre"
      ;;
    masserase)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre"
      ;;
    pageerase)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --range --region"
      ;;
    protect)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --disable --range --read --region --write"
      ;;
    recover)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed"
      ;;
    reset)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport"
      ;;
    unlock)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre"
      ;;
    zwave-qrcode)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --timeout"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `ebl` subcommand.
function __scmder_ebl() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="aat-usageinfo create keyconvert keygen parse print"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    aat-usageinfo)
      options="--version --help --help-all --device --force --timestamp --json"
      ;;
    create)
      options="--version --help --help-all --device --force --timestamp --json --app --sign --encrypt --extsign --signature --verify"
      ;;
    keyconvert)
      options="--version --help --help-all --device --force --timestamp --json --type --outfile"
      ;;
    keygen)
      options="--version --help --help-all --device --force --timestamp --json --type --outfile"
      ;;
    parse)
      options="--version --help --help-all --device --force --timestamp --json --app --verify --decrypt"
      ;;
    print)
      options="--version --help --help-all --device --force --timestamp --json"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `extflash` subcommand.
function __scmder_extflash() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="erase read write"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    erase)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --board-id --showprogress --range --noverify"
      ;;
    read)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --board-id --showprogress --outfile --range"
      ;;
    write)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --board-id --showprogress --address --noverify"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `gbl3` subcommand.
function __scmder_gbl3() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="aat-usageinfo create keyconvert keygen parse sign"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    aat-usageinfo)
      options="--version --help --help-all --device --force --timestamp --json"
      ;;
    create)
      options="--version --help --help-all --device --force --timestamp --json --app --bootloader --seupgrade --metadata --compress --certificate --include-section --exclude-section --seunencrypted --dep-app --dep-boot --dep-se --delta-app --sign --encrypt --extsign"
      ;;
    keyconvert)
      options="--version --help --help-all --device --force --timestamp --json --type --outfile"
      ;;
    keygen)
      options="--version --help --help-all --device --force --timestamp --json --type --outfile"
      ;;
    parse)
      options="--version --help --help-all --device --force --timestamp --json --app --bootloader --seupgrade --metadata --verify --decrypt"
      ;;
    sign)
      options="--version --help --help-all --device --force --timestamp --json --outfile --signature --verify"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `gbl4` subcommand.
function __scmder_gbl4() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="create createconfig info parse sign"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    create)
      options="--version --help --help-all --device --force --timestamp --json --config --seupgrade --data --encrypt --compress --certificate --sign --extsign --productid --bundleversion --minversion"
      ;;
    createconfig)
      options="--version --help --help-all --device --force --timestamp --json --outfile"
      ;;
    info)
      options="--version --help --help-all --device --force --timestamp --json"
      ;;
    parse)
      options="--version --help --help-all --device --force --timestamp --json --seupgrade --outfile"
      ;;
    sign)
      options="--version --help --help-all --device --force --timestamp --json --signature --outfile --verify"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `littlefs` subcommand.
function __scmder_littlefs() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="add dump extract info init list remove"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    add)
      options="--version --help --help-all --device --force --timestamp --json --address --range --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --infile --file --dir --outfile"
      ;;
    dump)
      options="--version --help --help-all --device --force --timestamp --json --address --range --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --infile --outfile"
      ;;
    extract)
      options="--version --help --help-all --device --force --timestamp --json --address --range --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --infile --file --dir --dest --zip"
      ;;
    info)
      options="--version --help --help-all --device --force --timestamp --json --address --range --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --infile"
      ;;
    init)
      options="--version --help --help-all --device --force --timestamp --json --address --range --size --outfile"
      ;;
    list)
      options="--version --help --help-all --device --force --timestamp --json --address --range --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --infile"
      ;;
    remove)
      options="--version --help --help-all --device --force --timestamp --json --address --range --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --infile --file --dir --outfile"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `mfg917` subcommand.
function __scmder_mfg917() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="dpdtraining dump erase evmoffset fwupgrade gain info init protectconfig provision provisionotpkeys radio read setupinterface write xocal"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    dpdtraining)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --serialport --baudrate --serialinterface --closeinterface --host --skipinit --pinset --storeinflash --storeinefuse --noprompt --vmcu18"
      ;;
    dump)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --serialport --baudrate --serialinterface --closeinterface --host --skipinit --pinset"
      ;;
    erase)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --serialport --baudrate --serialinterface --closeinterface --host --skipinit --pinset --list --range --position"
      ;;
    evmoffset)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --serialport --baudrate --serialinterface --closeinterface --host --skipinit --pinset --storeinflash --storeinefuse --noprompt --internalant --off0 --off1 --off2 --off3 --off4"
      ;;
    fwupgrade)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --serialport --baudrate --serialinterface --closeinterface --host --skipinit --pinset"
      ;;
    gain)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --serialport --baudrate --serialinterface --closeinterface --host --skipinit --pinset --storeinflash --storeinefuse --noprompt --ch1 --ch6 --ch11 --ch14 --vmcu18"
      ;;
    info)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --serialport --baudrate --serialinterface --closeinterface --host --skipinit --pinset"
      ;;
    init)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --serialport --baudrate --serialinterface --closeinterface --host --skipinit --pinset --mbr --data"
      ;;
    protectconfig)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --serialport --baudrate --serialinterface --closeinterface --host --skipinit --pinset --symmetrickey --privatekey --protectlength --sha --noprompt"
      ;;
    provision)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --serialport --baudrate --serialinterface --closeinterface --host --skipinit --pinset --mbr --keys --data --profile --listprofiles"
      ;;
    provisionotpkeys)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --serialport --baudrate --serialinterface --closeinterface --host --skipinit --pinset --symmetrickey --publickey --noprompt"
      ;;
    radio)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --serialport --baudrate --serialinterface --closeinterface --host --skipinit --pinset --channel --power --phy --noburst --start --stop --internalant --vmcu18"
      ;;
    read)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --serialport --baudrate --serialinterface --closeinterface --host --skipinit --pinset --list --range --position --outfile --property"
      ;;
    setupinterface)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --serialport --baudrate --serialinterface --closeinterface --host --skipinit --pinset"
      ;;
    write)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --serialport --baudrate --serialinterface --closeinterface --host --skipinit --pinset --list --address --position --data --nocrc --noprompt"
      ;;
    xocal)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --serialport --baudrate --serialinterface --closeinterface --host --skipinit --pinset --storeinflash --storeinefuse --offset --ctuneoverride --noprompt --internalant"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `nvm3` subcommand.
function __scmder_nvm3() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="dump initfile parse readdevice set writedevice"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    dump)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --outfile --range"
      ;;
    initfile)
      options="--version --help --help-all --device --force --timestamp --json --outfile --address --size --range"
      ;;
    parse)
      options="--version --help --help-all --device --force --timestamp --json --key --address --range"
      ;;
    readdevice)
      options="--version --help --help-all --device --force --timestamp --json --key --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --range"
      ;;
    set)
      options="--version --help --help-all --device --force --timestamp --json --address --outfile --object --counter --nvm3file --range"
      ;;
    writedevice)
      options="--version --help --help-all --device --force --timestamp --json --object --counter --nvm3file --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --range"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `ota` subcommand.
function __scmder_ota() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="create parse sign verify"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    create)
      options="--version --help --help-all --device --force --timestamp --json --type --outfile --input --vendorid --productid --swversion --swstring --min-sw --max-sw --releasenote --digest --upgrade-image --firmware-version --manufacturer-id --image-type --string --stack-version --credentials --destination --min-hw --max-hw --null --manufacturer-tag --certificate --sign --extsign"
      ;;
    parse)
      options="--version --help --help-all --device --force --timestamp --json --type --outfile"
      ;;
    sign)
      options="--version --help --help-all --device --force --timestamp --json --signature --outfile --curve"
      ;;
    verify)
      options="--version --help --help-all --device --force --timestamp --json --certificate"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `rps` subcommand.
function __scmder_rps() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="convert create load sign"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    convert)
      options="--version --help --help-all --device --force --timestamp --json --encrypt --mic --iv --sign --sha --extsign --app --nwpapp --app-version --fw-info --combinedimage"
      ;;
    create)
      options="--version --help --help-all --device --force --timestamp --json --encrypt --mic --iv --sign --sha --extsign --address --app --app-version --fw-info --include-section --exclude-section --map --combinedimage --key-type --new-key --prev-key"
      ;;
    load)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --eraseapp"
      ;;
    sign)
      options="--version --help --help-all --device --force --timestamp --json --signature --outfile"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `rtt` subcommand.
function __scmder_rtt() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="connect"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    connect)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --timeout --endmarker --blockaddress --readbuffer --writebuffer --terminal --noreset --lineending"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `security` subcommand.
function __scmder_security() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="attestation closeregion disabledeviceerase disabletamper erasedevice genauth gencert gencommand genconfig genkey getpath lock lockconfig otprollbackcount provision readcert readconfig readkey readregionconfig rollchallenge status transitiontodevelopment unlock writeconfig writekey writeregionconfig"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    attestation)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset"
      ;;
    closeregion)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --codeversion"
      ;;
    disabledeviceerase)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --dryrun --noprompt"
      ;;
    disabletamper)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --nostore --cert --cert-privkey --command-key --cert-signature --command-signature --authorization --cert-pubkey --disable-param"
      ;;
    erasedevice)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --dryrun"
      ;;
    genauth)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --outfile --nostore --deviceserialno"
      ;;
    gencert)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --outfile --nostore --deviceserialno --cert-pubkey --authorization --command-key --extsign"
      ;;
    gencommand)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --outfile --nostore --action --disable-param --unlock-param"
      ;;
    genconfig)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --outfile --nostore --deviceserialno"
      ;;
    genkey)
      options="--version --help --help-all --device --force --timestamp --json --outfile --type --privkey --pubkey"
      ;;
    getpath)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --deviceserialno"
      ;;
    lock)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --dryrun --trustzone"
      ;;
    lockconfig)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --secure-debug-unlock --dryrun --noprompt"
      ;;
    otprollbackcount)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset"
      ;;
    provision)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --sefw"
      ;;
    readcert)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --outfile"
      ;;
    readconfig)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset"
      ;;
    readkey)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --outfile --nostore --sign --command"
      ;;
    readregionconfig)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --outfile"
      ;;
    rollchallenge)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --nostore"
      ;;
    status)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --trustzone --verbose"
      ;;
    transitiontodevelopment)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --dryrun --noprompt"
      ;;
    unlock)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --nostore --cert --cert-privkey --command-key --cert-signature --command-signature --authorization --cert-pubkey --unlock-param"
      ;;
    writeconfig)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --nostore --dryrun --noprompt --configfile"
      ;;
    writekey)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset --nostore --sign --command --decrypt --noprompt --dryrun"
      ;;
    writeregionconfig)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --noreset"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `serial` subcommand.
function __scmder_serial() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="getopn load lock unlock"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    getopn)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --serialport"
      ;;
    load)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --serialport --showprogress --fixedspeed"
      ;;
    lock)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --serialport --token --key --userdata"
      ;;
    unlock)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --serialport --token --key --userdata"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `swo` subcommand.
function __scmder_swo() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="read"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    read)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --swospeed --timeout --hex --endmarker --noreset"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `tokens` subcommand.
function __scmder_tokens() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="createheader erase read write"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    createheader)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --outfile --tokengroup --tokendefs"
      ;;
    erase)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --securerange --type --token --tokengroup --tokendefs"
      ;;
    read)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --outfile --showoverrides --token --securerange --tokengroup --tokendefs --range --type --includeall --address"
      ;;
    write)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --tokenfile --token --securerange --tokengroup --tokendefs"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `util` subcommand.
function __scmder_util() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="appinfo elfinfo extractkeys gencert genkey genkeyconfig keytotoken rpsinfo signcert usage verifysign"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    appinfo)
      options="--version --help --help-all --device --force --timestamp --json"
      ;;
    elfinfo)
      options="--version --help --help-all --device --force --timestamp --json"
      ;;
    extractkeys)
      options="--version --help --help-all --device --force --timestamp --json --dir"
      ;;
    gencert)
      options="--version --help --help-all --device --force --timestamp --json --cert-version --cert-type --cert-pubkey --sign --extsign --outfile"
      ;;
    genkey)
      options="--version --help --help-all --device --force --timestamp --json --type --pubkey --privkey --outfile --tokenfile"
      ;;
    genkeyconfig)
      options="--version --help --help-all --device --force --timestamp --json --outfile"
      ;;
    keytotoken)
      options="--version --help --help-all --device --force --timestamp --json --outfile"
      ;;
    rpsinfo)
      options="--version --help --help-all --device --force --timestamp --json"
      ;;
    signcert)
      options="--version --help --help-all --device --force --timestamp --json --signature --cert-type --verify --outfile"
      ;;
    usage)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --map --include-section --exclude-section"
      ;;
    verifysign)
      options="--version --help --help-all --device --force --timestamp --json --verify"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `vcom` subcommand.
function __scmder_vcom() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="config connect"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    config)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --baudrate --handshake --store"
      ;;
    connect)
      options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --hex --restartinisp --lineending"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options and subcommands of the `vuart` subcommand.
function __scmder_vuart() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # The sub-command determines which options are available
  # scmder <top_command> <sub_command> --...
  local sub_command=${COMP_WORDS[2]}

  # Available sub-commands
  local commands="connect"

  compopt +o default

  # Available options for each sub-command
  local options=""

  case ${sub_command} in
    connect)
      options="--version --help --help-all --device --force --timestamp --json --timeout --endmarker --lineending"
      ;;
    *)
      if [[ "${curr_word}" == -* ]]; then
        COMPREPLY=($(compgen -W "--version --help" -- "${curr_word}"))
      else
        COMPREPLY=($(compgen -W "${commands}" -- "${curr_word}"))
      fi
      return $?
      ;;
  esac

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options of the `convert` command.
function __scmder_convert() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # This command has no subcommands

  compopt +o default

  # Available options
  local options="--version --help --help-all --device --force --timestamp --json --address --outfile --patch --range --token --tokenfile --tokengroup --tokendefs --secureboot --keyfile --crc --certificate --aeskey --include-section --exclude-section --extsign --signature --verify"

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options of the `flash` command.
function __scmder_flash() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # This command has no subcommands

  compopt +o default

  # Available options
  local options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --address --halt --masserase --noreset --noclose --noverify --patch --token --tokenfile --tokengroup --tokendefs --binary --include-section --exclude-section"

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options of the `postbuild` command.
function __scmder_postbuild() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # This command has no subcommands

  compopt +o default

  # Available options
  local options="--version --help --help-all --device --force --timestamp --json --parameter --dryrun"

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options of the `readmem` command.
function __scmder_readmem() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # This command has no subcommands

  compopt +o default

  # Available options
  local options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --outfile --range --region"

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# Generates completions for the options of the `verify` command.
function __scmder_verify() {
  # Get the current word being typed
  local curr_word=${COMP_WORDS[COMP_CWORD]}

  # This command has no subcommands

  compopt +o default

  # Available options
  local options="--version --help --help-all --device --force --timestamp --json --serialno --ip --identifybyserialport --speed --tif --irpre --drpre --address --patch --token --tokenfile --tokengroup --blank --noreset --region --tokendefs --binary"

  if [[ "${curr_word}" == -* ]]; then
    COMPREPLY=($(compgen -W "${options}" -- "${curr_word}"))
  fi
}

# The completion is triggered on the keyword `scmder`. You may add multiple keywords yourself.
complete -F __complete_scmder -o default scmder
