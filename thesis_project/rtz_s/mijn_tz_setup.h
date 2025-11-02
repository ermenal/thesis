#include "efr32fg23b010f512im48.h"
#include "tz_secure_memory_autogen.h"
#include "sl_mpu.h"
#include "em_cmu.h"


void config_mpu(void);
void config_sau(uint32_t linker_sg_begin_addr);
void config_smu(void);
void fixNVIC(void);