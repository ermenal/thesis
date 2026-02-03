#include "mijn_tz_setup.h"
#include "efr32fg23_smu.h"
#include "efr32fg23b010f512im48.h"
#include <stddef.h>

extern const uint32_t linker_sg_begin;
extern const uint32_t linker_vectors_begin;

// The NS application is placed right after the secure application
#define TZ_NS_FLASH_OFFSET (TZ_S_FLASH_END - FLASH_BASE)
#define TZ_NS_RAM_OFFSET   (TZ_S_RAM_END - SRAM_BASE)

#define FIRMWARE_START_ADDRESS ((uint32_t)&linker_vectors_begin)

#define AIRCR_UNLOCK_VECTKEY (0x05FAUL)
#define AIRCR_VECTKEY_STAT   (0xFA05UL)

// Mark the full range below as NS in SAU,
// and let the PPU generate access faults instead.
#define PERIPHERALS_BASE_NS_START (0x50000000UL)
#define PERIPHERALS_BASE_NS_END   (0xBFFFFFFFUL)

#define EPPB_REGION_START (0xE0044000UL)
#define EPPB_REGION_END   (0xE00FDFFFUL)

struct sau_cfg_t {
  uint32_t RBAR;
  uint32_t RLAR;
};

#define CONFIGURED_SAU_REGIONS 6
#define SECURE_RADIO_START 0xA0000000UL
#define SECURE_RADIO_END 0xAFFFFFFFUL
#define NS_RADIO_START 0xB0000000UL
#define NS_RADIO_END 0xBFFFFFFFUL
#define NS_FLASH_BEGIN 0x08062000UL
// #define NS_FLASH_BEGIN 0x08062000UL

static const struct sau_cfg_t sau_cfg[CONFIGURED_SAU_REGIONS] = {
  { // NS Flash ( an overlapping NSC region for SG veneers is setup in SMU )
    (uint32_t)&linker_sg_begin,
    FLASH_BASE + FLASH_SIZE - 1u,
  },
//   { // RNR # 1 NS Peripherals
    // PERIPHERALS_BASE_NS_START,
    // SECURE_RADIO_START - 1u,
//   },
//   { // RNR # 2 NS Radio
    // NS_RADIO_START,
    // NS_RADIO_END,
//   },
  { // RNR # 3 NS SRAM
    SRAM_BASE + TZ_NS_RAM_OFFSET,
    SRAM_BASE + SRAM_SIZE - 1u,
  },
  { // RNR # 4 User Data
    MSC_FLASH_USERDATA_MEM_BASE,
    MSC_FLASH_USERDATA_MEM_END,
  },
  { // RNR # 5 Device Info
    MSC_FLASH_DEVINFO_MEM_BASE,
    MSC_FLASH_DEVINFO_MEM_END,
  },
  { // RNR # 6 Chip Config
    MSC_FLASH_CHIPCONFIG_MEM_BASE,
    MSC_FLASH_CHIPCONFIG_MEM_END,
  },
  { // RNR # 7 EPPB
    EPPB_REGION_START,
    EPPB_REGION_END,
  },
};

void config_sau(void)
{
    // Enable configured regions 
    int i = 0;
    for (i = 0; i < CONFIGURED_SAU_REGIONS; i++) {
        SAU->RNR = i & SAU_RNR_REGION_Msk;
        SAU->RBAR = sau_cfg[i].RBAR & SAU_RBAR_BADDR_Msk;
        SAU->RLAR = (sau_cfg[i].RLAR & SAU_RLAR_LADDR_Msk) | SAU_RLAR_ENABLE_Msk;
    }
    // Disable remaining regions
    for (; i < ((SAU->TYPE & SAU_TYPE_SREGION_Msk) >> SAU_TYPE_SREGION_Pos); i++) {
        SAU->RNR = i & SAU_RNR_REGION_Msk;
        SAU->RBAR = 0;
        SAU->RLAR = 0;
    }

    // Enable SAU
    SAU->CTRL |=  (SAU_CTRL_ENABLE_Msk);
}

#define FLASH_BASE_WITH_FSB 0x08044000UL
// #define FLASH_BASE_WITH_FSB 0x08044000UL
void config_smu(void) 
{
    // Enable SMU clock (CMU is NS), unlock SMU
    CMU_S->CLKEN1_SET = CMU_CLKEN1_SMU;

    SMU->LOCK = SMU_LOCK_SMULOCKKEY_UNLOCK;

    // Configure Flash mbv Movable Region Boundaries
    SMU->ESAUMRB01 = FLASH_BASE_WITH_FSB & _SMU_ESAUMRB01_MASK; // Eind van secure flash, start van NSC flash
    // SMU->ESAUMRB01 = ((uint32_t)&linker_sg_begin) & _SMU_ESAUMRB01_MASK; // Eind van secure flash, start van NSC flash
    SMU->ESAUMRB12 = NS_FLASH_BEGIN & _SMU_ESAUMRB12_MASK; // Eind van NSC flash, start van NS flash

    SMU->ESAUMRB45 = (SRAM_BASE + TZ_NS_RAM_OFFSET) & _SMU_ESAUMRB45_MASK; // Eind van secure RAM, start van NSC RAM
    SMU->ESAUMRB56 = (SRAM_BASE + TZ_NS_RAM_OFFSET) & _SMU_ESAUMRB56_MASK; // Eind van NSC RAM, start van NS RAM

    SMU->ESAURTYPES0 = SMU_ESAURTYPES0_ESAUR3NS; // Info page NS
    SMU->ESAURTYPES1 = SMU_ESAURTYPES1_ESAUR11NS; // EPPB NS (External Private Peripheral Bus)

    // Peripherals

    SMU->PPUSATD0_CLR = _SMU_PPUSATD0_MASK
                        & ~(SMU_PPUSATD0_SYSCFG
                            | SMU_PPUSATD0_MSC
                            | SMU_PPUSATD0_CMU
                            | SMU_PPUSATD0_DCDC
                            | SMU_PPUSATD0_GPIO
                            | SMU_PPUSATD0_EMU
                            | SMU_PPUSATD0_PRS
                            | SMU_PPUSATD0_HOSTMAILBOX
                            | SMU_PPUSATD0_LDMA
                            | SMU_PPUSATD0_LDMAXBAR
                            | SMU_PPUSATD0_LFRCO
                            | SMU_PPUSATD0_LFXO
                            | SMU_PPUSATD0_HFRCO0
                            | SMU_PPUSATD0_FSRCO
                        );
    SMU->PPUSATD1_CLR = _SMU_PPUSATD1_MASK
                      & ~(SMU_PPUSATD1_SMU
                          | SMU_PPUSATD1_SEMAILBOX
                            | SMU_PPUSATD1_AHBRADIO
                            | SMU_PPUSATD1_HFXO0
                            | SMU_PPUSATD1_SYSRTC
                            | SMU_PPUSATD1_EUSART0
                        );
    
    // Bus Masters
    SMU->BMPUSATD0_CLR = _SMU_BMPUSATD0_MASK
                        & ~(SMU_BMPUSATD0_LDMA
                            | SMU_BMPUSATD0_RADIOSUBSYSTEM
                            | SMU_BMPUSATD0_RFECA0
                            | SMU_BMPUSATD0_RFECA1
                            | SMU_BMPUSATD0_SEEXTDMA
                        );
    
    // Zet Security fault IRQs aan
    NVIC_ClearPendingIRQ(SMU_SECURE_IRQn);
    SMU->IF_CLR = SMU_IF_PPUSEC | SMU_IF_BMPUSEC;
    NVIC_EnableIRQ(SMU_SECURE_IRQn);
    SMU->IEN = SMU_IEN_PPUSEC | SMU_IEN_BMPUSEC;

    // Lock SMU config en disable SMU clock (CMU is S)
    SMU->LOCK = 0;
    CMU_S->CLKEN1_CLR = CMU_CLKEN1_SMU;

}

void config_mpu(void)
{
    // Bootloader shit 
    // ... 
    sl_status_t status = sl_mpu_disable_execute(TZ_S_FLASH_END,
                                  FLASH_BASE + FLASH_SIZE - 1u,
                                  FLASH_BASE + FLASH_SIZE - TZ_S_FLASH_END);
    (void) status;
}

void page_locks(void)
{
    // CMU->CLKEN1_SET = CMU_CLKEN1_MSC;
}

#define NUM_RADIO_IRQS 13
const IRQn_Type rf_irqs[NUM_RADIO_IRQS] = {
    FRC_PRI_IRQn, FRC_IRQn, MODEM_IRQn, RAC_SEQ_IRQn, RAC_RSM_IRQn,
    BUFC_IRQn, AGC_IRQn, PROTIMER_IRQn, SYNTH_IRQn,
    HOSTMAILBOX_IRQn, RFECA0_IRQn, RFECA1_IRQn, HFRCO0_IRQn
};

#define NUM_SECURE_PERIPH_IRQS 7
const IRQn_Type secure_periph_irqs[NUM_SECURE_PERIPH_IRQS] = {
  SEMBRX_IRQn, SEMBTX_IRQn, SMU_SECURE_IRQn, SYSCFG_IRQn,
  MSC_IRQn, LDMA_IRQn, GPIO_ODD_IRQn
};

void fixNVIC(void)
{
  // Start by setting all Interrupt Non-Secure State (ITNS) bits. This results
  // in all IRQs being targeted at the NS world.
  for (size_t i = 0; i < sizeof(NVIC->ITNS) / sizeof(NVIC->ITNS[0]); i++) {
    NVIC->ITNS[i] = 0xFFFFFFFF;
  }

  // Setup secure periph IRQs to target secure
  for (uint32_t i = 0; i < (sizeof(secure_periph_irqs) / sizeof(IRQn_Type)); i++) {
    NVIC_ClearTargetState(secure_periph_irqs[i]);
  }

  // Setup radio IRQs to target secure
  for (uint32_t i = 0; i < (sizeof(rf_irqs) / sizeof(IRQn_Type)); i++) {
    NVIC_ClearTargetState(rf_irqs[i]);
  }
}