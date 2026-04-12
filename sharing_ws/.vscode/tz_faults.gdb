define tz_fault_regs
  printf "\n========== Cortex-M33 / TrustZone Fault Registers ==========\n"
  printf "SHCSR   (0xE000ED24): 0x%08lx\n", *(unsigned long *)0xE000ED24
  printf "CFSR    (0xE000ED28): 0x%08lx\n", *(unsigned long *)0xE000ED28
  printf "HFSR    (0xE000ED2C): 0x%08lx\n", *(unsigned long *)0xE000ED2C
  printf "DFSR    (0xE000ED30): 0x%08lx\n", *(unsigned long *)0xE000ED30
  printf "MMFAR   (0xE000ED34): 0x%08lx\n", *(unsigned long *)0xE000ED34
  printf "BFAR    (0xE000ED38): 0x%08lx\n", *(unsigned long *)0xE000ED38
  printf "AFSR    (0xE000ED3C): 0x%08lx\n", *(unsigned long *)0xE000ED3C
  printf "SFSR    (0xE000EDE4): 0x%08lx\n", *(unsigned long *)0xE000EDE4
  printf "SFAR    (0xE000EDE8): 0x%08lx\n", *(unsigned long *)0xE000EDE8
  printf "============================================================\n"
end

document tz_fault_regs
Dump Cortex-M33 TrustZone/fault status registers.
Run in Debug Console when halted: tz_fault_regs
end

define tz_fault_decode
  set $shcsr = *(unsigned long *)0xE000ED24
  set $cfsr = *(unsigned long *)0xE000ED28
  set $hfsr = *(unsigned long *)0xE000ED2C
  set $sfsr = *(unsigned long *)0xE000EDE4
  set $mmfar = *(unsigned long *)0xE000ED34
  set $bfar = *(unsigned long *)0xE000ED38
  set $sfar = *(unsigned long *)0xE000EDE8

  printf "\n========== Cortex-M33 / TrustZone Fault Decode =============\n"

  printf "-- HFSR (0xE000ED2C): 0x%08lx\n", $hfsr
  if ($hfsr & (1 << 1))
    printf "  VECTTBL: BusFault during vector table read.\n"
  end
  if ($hfsr & (1 << 30))
    printf "  FORCED: Escalated configurable fault (see CFSR/SFSR).\n"
  end
  if ($hfsr & (1 << 31))
    printf "  DEBUGEVT: Debug event triggered HardFault path.\n"
  end

  printf "-- CFSR (0xE000ED28): 0x%08lx\n", $cfsr
  if ($cfsr & (1 << 0))
    printf "  MMFSR.IACCVIOL: MPU instruction access violation.\n"
  end
  if ($cfsr & (1 << 1))
    printf "  MMFSR.DACCVIOL: MPU data access violation.\n"
  end
  if ($cfsr & (1 << 3))
    printf "  MMFSR.MUNSTKERR: MemManage fault on exception return.\n"
  end
  if ($cfsr & (1 << 4))
    printf "  MMFSR.MSTKERR: MemManage fault on exception entry.\n"
  end
  if ($cfsr & (1 << 5))
    printf "  MMFSR.MLSPERR: MemManage fault during FP lazy state save.\n"
  end
  if ($cfsr & (1 << 7))
    printf "  MMFSR.MMARVALID: MMFAR valid = 0x%08lx\n", $mmfar
  end
  if ($cfsr & (1 << 8))
    printf "  BFSR.IBUSERR: Instruction bus error.\n"
  end
  if ($cfsr & (1 << 9))
    printf "  BFSR.PRECISERR: Precise data bus error.\n"
  end
  if ($cfsr & (1 << 10))
    printf "  BFSR.IMPRECISERR: Imprecise data bus error.\n"
  end
  if ($cfsr & (1 << 11))
    printf "  BFSR.UNSTKERR: BusFault on exception return.\n"
  end
  if ($cfsr & (1 << 12))
    printf "  BFSR.STKERR: BusFault on exception entry.\n"
  end
  if ($cfsr & (1 << 13))
    printf "  BFSR.LSPERR: BusFault during FP lazy state save.\n"
  end
  if ($cfsr & (1 << 15))
    printf "  BFSR.BFARVALID: BFAR valid = 0x%08lx\n", $bfar
  end
  if ($cfsr & (1 << 16))
    printf "  UFSR.UNDEFINSTR: Undefined instruction.\n"
  end
  if ($cfsr & (1 << 17))
    printf "  UFSR.INVSTATE: Invalid EPSR/T-bit/state.\n"
  end
  if ($cfsr & (1 << 18))
    printf "  UFSR.INVPC: Invalid EXC_RETURN/PC load.\n"
  end
  if ($cfsr & (1 << 19))
    printf "  UFSR.NOCP: Coprocessor instruction fault.\n"
  end
  if ($cfsr & (1 << 20))
    printf "  UFSR.STKOF: Stack overflow detected.\n"
  end
  if ($cfsr & (1 << 24))
    printf "  UFSR.UNALIGNED: Unaligned access fault.\n"
  end
  if ($cfsr & (1 << 25))
    printf "  UFSR.DIVBYZERO: Divide-by-zero fault.\n"
  end

  printf "-- SFSR (0xE000EDE4): 0x%08lx\n", $sfsr
  if ($sfsr & (1 << 0))
    printf "  INVEP: Invalid entry point to Secure state.\n"
  end
  if ($sfsr & (1 << 1))
    printf "  INVIS: Invalid integrity signature in exception stacking.\n"
  end
  if ($sfsr & (1 << 2))
    printf "  INVER: Invalid exception return to Secure state.\n"
  end
  if ($sfsr & (1 << 3))
    printf "  AUVIOL: Attribution unit violation (SAU/IDAU).\n"
  end
  if ($sfsr & (1 << 4))
    printf "  INVTRAN: Invalid Secure gateway transition.\n"
  end
  if ($sfsr & (1 << 5))
    printf "  LSPERR: Lazy-state preservation error.\n"
  end
  if ($sfsr & (1 << 6))
    printf "  SFARVALID: SFAR valid = 0x%08lx\n", $sfar
  end
  if ($sfsr & (1 << 7))
    printf "  LSERR: Error on exception entry/return due to lazy state.\n"
  end

  printf "-- SHCSR (0xE000ED24): 0x%08lx\n", $shcsr
  if ($shcsr & (1 << 0))
    printf "  MEMFAULTACT: MemManage fault handler active.\n"
  end
  if ($shcsr & (1 << 1))
    printf "  BUSFAULTACT: BusFault handler active.\n"
  end
  if ($shcsr & (1 << 3))
    printf "  USGFAULTACT: UsageFault handler active.\n"
  end
  if ($shcsr & (1 << 7))
    printf "  SVCALLACT: SVC handler active.\n"
  end
  if ($shcsr & (1 << 8))
    printf "  MONITORACT: Debug monitor active.\n"
  end
  if ($shcsr & (1 << 10))
    printf "  PENDSVACT: PendSV handler active.\n"
  end
  if ($shcsr & (1 << 11))
    printf "  SYSTICKACT: SysTick handler active.\n"
  end
  if ($shcsr & (1 << 12))
    printf "  USGFAULTPENDED: UsageFault pending.\n"
  end
  if ($shcsr & (1 << 13))
    printf "  MEMFAULTPENDED: MemManage fault pending.\n"
  end
  if ($shcsr & (1 << 14))
    printf "  BUSFAULTPENDED: BusFault pending.\n"
  end
  if ($shcsr & (1 << 15))
    printf "  SVCALLPENDED: SVC pending.\n"
  end
  if ($shcsr & (1 << 16))
    printf "  MEMFAULTENA: MemManage fault enabled.\n"
  end
  if ($shcsr & (1 << 17))
    printf "  BUSFAULTENA: BusFault enabled.\n"
  end
  if ($shcsr & (1 << 18))
    printf "  USGFAULTENA: UsageFault enabled.\n"
  end

  printf "============================================================\n"
end

document tz_fault_decode
Decode key CFSR/HFSR/SFSR/SHCSR bitfields and print valid fault addresses.
Run in Debug Console when halted: tz_fault_decode
end

define tz_fault_all
  tz_fault_regs
  tz_fault_decode
end

document tz_fault_all
Run register dump and bitfield decode together.
end