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
 '-DSL_BOARD_REV="A02"' \
 '-DSL_CLOCK_MANAGER_AUTO_BAND_VALID=1' \
 '-DSL_CODE_COMPONENT_CLOCK_MANAGER=clock_manager' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DSL_CODE_COMPONENT_DEVICE_PERIPHERAL=device_peripheral' \
 '-DSL_CODE_COMPONENT_DMADRV=dmadrv' \
 '-DSL_CODE_COMPONENT_GPIO=gpio' \
 '-DSL_CODE_COMPONENT_HAL_COMMON=hal_common' \
 '-DSL_CODE_COMPONENT_HAL_GPIO=hal_gpio' \
 '-DSL_CODE_COMPONENT_HAL_SYSRTC=hal_sysrtc' \
 '-DSL_CODE_COMPONENT_INTERRUPT_MANAGER=interrupt_manager' \
 '-DCMSIS_NVIC_VIRTUAL=1' \
 '-DCMSIS_NVIC_VIRTUAL_HEADER_FILE="cmsis_nvic_virtual.h"' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DBUFFER_POOL_ALLOCATOR_USE_LOCAL_CONFIG_HEADER=1' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_RAIL_3_API=1' \
 '-DSL_CODE_COMPONENT_SLEEPTIMER=sleeptimer'

ASM_DEFS += \
 '-DEFR32FG23B010F512IM48=1' \
 '-DSL_CODE_COMPONENT_SYSTEM=system' \
 '-DHARDWARE_BOARD_DEFAULT_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_2_RF_BANDS=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_915=1' \
 '-DHFXO_FREQ=39000000' \
 '-DSL_BOARD_NAME="BRD2600A"' \
 '-DSL_BOARD_REV="A02"' \
 '-DSL_CLOCK_MANAGER_AUTO_BAND_VALID=1' \
 '-DSL_CODE_COMPONENT_CLOCK_MANAGER=clock_manager' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DSL_CODE_COMPONENT_DEVICE_PERIPHERAL=device_peripheral' \
 '-DSL_CODE_COMPONENT_DMADRV=dmadrv' \
 '-DSL_CODE_COMPONENT_GPIO=gpio' \
 '-DSL_CODE_COMPONENT_HAL_COMMON=hal_common' \
 '-DSL_CODE_COMPONENT_HAL_GPIO=hal_gpio' \
 '-DSL_CODE_COMPONENT_HAL_SYSRTC=hal_sysrtc' \
 '-DSL_CODE_COMPONENT_INTERRUPT_MANAGER=interrupt_manager' \
 '-DCMSIS_NVIC_VIRTUAL=1' \
 '-DCMSIS_NVIC_VIRTUAL_HEADER_FILE="cmsis_nvic_virtual.h"' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DBUFFER_POOL_ALLOCATOR_USE_LOCAL_CONFIG_HEADER=1' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_RAIL_3_API=1' \
 '-DSL_CODE_COMPONENT_SLEEPTIMER=sleeptimer'

