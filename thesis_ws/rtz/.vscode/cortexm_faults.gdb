set pagination off
set print pretty on

define tz_fault_regs
  set $scb = 0xE000ED00
  set $cfsr = *(unsigned int *)($scb + 0x28)
  set $hfsr = *(unsigned int *)($scb + 0x2C)
  set $dfsr = *(unsigned int *)($scb + 0x30)
  set $mmfar = *(unsigned int *)($scb + 0x34)
  set $bfar = *(unsigned int *)($scb + 0x38)
  set $afsr = *(unsigned int *)($scb + 0x3C)
  set $shcsr = *(unsigned int *)($scb + 0x24)
  set $sfsr = *(unsigned int *)0xE000EDE4
  set $sfar = *(unsigned int *)0xE000EDE8

  printf "\n=== Cortex-M33 Fault Registers ===\n"
  printf "HFSR  : 0x%08lx\n", $hfsr
  printf "CFSR  : 0x%08lx (MMFSR=0x%02lx, BFSR=0x%02lx, UFSR=0x%04lx)\n", $cfsr, ($cfsr & 0xFF), (($cfsr >> 8) & 0xFF), (($cfsr >> 16) & 0xFFFF)
  printf "SFSR  : 0x%08lx\n", $sfsr
  printf "DFSR  : 0x%08lx\n", $dfsr
  printf "SHCSR : 0x%08lx\n", $shcsr
  printf "MMFAR : 0x%08lx\n", $mmfar
  printf "BFAR  : 0x%08lx\n", $bfar
  printf "SFAR  : 0x%08lx\n", $sfar
  printf "AFSR  : 0x%08lx\n", $afsr
end

document tz_fault_regs
Print key Cortex-M33 fault status registers, including SecureFault (SFSR/SFAR).
Run this in Debug Console: tz_fault_regs
end

define tz_busfault
  set $cfsr = *(unsigned int *)0xE000ED28
  set $bfsr = ($cfsr >> 8) & 0xFF

  printf "\n=== Cortex-M33 BusFault Decode ===\n"
  printf "BFSR      : 0x%02lx\n", $bfsr
  printf "IBUSERR   : %ld\n", (($bfsr >> 0) & 1)
  printf "PRECISERR : %ld\n", (($bfsr >> 1) & 1)
  printf "IMPRECISERR: %ld\n", (($bfsr >> 2) & 1)
  printf "UNSTKERR  : %ld\n", (($bfsr >> 3) & 1)
  printf "STKERR    : %ld\n", (($bfsr >> 4) & 1)
  printf "LSPERR    : %ld\n", (($bfsr >> 5) & 1)
  printf "BFARVALID : %ld\n", (($bfsr >> 7) & 1)
  printf "BFAR      : 0x%08lx\n", *(unsigned int *)0xE000ED38
end

document tz_busfault
Decode BusFault bits from CFSR.BFSR and print BFAR.
Run this in Debug Console: tz_busfault
end
