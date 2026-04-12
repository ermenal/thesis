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

$(OUTPUT_DIR)/project/app.o: app.c
	@$(POSIX_TOOL_PATH)echo 'Building app.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ app.c
CDEPS += $(OUTPUT_DIR)/project/app.d
OBJS += $(OUTPUT_DIR)/project/app.o

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
# SIMPLICITY_STUDIO_METADATA=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=END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA