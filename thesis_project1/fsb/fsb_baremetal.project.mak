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
 '-DDEBUG_EFM=1' \
 '-DEFR32FG23B010F512IM48=1' \
 '-DSL_CODE_COMPONENT_SYSTEM=system' \
 '-DHARDWARE_BOARD_DEFAULT_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_2_RF_BANDS=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_915=1' \
 '-DHFXO_FREQ=39000000' \
 '-DSL_BOARD_NAME="BRD2600A"' \
 '-DSL_BOARD_REV="A03"' \
 '-DSL_CODE_COMPONENT_CLOCK_MANAGER=clock_manager' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DSL_CODE_COMPONENT_GPIO=gpio' \
 '-DSL_CODE_COMPONENT_HAL_COMMON=hal_common' \
 '-DSL_CODE_COMPONENT_HAL_GPIO=hal_gpio' \
 '-DSL_CODE_COMPONENT_INTERRUPT_MANAGER=interrupt_manager' \
 '-DCMSIS_NVIC_VIRTUAL=1' \
 '-DCMSIS_NVIC_VIRTUAL_HEADER_FILE="cmsis_nvic_virtual.h"' \
 '-DSL_CODE_COMPONENT_CORE=core'

ASM_DEFS += \
 '-DDEBUG_EFM=1' \
 '-DEFR32FG23B010F512IM48=1' \
 '-DSL_CODE_COMPONENT_SYSTEM=system' \
 '-DHARDWARE_BOARD_DEFAULT_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_2_RF_BANDS=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_915=1' \
 '-DHFXO_FREQ=39000000' \
 '-DSL_BOARD_NAME="BRD2600A"' \
 '-DSL_BOARD_REV="A03"' \
 '-DSL_CODE_COMPONENT_CLOCK_MANAGER=clock_manager' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DSL_CODE_COMPONENT_GPIO=gpio' \
 '-DSL_CODE_COMPONENT_HAL_COMMON=hal_common' \
 '-DSL_CODE_COMPONENT_HAL_GPIO=hal_gpio' \
 '-DSL_CODE_COMPONENT_INTERRUPT_MANAGER=interrupt_manager' \
 '-DCMSIS_NVIC_VIRTUAL=1' \
 '-DCMSIS_NVIC_VIRTUAL_HEADER_FILE="cmsis_nvic_virtual.h"' \
 '-DSL_CODE_COMPONENT_CORE=core'

INCLUDES += \
 -Iconfig \
 -Iautogen \
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
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/inc \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/src

GROUP_START =-Wl,--start-group
GROUP_END =-Wl,--end-group

PROJECT_LIBS = \
 -lgcc \
 -lc \
 -lm \
 -lnosys

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
 -Os \
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
 -Os \
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

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_msc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_msc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_msc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_system.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_system.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_system.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_wdog.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_wdog.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_wdog.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_wdog.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_wdog.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_wdog.o

$(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.o: $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.o

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

$(OUTPUT_DIR)/project/main.o: main.c
	@$(POSIX_TOOL_PATH)echo 'Building main.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ main.c
CDEPS += $(OUTPUT_DIR)/project/main.d
OBJS += $(OUTPUT_DIR)/project/main.o

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=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END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA