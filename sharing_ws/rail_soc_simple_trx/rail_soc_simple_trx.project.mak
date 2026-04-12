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
 '-DSL_CODE_COMPONENT_DEVICE_PERIPHERAL=device_peripheral' \
 '-DSL_CODE_COMPONENT_DMADRV=dmadrv' \
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
 '-DSL_CODE_COMPONENT_DEVICE_PERIPHERAL=device_peripheral' \
 '-DSL_CODE_COMPONENT_DMADRV=dmadrv' \
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
 -I$(COPIED_SDK_PATH)/app/common/util/app_assert \
 -I$(COPIED_SDK_PATH)/app/common/util/app_log \
 -I$(COPIED_SDK_PATH)/platform/common/inc \
 -I$(COPIED_SDK_PATH)/hardware/board/inc \
 -I$(COPIED_SDK_PATH)/platform/driver/button/inc \
 -I$(COPIED_SDK_PATH)/platform/service/cli/inc \
 -I$(COPIED_SDK_PATH)/platform/service/cli/src \
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
 -I$(COPIED_SDK_PATH)/platform/peripheral/inc \
 -I$(COPIED_SDK_PATH)/platform/service/interrupt_manager/inc \
 -I$(COPIED_SDK_PATH)/platform/service/interrupt_manager/src \
 -I$(COPIED_SDK_PATH)/platform/service/interrupt_manager/inc/arm \
 -I$(COPIED_SDK_PATH)/platform/service/iostream/inc \
 -I$(COPIED_SDK_PATH)/platform/driver/leddrv/inc \
 -I$(COPIED_SDK_PATH)/platform/service/memory_manager/inc \
 -I$(COPIED_SDK_PATH)/platform/service/mpu/inc \
 -I$(COPIED_SDK_PATH)/util/third_party/printf \
 -I$(COPIED_SDK_PATH)/util/third_party/printf/inc \
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
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/src \
 -I$(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_channel_selector \
 -I$(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_packet_asm \
 -I$(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_packet_assistant \
 -I$(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_simple_assistance

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
 -fno-builtin-printf \
 -fno-builtin-sprintf \
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
 -fno-builtin-printf \
 -fno-builtin-sprintf \
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
$(OUTPUT_DIR)/sdk/app/common/util/app_log/app_log.o: $(COPIED_SDK_PATH)/app/common/util/app_log/app_log.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/app/common/util/app_log/app_log.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/app/common/util/app_log/app_log.c
CDEPS += $(OUTPUT_DIR)/sdk/app/common/util/app_log/app_log.d
OBJS += $(OUTPUT_DIR)/sdk/app/common/util/app_log/app_log.o

$(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_channel_selector/sl_rail_sdk_channel_selector.o: $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_channel_selector/sl_rail_sdk_channel_selector.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_channel_selector/sl_rail_sdk_channel_selector.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_channel_selector/sl_rail_sdk_channel_selector.c
CDEPS += $(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_channel_selector/sl_rail_sdk_channel_selector.d
OBJS += $(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_channel_selector/sl_rail_sdk_channel_selector.o

$(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_channel_selector/sl_rail_sdk_channel_selector_cli.o: $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_channel_selector/sl_rail_sdk_channel_selector_cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_channel_selector/sl_rail_sdk_channel_selector_cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_channel_selector/sl_rail_sdk_channel_selector_cli.c
CDEPS += $(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_channel_selector/sl_rail_sdk_channel_selector_cli.d
OBJS += $(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_channel_selector/sl_rail_sdk_channel_selector_cli.o

$(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_packet_asm/sl_rail_sdk_packet_asm.o: $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_packet_asm/sl_rail_sdk_packet_asm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_packet_asm/sl_rail_sdk_packet_asm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_packet_asm/sl_rail_sdk_packet_asm.c
CDEPS += $(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_packet_asm/sl_rail_sdk_packet_asm.d
OBJS += $(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_packet_asm/sl_rail_sdk_packet_asm.o

$(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_packet_assistant/sl_rail_sdk_packet_assistant.o: $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_packet_assistant/sl_rail_sdk_packet_assistant.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_packet_assistant/sl_rail_sdk_packet_assistant.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_packet_assistant/sl_rail_sdk_packet_assistant.c
CDEPS += $(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_packet_assistant/sl_rail_sdk_packet_assistant.d
OBJS += $(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_packet_assistant/sl_rail_sdk_packet_assistant.o

$(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_packet_assistant/sl_rail_sdk_packet_assistant_cli.o: $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_packet_assistant/sl_rail_sdk_packet_assistant_cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_packet_assistant/sl_rail_sdk_packet_assistant_cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_packet_assistant/sl_rail_sdk_packet_assistant_cli.c
CDEPS += $(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_packet_assistant/sl_rail_sdk_packet_assistant_cli.d
OBJS += $(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_packet_assistant/sl_rail_sdk_packet_assistant_cli.o

$(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_simple_assistance/sl_rail_sdk_simple_assistance.o: $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_simple_assistance/sl_rail_sdk_simple_assistance.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_simple_assistance/sl_rail_sdk_simple_assistance.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/app/rail/component/sl_rail_sdk_simple_assistance/sl_rail_sdk_simple_assistance.c
CDEPS += $(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_simple_assistance/sl_rail_sdk_simple_assistance.d
OBJS += $(OUTPUT_DIR)/sdk/app/rail/component/sl_rail_sdk_simple_assistance/sl_rail_sdk_simple_assistance.o

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

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_arguments.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_arguments.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_arguments.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_arguments.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_arguments.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_arguments.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_command.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_command.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_command.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_command.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_command.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_command.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_input.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_input.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_input.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_input.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_input.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_input.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_io.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_io.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_io.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_io.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_io.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_io.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_tokenize.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_tokenize.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_tokenize.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_tokenize.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_tokenize.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_tokenize.o

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

$(OUTPUT_DIR)/sdk/util/third_party/printf/printf.o: $(COPIED_SDK_PATH)/util/third_party/printf/printf.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/printf/printf.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/printf/printf.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/printf/printf.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/printf/printf.o

$(OUTPUT_DIR)/sdk/util/third_party/printf/src/iostream_printf.o: $(COPIED_SDK_PATH)/util/third_party/printf/src/iostream_printf.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/printf/src/iostream_printf.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/printf/src/iostream_printf.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/printf/src/iostream_printf.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/printf/src/iostream_printf.o

$(OUTPUT_DIR)/project/app_cli.o: app_cli.c
	@$(POSIX_TOOL_PATH)echo 'Building app_cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ app_cli.c
CDEPS += $(OUTPUT_DIR)/project/app_cli.d
OBJS += $(OUTPUT_DIR)/project/app_cli.o

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

$(OUTPUT_DIR)/project/autogen/sl_cli_command_table.o: autogen/sl_cli_command_table.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_cli_command_table.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_cli_command_table.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_cli_command_table.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_cli_command_table.o

$(OUTPUT_DIR)/project/autogen/sl_cli_instances.o: autogen/sl_cli_instances.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_cli_instances.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_cli_instances.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_cli_instances.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_cli_instances.o

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

$(OUTPUT_DIR)/project/autogen/sli_cli_hooks.o: autogen/sli_cli_hooks.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sli_cli_hooks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sli_cli_hooks.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sli_cli_hooks.d
OBJS += $(OUTPUT_DIR)/project/autogen/sli_cli_hooks.o

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