INCLUDES += \
 -Iautogen \
 -Iconfig \
 -Iconfig/rail \
 -I. \
 -I$(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Include \
 -I$(COPIED_SDK_PATH)/platform/common/inc \
 -I$(COPIED_SDK_PATH)/hardware/board/inc \
 -I$(COPIED_SDK_PATH)/platform/driver/button/inc \
 -I$(COPIED_SDK_PATH)/platform/service/clock_manager/inc \
 -I$(COPIED_SDK_PATH)/platform/service/clock_manager/src \
 -I$(COPIED_SDK_PATH)/platform/CMSIS/Core/Include \
 -I$(COPIED_SDK_PATH)/hardware/driver/configuration_over_swo/inc \
 -I$(COPIED_SDK_PATH)/platform/driver/debug/inc \
 -I$(COPIED_SDK_PATH)/platform/service/device_manager/inc \
 -I$(COPIED_SDK_PATH)/platform/service/device_init/inc \
 -I$(COPIED_SDK_PATH)/platform/emdrv/dmadrv/inc \
 -I$(COPIED_SDK_PATH)/platform/emdrv/dmadrv/inc/s2_signals \
 -I$(COPIED_SDK_PATH)/platform/emdrv/common/inc \
 -I$(COPIED_SDK_PATH)/platform/emlib/inc \
 -I$(COPIED_SDK_PATH)/platform/driver/gpio/inc \
 -I$(COPIED_SDK_PATH)/platform/emdrv/gpiointerrupt/inc \
 -I$(COPIED_SDK_PATH)/platform/peripheral/inc \
 -I$(COPIED_SDK_PATH)/platform/service/interrupt_manager/inc \
 -I$(COPIED_SDK_PATH)/platform/service/interrupt_manager/src \
 -I$(COPIED_SDK_PATH)/platform/service/interrupt_manager/inc/arm \
 -I$(COPIED_SDK_PATH)/platform/service/iostream/inc \
 -I$(COPIED_SDK_PATH)/platform/driver/leddrv/inc \
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
 -I$(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/memory_manager \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/inc \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/src \
 -I$(COPIED_SDK_PATH)/platform/service/sleeptimer/inc

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

$(OUTPUT_DIR)/sdk/hardware/driver/configuration_over_swo/src/sl_cos.o: $(COPIED_SDK_PATH)/hardware/driver/configuration_over_swo/src/sl_cos.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/hardware/driver/configuration_over_swo/src/sl_cos.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/hardware/driver/configuration_over_swo/src/sl_cos.c
CDEPS += $(OUTPUT_DIR)/sdk/hardware/driver/configuration_over_swo/src/sl_cos.d
OBJS += $(OUTPUT_DIR)/sdk/hardware/driver/configuration_over_swo/src/sl_cos.o

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

$(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.o: $(COPIED_SDK_PATH)/platform/common/src/sl_slist.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/common/src/sl_slist.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/common/src/sl_slist.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_string.o: $(COPIED_SDK_PATH)/platform/common/src/sl_string.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/common/src/sl_string.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/common/src/sl_string.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_string.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_string.o

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

$(OUTPUT_DIR)/sdk/platform/driver/button/src/sl_button.o: $(COPIED_SDK_PATH)/platform/driver/button/src/sl_button.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/driver/button/src/sl_button.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/driver/button/src/sl_button.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/driver/button/src/sl_button.d
OBJS += $(OUTPUT_DIR)/sdk/platform/driver/button/src/sl_button.o

$(OUTPUT_DIR)/sdk/platform/driver/button/src/sl_simple_button.o: $(COPIED_SDK_PATH)/platform/driver/button/src/sl_simple_button.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/driver/button/src/sl_simple_button.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/driver/button/src/sl_simple_button.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/driver/button/src/sl_simple_button.d
OBJS += $(OUTPUT_DIR)/sdk/platform/driver/button/src/sl_simple_button.o

$(OUTPUT_DIR)/sdk/platform/driver/debug/src/sl_debug_swo.o: $(COPIED_SDK_PATH)/platform/driver/debug/src/sl_debug_swo.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/driver/debug/src/sl_debug_swo.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/driver/debug/src/sl_debug_swo.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/driver/debug/src/sl_debug_swo.d
OBJS += $(OUTPUT_DIR)/sdk/platform/driver/debug/src/sl_debug_swo.o

$(OUTPUT_DIR)/sdk/platform/driver/gpio/src/sl_gpio.o: $(COPIED_SDK_PATH)/platform/driver/gpio/src/sl_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/driver/gpio/src/sl_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/driver/gpio/src/sl_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/driver/gpio/src/sl_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/driver/gpio/src/sl_gpio.o

$(OUTPUT_DIR)/sdk/platform/driver/leddrv/src/sl_led.o: $(COPIED_SDK_PATH)/platform/driver/leddrv/src/sl_led.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/driver/leddrv/src/sl_led.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/driver/leddrv/src/sl_led.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/driver/leddrv/src/sl_led.d
OBJS += $(OUTPUT_DIR)/sdk/platform/driver/leddrv/src/sl_led.o

$(OUTPUT_DIR)/sdk/platform/driver/leddrv/src/sl_simple_led.o: $(COPIED_SDK_PATH)/platform/driver/leddrv/src/sl_simple_led.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/driver/leddrv/src/sl_simple_led.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/driver/leddrv/src/sl_simple_led.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/driver/leddrv/src/sl_simple_led.d
OBJS += $(OUTPUT_DIR)/sdk/platform/driver/leddrv/src/sl_simple_led.o

$(OUTPUT_DIR)/sdk/platform/emdrv/dmadrv/src/dmadrv.o: $(COPIED_SDK_PATH)/platform/emdrv/dmadrv/src/dmadrv.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emdrv/dmadrv/src/dmadrv.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emdrv/dmadrv/src/dmadrv.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/dmadrv/src/dmadrv.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/dmadrv/src/dmadrv.o

$(OUTPUT_DIR)/sdk/platform/emdrv/gpiointerrupt/src/gpiointerrupt.o: $(COPIED_SDK_PATH)/platform/emdrv/gpiointerrupt/src/gpiointerrupt.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emdrv/gpiointerrupt/src/gpiointerrupt.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emdrv/gpiointerrupt/src/gpiointerrupt.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/gpiointerrupt/src/gpiointerrupt.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/gpiointerrupt/src/gpiointerrupt.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_burtc.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_burtc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_burtc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_burtc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_burtc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_burtc.o

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

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_eusart.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_eusart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_eusart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_eusart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_eusart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_eusart.o

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

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_timer.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_timer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_timer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_timer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_timer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_timer.o

$(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_eusart.o: $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_eusart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_eusart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_eusart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_eusart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_eusart.o

$(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.o: $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.o

$(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_prs.o: $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_prs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_prs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_prs.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_prs.d
OBJS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_prs.o

$(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_sysrtc.o: $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_sysrtc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_sysrtc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/peripheral/src/sl_hal_sysrtc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_sysrtc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_sysrtc.o

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

$(OUTPUT_DIR)/sdk/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg23.o: $(COPIED_SDK_PATH)/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg23.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg23.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg23.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg23.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg23.o

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

$(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_peripheral.o: $(COPIED_SDK_PATH)/platform/service/device_manager/src/sl_device_peripheral.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/device_manager/src/sl_device_peripheral.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/device_manager/src/sl_device_peripheral.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_peripheral.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_peripheral.o

$(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.o: $(COPIED_SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.o: $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_eusart.o: $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_eusart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_eusart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_eusart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_eusart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_eusart.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_retarget_stdio.o: $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_retarget_stdio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_retarget_stdio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_retarget_stdio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_retarget_stdio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_retarget_stdio.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_stdlib_config.o: $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_stdlib_config.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_stdlib_config.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_stdlib_config.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_stdlib_config.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_stdlib_config.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_uart.o: $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_uart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_uart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_uart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_uart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_uart.o

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

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer.o: $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.o: $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_sysrtc.o: $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_sysrtc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_sysrtc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_sysrtc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_sysrtc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_sysrtc.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.o: $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.o

$(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/memory_manager/buffer_pool_allocator.o: $(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/memory_manager/buffer_pool_allocator.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/memory_manager/buffer_pool_allocator.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/memory_manager/buffer_pool_allocator.c
CDEPS += $(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/memory_manager/buffer_pool_allocator.d
OBJS += $(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/memory_manager/buffer_pool_allocator.o

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

$(OUTPUT_DIR)/project/autogen/sl_iostream_handles.o: autogen/sl_iostream_handles.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_iostream_handles.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_iostream_handles.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_iostream_handles.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_iostream_handles.o

$(OUTPUT_DIR)/project/autogen/sl_iostream_init_eusart_instances.o: autogen/sl_iostream_init_eusart_instances.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_iostream_init_eusart_instances.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_iostream_init_eusart_instances.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_iostream_init_eusart_instances.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_iostream_init_eusart_instances.o

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

$(OUTPUT_DIR)/project/autogen/sl_simple_button_instances.o: autogen/sl_simple_button_instances.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_simple_button_instances.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_simple_button_instances.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_simple_button_instances.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_simple_button_instances.o

$(OUTPUT_DIR)/project/autogen/sl_simple_led_instances.o: autogen/sl_simple_led_instances.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_simple_led_instances.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_simple_led_instances.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_simple_led_instances.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_simple_led_instances.o

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