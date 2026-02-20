####################################################################
# Automatically-generated file. Do not edit!                       #
# Makefile Version 19                                              #
####################################################################

BASE_SDK_PATH = /home/ermenal/.silabs/slt/installs/conan/p/simpleb526998f4a4d/p
BASE_PKG_PATH = /home/ermenal/.silabs/slt/installs
UNAME:=$(shell $(POSIX_TOOL_PATH)uname -s | $(POSIX_TOOL_PATH)sed -e 's/^\(CYGWIN\).*/\1/' | $(POSIX_TOOL_PATH)sed -e 's/^\(MINGW\).*/\1/')
ifeq ($(UNAME),MINGW)
# Translate "C:/super" into "/C/super" for MinGW make.
SDK_PATH := /$(shell $(POSIX_TOOL_PATH)echo $(BASE_SDK_PATH) | sed s/://)
PKG_PATH := /$(shell $(POSIX_TOOL_PATH)echo $(BASE_PKG_PATH) | sed s/://)
endif
SDK_PATH ?= $(BASE_SDK_PATH)
PKG_PATH ?= $(BASE_PKG_PATH)
COPIED_SDK_PATH ?= simplicity_sdk_2025.6.2

# This uses the explicit build rules below
PROJECT_SOURCE_FILES =

C_SOURCE_FILES   += $(filter %.c, $(PROJECT_SOURCE_FILES))
CXX_SOURCE_FILES += $(filter %.cpp, $(PROJECT_SOURCE_FILES))
CXX_SOURCE_FILES += $(filter %.cc, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.s, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.S, $(PROJECT_SOURCE_FILES))
LIB_FILES        += $(filter %.a, $(PROJECT_SOURCE_FILES))

C_DEFS += \
 '-DEFR32FG23B010F512IM48=1' \
 '-DSL_CODE_COMPONENT_SYSTEM=system' \
 '-DHARDWARE_BOARD_DEFAULT_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_2_RF_BANDS=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_915=1' \
 '-DHFXO_FREQ=39000000' \
 '-DSL_BOARD_NAME="BRD2600A"' \
 '-DSL_BOARD_REV="A03"' \
 '-DSL_CLOCK_MANAGER_AUTO_BAND_VALID=1' \
 '-DSL_CODE_COMPONENT_CLOCK_MANAGER=clock_manager' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DSL_CODE_COMPONENT_GPIO=gpio' \
 '-DSL_CODE_COMPONENT_HAL_COMMON=hal_common' \
 '-DSL_CODE_COMPONENT_HAL_GPIO=hal_gpio' \
 '-DSL_CODE_COMPONENT_INTERRUPT_MANAGER=interrupt_manager' \
 '-DCMSIS_NVIC_VIRTUAL=1' \
 '-DCMSIS_NVIC_VIRTUAL_HEADER_FILE="cmsis_nvic_virtual.h"' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_RAIL_3_API=1'

ASM_DEFS += \
 '-DEFR32FG23B010F512IM48=1' \
 '-DSL_CODE_COMPONENT_SYSTEM=system' \
 '-DHARDWARE_BOARD_DEFAULT_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_2_RF_BANDS=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_915=1' \
 '-DHFXO_FREQ=39000000' \
 '-DSL_BOARD_NAME="BRD2600A"' \
 '-DSL_BOARD_REV="A03"' \
 '-DSL_CLOCK_MANAGER_AUTO_BAND_VALID=1' \
 '-DSL_CODE_COMPONENT_CLOCK_MANAGER=clock_manager' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DSL_CODE_COMPONENT_GPIO=gpio' \
 '-DSL_CODE_COMPONENT_HAL_COMMON=hal_common' \
 '-DSL_CODE_COMPONENT_HAL_GPIO=hal_gpio' \
 '-DSL_CODE_COMPONENT_INTERRUPT_MANAGER=interrupt_manager' \
 '-DCMSIS_NVIC_VIRTUAL=1' \
 '-DCMSIS_NVIC_VIRTUAL_HEADER_FILE="cmsis_nvic_virtual.h"' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_RAIL_3_API=1'

INCLUDES += \
 -Iautogen \
 -Iconfig \
 -Iconfig/rail \
 -I. \
 -I$(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Include \
 -I$(COPIED_SDK_PATH)/hardware/board/inc \
 -I$(COPIED_SDK_PATH)/platform/service/clock_manager/inc \
 -I$(COPIED_SDK_PATH)/platform/service/clock_manager/src \
 -I$(COPIED_SDK_PATH)/platform/CMSIS/Core/Include \
 -I$(COPIED_SDK_PATH)/platform/common/inc \
 -I$(COPIED_SDK_PATH)/platform/service/device_manager/inc \
 -I$(COPIED_SDK_PATH)/platform/service/device_init/inc \
 -I$(COPIED_SDK_PATH)/platform/emlib/inc \
 -I$(COPIED_SDK_PATH)/platform/driver/gpio/inc \
 -I$(COPIED_SDK_PATH)/platform/peripheral/inc \
 -I$(COPIED_SDK_PATH)/platform/service/interrupt_manager/inc \
 -I$(COPIED_SDK_PATH)/platform/service/interrupt_manager/src \
 -I$(COPIED_SDK_PATH)/platform/service/interrupt_manager/inc/arm \
 -I$(COPIED_SDK_PATH)/platform/service/memory_manager/inc \
 -I$(COPIED_SDK_PATH)/platform/service/mpu/inc \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/common \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/protocol/ble \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/protocol/ieee802154 \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/protocol/wmbus \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/protocol/zwave \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/chip/efr32/efr32xg2x \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/protocol/sidewalk \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_callbacks \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/efr32xg23 \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/inc \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/src

GROUP_START =-Wl,--start-group
GROUP_END =-Wl,--end-group

PROJECT_LIBS = \
 -lgcc \
 -lc \
 -lm \
 -lnosys \
 $(COPIED_SDK_PATH)/platform/radio/rail_lib/autogen/librail_release/librail_efr32xg23_gcc_release.a

LIBS += $(GROUP_START) $(PROJECT_LIBS) $(GROUP_END)

LIB_FILES += $(filter %.a, $(PROJECT_LIBS))

C_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -std=c18 \
 -mcmse \
 -Wall \
 -Wextra \
 -Og \
 -fdata-sections \
 -ffunction-sections \
 -fomit-frame-pointer \
 -g \
 -fno-lto \
 --specs=nano.specs

CXX_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -std=c++17 \
 -fno-rtti \
 -fno-exceptions \
 -mcmse \
 -Wall \
 -Wextra \
 -Og \
 -fdata-sections \
 -ffunction-sections \
 -fomit-frame-pointer \
 -g \
 -fno-lto \
 --specs=nano.specs

ASM_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -x assembler-with-cpp

LD_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -T"autogen/linkerfile.ld" \
 --specs=nano.specs \
 -Xlinker -Map=$(OUTPUT_DIR)/$(PROJECTNAME).map \
 -fno-lto \
 -Wl,--gc-sections


####################################################################
# Pre/Post Build Rules                                             #
####################################################################
pre-build:
	# No pre-build defined

post-build: $(OUTPUT_DIR)/$(PROJECTNAME).out
	# No post-build defined

####################################################################
# SDK Build Rules                                                  #
####################################################################
$(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_control_gpio.o: $(COPIED_SDK_PATH)/hardware/board/src/sl_board_control_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/hardware/board/src/sl_board_control_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/hardware/board/src/sl_board_control_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_control_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_control_gpio.o

$(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_init.o: $(COPIED_SDK_PATH)/hardware/board/src/sl_board_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/hardware/board/src/sl_board_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/hardware/board/src/sl_board_init.c
CDEPS += $(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_init.d
OBJS += $(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_init.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o: $(COPIED_SDK_PATH)/platform/common/src/sl_assert.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/common/src/sl_assert.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/common/src/sl_assert.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_core_cortexm.o: $(COPIED_SDK_PATH)/platform/common/src/sl_core_cortexm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/common/src/sl_core_cortexm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/common/src/sl_core_cortexm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_core_cortexm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_core_cortexm.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.o: $(COPIED_SDK_PATH)/platform/common/src/sl_syscalls.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/common/src/sl_syscalls.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/common/src/sl_syscalls.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.o

$(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG23/Source/startup_efr32fg23.o: $(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Source/startup_efr32fg23.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Source/startup_efr32fg23.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Source/startup_efr32fg23.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG23/Source/startup_efr32fg23.d
OBJS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG23/Source/startup_efr32fg23.o

$(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG23/Source/system_efr32fg23.o: $(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Source/system_efr32fg23.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Source/system_efr32fg23.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Source/system_efr32fg23.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG23/Source/system_efr32fg23.d
OBJS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG23/Source/system_efr32fg23.o

$(OUTPUT_DIR)/sdk/platform/driver/gpio/src/sl_gpio.o: $(COPIED_SDK_PATH)/platform/driver/gpio/src/sl_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/driver/gpio/src/sl_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/driver/gpio/src/sl_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/driver/gpio/src/sl_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/driver/gpio/src/sl_gpio.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_cmu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_cmu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_cmu.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_emu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_emu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_emu.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_ldma.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_ldma.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_ldma.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_ldma.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_ldma.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_ldma.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_msc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_msc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_msc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_prs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_prs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_prs.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_system.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_system.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_system.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o

$(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.o: $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.o: $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.o: $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.o: $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager.o: $(COPIED_SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_hal_s2.o: $(COPIED_SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_hal_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_hal_s2.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init.o: $(COPIED_SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.o: $(COPIED_SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.o

$(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s2.o: $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s2.o

$(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s2.o: $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s2.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/clocks/sl_device_clock_efr32xg23.o: $(COPIED_SDK_PATH)/platform/service/device_manager/clocks/sl_device_clock_efr32xg23.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/device_manager/clocks/sl_device_clock_efr32xg23.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/device_manager/clocks/sl_device_clock_efr32xg23.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/clocks/sl_device_clock_efr32xg23.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/clocks/sl_device_clock_efr32xg23.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_clock.o: $(COPIED_SDK_PATH)/platform/service/device_manager/src/sl_device_clock.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/device_manager/src/sl_device_clock.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/device_manager/src/sl_device_clock.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_clock.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_clock.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_gpio.o: $(COPIED_SDK_PATH)/platform/service/device_manager/src/sl_device_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/device_manager/src/sl_device_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/device_manager/src/sl_device_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_gpio.o

$(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.o: $(COPIED_SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.o: $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.o

$(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu_s2.o: $(COPIED_SDK_PATH)/platform/service/mpu/src/sl_mpu_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/mpu/src/sl_mpu_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/mpu/src/sl_mpu_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu_s2.o

$(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init.o: $(COPIED_SDK_PATH)/platform/service/sl_main/src/sl_main_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/sl_main/src/sl_main_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/sl_main/src/sl_main_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init.o

$(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init_memory.o: $(COPIED_SDK_PATH)/platform/service/sl_main/src/sl_main_init_memory.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/sl_main/src/sl_main_init_memory.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/sl_main/src/sl_main_init_memory.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init_memory.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init_memory.o

$(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_process_action.o: $(COPIED_SDK_PATH)/platform/service/sl_main/src/sl_main_process_action.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/sl_main/src/sl_main_process_action.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/sl_main/src/sl_main_process_action.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_process_action.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_process_action.o

$(OUTPUT_DIR)/project/app_init.o: app_init.c
	@$(POSIX_TOOL_PATH)echo 'Building app_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ app_init.c
CDEPS += $(OUTPUT_DIR)/project/app_init.d
OBJS += $(OUTPUT_DIR)/project/app_init.o

$(OUTPUT_DIR)/project/app_process.o: app_process.c
	@$(POSIX_TOOL_PATH)echo 'Building app_process.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ app_process.c
CDEPS += $(OUTPUT_DIR)/project/app_process.d
OBJS += $(OUTPUT_DIR)/project/app_process.o

$(OUTPUT_DIR)/project/autogen/rail_config.o: autogen/rail_config.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/rail_config.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/rail_config.c
CDEPS += $(OUTPUT_DIR)/project/autogen/rail_config.d
OBJS += $(OUTPUT_DIR)/project/autogen/rail_config.o

$(OUTPUT_DIR)/project/autogen/sl_board_default_init.o: autogen/sl_board_default_init.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_board_default_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_board_default_init.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_board_default_init.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_board_default_init.o

$(OUTPUT_DIR)/project/autogen/sl_event_handler.o: autogen/sl_event_handler.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_event_handler.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_event_handler.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_event_handler.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_event_handler.o

$(OUTPUT_DIR)/project/autogen/sl_rail_util_callbacks.o: autogen/sl_rail_util_callbacks.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_rail_util_callbacks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_rail_util_callbacks.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_rail_util_callbacks.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_rail_util_callbacks.o

$(OUTPUT_DIR)/project/autogen/sl_rail_util_init.o: autogen/sl_rail_util_init.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_rail_util_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_rail_util_init.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_rail_util_init.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_rail_util_init.o

$(OUTPUT_DIR)/project/main.o: main.c
	@$(POSIX_TOOL_PATH)echo 'Building main.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ main.c
CDEPS += $(OUTPUT_DIR)/project/main.d
OBJS += $(OUTPUT_DIR)/project/main.o

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=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=END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA