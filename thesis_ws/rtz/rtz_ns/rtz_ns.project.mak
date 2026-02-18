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
 '-DPSA_CRYPTO_PRINT=1' \
 '-DEFR32FG23B010F512IM48=1' \
 '-DSL_CODE_COMPONENT_SYSTEM=system' \
 '-DSL_APP_PROPERTIES=1' \
 '-DHARDWARE_BOARD_DEFAULT_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_2_RF_BANDS=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_915=1' \
 '-DHFXO_FREQ=39000000' \
 '-DSL_BOARD_NAME="BRD2600A"' \
 '-DSL_BOARD_REV="A03"' \
 '-DSL_CODE_COMPONENT_CLOCK_MANAGER=clock_manager' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DSL_CODE_COMPONENT_DEVICE_PERIPHERAL=device_peripheral' \
 '-DSL_CODE_COMPONENT_DMADRV=dmadrv' \
 '-DSL_KIT_NAME="FG23-DK2600A"' \
 '-DSL_KIT_REV="A02"' \
 '-DSL_CODE_COMPONENT_GPIO=gpio' \
 '-DSL_CODE_COMPONENT_HAL_COMMON=hal_common' \
 '-DSL_CODE_COMPONENT_HAL_GPIO=hal_gpio' \
 '-DSL_CODE_COMPONENT_HAL_SYSRTC=hal_sysrtc' \
 '-DSL_CODE_COMPONENT_INTERRUPT_MANAGER=interrupt_manager' \
 '-DCMSIS_NVIC_VIRTUAL=1' \
 '-DCMSIS_NVIC_VIRTUAL_HEADER_FILE="cmsis_nvic_virtual.h"' \
 '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_trustzone_config.h>' \
 '-DSL_CODE_COMPONENT_POWER_MANAGER=power_manager' \
 '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DBUFFER_POOL_ALLOCATOR_USE_LOCAL_CONFIG_HEADER=1' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_CODE_COMPONENT_SLEEPTIMER=sleeptimer' \
 '-DSL_TRUSTZONE_NONSECURE=1' \
 '-DNO_CRYPTO_ACCELERATION=1' \
 '-DTFM_CONFIG_SL_SECURE_LIBRARY=1' \
 '-DTZ_SERVICE_CONFIG_PRESENT=1'

ASM_DEFS += \
 '-DDEBUG_EFM=1' \
 '-DPSA_CRYPTO_PRINT=1' \
 '-DEFR32FG23B010F512IM48=1' \
 '-DSL_CODE_COMPONENT_SYSTEM=system' \
 '-DSL_APP_PROPERTIES=1' \
 '-DHARDWARE_BOARD_DEFAULT_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_2_RF_BANDS=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_915=1' \
 '-DHFXO_FREQ=39000000' \
 '-DSL_BOARD_NAME="BRD2600A"' \
 '-DSL_BOARD_REV="A03"' \
 '-DSL_CODE_COMPONENT_CLOCK_MANAGER=clock_manager' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DSL_CODE_COMPONENT_DEVICE_PERIPHERAL=device_peripheral' \
 '-DSL_CODE_COMPONENT_DMADRV=dmadrv' \
 '-DSL_KIT_NAME="FG23-DK2600A"' \
 '-DSL_KIT_REV="A02"' \
 '-DSL_CODE_COMPONENT_GPIO=gpio' \
 '-DSL_CODE_COMPONENT_HAL_COMMON=hal_common' \
 '-DSL_CODE_COMPONENT_HAL_GPIO=hal_gpio' \
 '-DSL_CODE_COMPONENT_HAL_SYSRTC=hal_sysrtc' \
 '-DSL_CODE_COMPONENT_INTERRUPT_MANAGER=interrupt_manager' \
 '-DCMSIS_NVIC_VIRTUAL=1' \
 '-DCMSIS_NVIC_VIRTUAL_HEADER_FILE="cmsis_nvic_virtual.h"' \
 '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_trustzone_config.h>' \
 '-DSL_CODE_COMPONENT_POWER_MANAGER=power_manager' \
 '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DBUFFER_POOL_ALLOCATOR_USE_LOCAL_CONFIG_HEADER=1' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_CODE_COMPONENT_SLEEPTIMER=sleeptimer' \
 '-DSL_TRUSTZONE_NONSECURE=1' \
 '-DNO_CRYPTO_ACCELERATION=1' \
 '-DTFM_CONFIG_SL_SECURE_LIBRARY=1' \
 '-DTZ_SERVICE_CONFIG_PRESENT=1'

INCLUDES += \
 -Iautogen \
 -Iconfig \
 -Iconfig/export \
 -Iautogen/export \
 -I. \
 -I../rtz_s/autogen/export \
 -I../rtz_s/config/export \
 -I$(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Include \
 -I$(COPIED_SDK_PATH)/platform/common/inc \
 -I$(COPIED_SDK_PATH)/hardware/board/inc \
 -I$(COPIED_SDK_PATH)/platform/bootloader \
 -I$(COPIED_SDK_PATH)/platform/bootloader/api \
 -I$(COPIED_SDK_PATH)/platform/bootloader/core/flash \
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
 -I$(COPIED_SDK_PATH)/platform/service/hfxo_manager/inc \
 -I$(COPIED_SDK_PATH)/platform/service/interrupt_manager/inc \
 -I$(COPIED_SDK_PATH)/platform/service/interrupt_manager/src \
 -I$(COPIED_SDK_PATH)/platform/service/interrupt_manager/inc/arm \
 -I$(COPIED_SDK_PATH)/platform/service/iostream/inc \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/config \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/config/preset \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/inc \
 -I$(COPIED_SDK_PATH)/util/third_party/mbedtls/include \
 -I$(COPIED_SDK_PATH)/util/third_party/mbedtls/library \
 -I$(COPIED_SDK_PATH)/platform/service/memory_manager/inc \
 -I$(COPIED_SDK_PATH)/platform/service/memory_manager/src \
 -I$(COPIED_SDK_PATH)/platform/service/mpu/inc \
 -I$(COPIED_SDK_PATH)/platform/emdrv/nvm3/config \
 -I$(COPIED_SDK_PATH)/platform/service/power_manager/inc \
 -I$(COPIED_SDK_PATH)/util/third_party/printf \
 -I$(COPIED_SDK_PATH)/util/third_party/printf/inc \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/inc \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/common \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/protocol/ble \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/protocol/ieee802154 \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/protocol/wmbus \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/protocol/zwave \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/chip/efr32/efr32xg2x \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/protocol/sidewalk \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_callbacks \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_dma \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/efr32xg23 \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_power_manager_init \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_rssi \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/inc \
 -I$(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/memory_manager \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/inc \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/src \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/sl_system_compatibility/inc \
 -I$(COPIED_SDK_PATH)/platform/service/sleeptimer/inc \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/inc/common \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/inc/secure \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/inc/nonsecure \
 -I$(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/interface/include \
 -I$(COPIED_SDK_PATH)/platform/emdrv/nvm3/inc \
 -I$(COPIED_SDK_PATH)/util/third_party \
 -I$(COPIED_SDK_PATH)/platform/service/udelay/inc \
 -I$(COPIED_SDK_PATH)/platform/emdrv/ustimer/inc

GROUP_START =-Wl,--start-group
GROUP_END =-Wl,--end-group

PROJECT_LIBS = \
 -lgcc \
 -lc \
 -lm \
 -lnosys \
 ../rtz_s/artifact/trustzone_secure_library.o \
 $(COPIED_SDK_PATH)/platform/radio/rail_lib/autogen/librail_release/librail_efr32xg23_gcc_release.a

LIBS += $(GROUP_START) $(PROJECT_LIBS) $(GROUP_END)

LIB_FILES += $(filter %.a, $(PROJECT_LIBS))

C_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -std=c18 \
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
 -Wl,--wrap=_free_r -Wl,--wrap=_malloc_r -Wl,--wrap=_calloc_r -Wl,--wrap=_realloc_r \
 -Wl,--wrap=sl_system_init,--wrap=sl_system_process_action \
 -fno-lto \
 -Wl,--gc-sections


####################################################################
# Pre/Post Build Rules                                             #
####################################################################
pre-build:
	# No pre-build defined

post-build: $(OUTPUT_DIR)/$(PROJECTNAME).out
ifeq ($(POST_BUILD_EXE),)
		$(error POST_BUILD_EXE is not defined. Post-Build cannot run. Please set the STUDIO_ADAPTER_PACK_PATH to the post-build tool when generating or override the variable for this makefile)
endif
	@$(POSIX_TOOL_PATH)echo 'Running Project Post-Build'
	$(ECHO) @"$(POST_BUILD_EXE)" postbuild "./rtz_ns.slpb" --parameter build_dir:"$(OUTPUT_DIR)"

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

$(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_ns.o: $(COPIED_SDK_PATH)/platform/bootloader/api/btl_interface_ns.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/bootloader/api/btl_interface_ns.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/bootloader/api/btl_interface_ns.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_ns.d
OBJS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_ns.o

$(OUTPUT_DIR)/sdk/platform/bootloader/app_properties/app_properties.o: $(COPIED_SDK_PATH)/platform/bootloader/app_properties/app_properties.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/bootloader/app_properties/app_properties.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/bootloader/app_properties/app_properties.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/bootloader/app_properties/app_properties.d
OBJS += $(OUTPUT_DIR)/sdk/platform/bootloader/app_properties/app_properties.o

$(OUTPUT_DIR)/sdk/platform/bootloader/core/flash/btl_internal_flash.o: $(COPIED_SDK_PATH)/platform/bootloader/core/flash/btl_internal_flash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/bootloader/core/flash/btl_internal_flash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/bootloader/core/flash/btl_internal_flash.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/bootloader/core/flash/btl_internal_flash.d
OBJS += $(OUTPUT_DIR)/sdk/platform/bootloader/core/flash/btl_internal_flash.o

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

$(OUTPUT_DIR)/sdk/platform/common/src/sl_stdio.o: $(COPIED_SDK_PATH)/platform/common/src/sl_stdio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/common/src/sl_stdio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/common/src/sl_stdio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_stdio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_stdio.o

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

$(OUTPUT_DIR)/sdk/platform/emdrv/ustimer/src/ustimer.o: $(COPIED_SDK_PATH)/platform/emdrv/ustimer/src/ustimer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emdrv/ustimer/src/ustimer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emdrv/ustimer/src/ustimer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/ustimer/src/ustimer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/ustimer/src/ustimer.o

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

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_letimer.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_letimer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_letimer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_letimer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_letimer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_letimer.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_prs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_prs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_prs.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_se.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_se.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_se.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_se.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_se.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_se.o

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

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_usart.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_usart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_usart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_usart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_usart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_usart.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_wdog.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_wdog.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_wdog.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_wdog.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_wdog.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_wdog.o

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

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.o: $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.o: $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.o: $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.o: $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.o: $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.o: $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sl_tz_service_attestation.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sl_tz_service_attestation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sl_tz_service_attestation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sl_tz_service_attestation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sl_tz_service_attestation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sl_tz_service_attestation.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_ns_interface.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_ns_interface.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_ns_interface.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_ns_interface.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_ns_interface.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_ns_interface.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_ns.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_ns.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_ns.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_ns.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_ns.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_ns.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_ns.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_ns.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_ns.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_ns.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_ns.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_ns.o

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

$(OUTPUT_DIR)/sdk/platform/service/hfxo_manager/src/sl_hfxo_manager.o: $(COPIED_SDK_PATH)/platform/service/hfxo_manager/src/sl_hfxo_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/hfxo_manager/src/sl_hfxo_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/hfxo_manager/src/sl_hfxo_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/hfxo_manager/src/sl_hfxo_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/hfxo_manager/src/sl_hfxo_manager.o

$(OUTPUT_DIR)/sdk/platform/service/hfxo_manager/src/sl_hfxo_manager_hal_s2.o: $(COPIED_SDK_PATH)/platform/service/hfxo_manager/src/sl_hfxo_manager_hal_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/hfxo_manager/src/sl_hfxo_manager_hal_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/hfxo_manager/src/sl_hfxo_manager_hal_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/hfxo_manager/src/sl_hfxo_manager_hal_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/hfxo_manager/src/sl_hfxo_manager_hal_s2.o

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

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_uart.o: $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_uart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_uart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_uart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_uart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_uart.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager.o: $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.o: $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool.o: $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool_common.o: $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool_common.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool_common.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool_common.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.o: $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_retarget.o: $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_retarget.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_retarget.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_retarget.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_retarget.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_retarget.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sli_memory_manager_common.o: $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sli_memory_manager_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sli_memory_manager_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/memory_manager/src/sli_memory_manager_common.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sli_memory_manager_common.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sli_memory_manager_common.o

$(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu_s2.o: $(COPIED_SDK_PATH)/platform/service/mpu/src/sl_mpu_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/mpu/src/sl_mpu_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/mpu/src/sl_mpu_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu_s2.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_common.o: $(COPIED_SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_common.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_common.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_common.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_em4.o: $(COPIED_SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_em4.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_em4.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_em4.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_em4.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_em4.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager.o: $(COPIED_SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.o: $(COPIED_SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.o: $(COPIED_SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.o

$(OUTPUT_DIR)/sdk/platform/service/sl_main/sl_system_compatibility/src/sl_system_compatibility.o: $(COPIED_SDK_PATH)/platform/service/sl_main/sl_system_compatibility/src/sl_system_compatibility.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/sl_main/sl_system_compatibility/src/sl_system_compatibility.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/sl_main/sl_system_compatibility/src/sl_system_compatibility.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/sl_system_compatibility/src/sl_system_compatibility.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/sl_system_compatibility/src/sl_system_compatibility.o

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

$(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay.o: $(COPIED_SDK_PATH)/platform/service/udelay/src/sl_udelay.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/udelay/src/sl_udelay.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/udelay/src/sl_udelay.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay.o

$(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay_armv6m_gcc.o: $(COPIED_SDK_PATH)/platform/service/udelay/src/sl_udelay_armv6m_gcc.S
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/udelay/src/sl_udelay_armv6m_gcc.S'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(ASMFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/udelay/src/sl_udelay_armv6m_gcc.S
ASMDEPS_S += $(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay_armv6m_gcc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay_armv6m_gcc.o

$(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/memory_manager/buffer_pool_allocator.o: $(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/memory_manager/buffer_pool_allocator.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/memory_manager/buffer_pool_allocator.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/memory_manager/buffer_pool_allocator.c
CDEPS += $(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/memory_manager/buffer_pool_allocator.d
OBJS += $(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/memory_manager/buffer_pool_allocator.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/constant_time.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/constant_time.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/constant_time.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/platform.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/platform.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/platform.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform_util.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/platform_util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/platform_util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/platform_util.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform_util.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform_util.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_util.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/threading.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/threading.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/threading.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.o

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

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/interface/src/tfm_crypto_func_api.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/interface/src/tfm_crypto_func_api.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/interface/src/tfm_crypto_func_api.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/interface/src/tfm_crypto_func_api.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/interface/src/tfm_crypto_func_api.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/interface/src/tfm_crypto_func_api.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/common/tfm_ns_interface.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/common/tfm_ns_interface.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/common/tfm_ns_interface.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/common/tfm_ns_interface.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/common/tfm_ns_interface.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/common/tfm_ns_interface.o

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

$(OUTPUT_DIR)/project/app_psa_attestation.o: app_psa_attestation.c
	@$(POSIX_TOOL_PATH)echo 'Building app_psa_attestation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ app_psa_attestation.c
CDEPS += $(OUTPUT_DIR)/project/app_psa_attestation.d
OBJS += $(OUTPUT_DIR)/project/app_psa_attestation.o

$(OUTPUT_DIR)/project/app_psa_crypto_key.o: app_psa_crypto_key.c
	@$(POSIX_TOOL_PATH)echo 'Building app_psa_crypto_key.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ app_psa_crypto_key.c
CDEPS += $(OUTPUT_DIR)/project/app_psa_crypto_key.d
OBJS += $(OUTPUT_DIR)/project/app_psa_crypto_key.o

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

$(OUTPUT_DIR)/project/autogen/sl_power_manager_handler.o: autogen/sl_power_manager_handler.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_power_manager_handler.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_power_manager_handler.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_power_manager_handler.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_power_manager_handler.o

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