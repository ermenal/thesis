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
 '-DTFM_CRYPTO_CONC_OPER_NUM=2' \
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
 '-DSL_CODE_COMPONENT_SE_MANAGER=se_manager' \
 '-DBUFFER_POOL_ALLOCATOR_USE_LOCAL_CONFIG_HEADER=1' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_CODE_COMPONENT_SLEEPTIMER=sleeptimer' \
 '-DSLI_RADIOAES_REQUIRES_MASKING=1' \
 '-DSL_CODE_COMPONENT_SLI_PROTOCOL_CRYPTO=sli_protocol_crypto' \
 '-DSL_CODE_COMPONENT_PSEC_OSAL=psec_osal' \
 '-DSL_TRUSTZONE_SECURE=1' \
 '-DSLI_PSA_ITS_ENCRYPTED=1' \
 '-DTFM_CONFIG_SL_SECURE_LIBRARY=1' \
 '-DTZ_SERVICE_CONFIG_PRESENT=1' \
 '-DTFM_PARTITION_CRYPTO=1'

ASM_DEFS += \
 '-DTFM_CRYPTO_CONC_OPER_NUM=2' \
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
 '-DSL_CODE_COMPONENT_SE_MANAGER=se_manager' \
 '-DBUFFER_POOL_ALLOCATOR_USE_LOCAL_CONFIG_HEADER=1' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_CODE_COMPONENT_SLEEPTIMER=sleeptimer' \
 '-DSLI_RADIOAES_REQUIRES_MASKING=1' \
 '-DSL_CODE_COMPONENT_SLI_PROTOCOL_CRYPTO=sli_protocol_crypto' \
 '-DSL_CODE_COMPONENT_PSEC_OSAL=psec_osal' \
 '-DSL_TRUSTZONE_SECURE=1' \
 '-DSLI_PSA_ITS_ENCRYPTED=1' \
 '-DTFM_CONFIG_SL_SECURE_LIBRARY=1' \
 '-DTZ_SERVICE_CONFIG_PRESENT=1' \
 '-DTFM_PARTITION_CRYPTO=1'

INCLUDES += \
 -Iautogen \
 -Iconfig \
 -I../rtz_ns/autogen/export \
 -I../rtz_ns/config/export \
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
 -I$(COPIED_SDK_PATH)/platform/emdrv/nvm3/inc \
 -I$(COPIED_SDK_PATH)/platform/emdrv/nvm3/config \
 -I$(COPIED_SDK_PATH)/platform/service/power_manager/inc \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/inc \
 -I$(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/interface/include \
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
 -I$(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/lib/fih/inc \
 -I$(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/platform/include \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/inc \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/src \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/sl_system_compatibility/inc \
 -I$(COPIED_SDK_PATH)/platform/service/sleeptimer/inc \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sli_psec_osal/inc \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/inc/common \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/inc/secure \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/config/secure \
 -I$(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/lib/ext/qcbor/src \
 -I$(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/lib/ext/t_cose/src \
 -I$(COPIED_SDK_PATH)/util/third_party \
 -I$(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto \
 -I$(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/spm/include \
 -I$(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/internal_trusted_storage \
 -I$(COPIED_SDK_PATH)/platform/service/udelay/inc \
 -I$(COPIED_SDK_PATH)/platform/emdrv/ustimer/inc

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
 -Os \
 -fdata-sections \
 -ffunction-sections \
 -fomit-frame-pointer \
 -g \
 -Wno-ignored-qualifiers \
 -Wno-sign-compare \
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
 -Wno-ignored-qualifiers \
 -Wno-sign-compare \
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
 -Xlinker --cmse-implib \
 -Xlinker --out-implib=$(OUTPUT_DIR)/trustzone_secure_library.o \
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
	$(ECHO) @"$(POST_BUILD_EXE)" postbuild "./rtz_s.slpb" --parameter build_dir:"$(OUTPUT_DIR)"

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

$(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface.o: $(COPIED_SDK_PATH)/platform/bootloader/api/btl_interface.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/bootloader/api/btl_interface.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/bootloader/api/btl_interface.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface.d
OBJS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface.o

$(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_nsc.o: $(COPIED_SDK_PATH)/platform/bootloader/api/btl_interface_nsc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/bootloader/api/btl_interface_nsc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/bootloader/api/btl_interface_nsc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_nsc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_nsc.o

$(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_storage.o: $(COPIED_SDK_PATH)/platform/bootloader/api/btl_interface_storage.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/bootloader/api/btl_interface_storage.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/bootloader/api/btl_interface_storage.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_storage.d
OBJS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_storage.o

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

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3.o: $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_cache.o: $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_cache.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_cache.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_cache.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_cache.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_cache.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_hal_flash.o: $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_hal_flash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_hal_flash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_hal_flash.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_hal_flash.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_hal_flash.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_lock.o: $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_lock.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_lock.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_lock.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_lock.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_lock.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_object.o: $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_object.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_object.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_object.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_object.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_object.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_page.o: $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_page.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_page.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_page.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_page.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_page.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_utils.o: $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_utils.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_utils.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emdrv/nvm3/src/nvm3_utils.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_utils.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_utils.o

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

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager.o: $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.o: $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.o: $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.o: $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_hash.o: $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_hash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_hash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_hash.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_hash.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_hash.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.o: $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.o: $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_signature.o: $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_signature.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_signature.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_signature.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_signature.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_signature.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_util.o: $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_util.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_util.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_util.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.o: $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_sha.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_sha.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_sha.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_sha.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_sha.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_sha.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/se_aes.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/se_aes.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/se_aes.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/se_aes.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/se_aes.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/se_aes.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/se_gcm.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/se_gcm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/se_gcm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/se_gcm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/se_gcm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/se_gcm.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/se_jpake.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/se_jpake.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/se_jpake.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/se_jpake.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/se_jpake.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/se_jpake.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_entropy_hardware.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_entropy_hardware.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_entropy_hardware.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_entropy_hardware.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_entropy_hardware.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_entropy_hardware.o

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

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_aead.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_aead.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_aead.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_aead.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_aead.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_aead.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_builtin_keys.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_builtin_keys.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_builtin_keys.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_builtin_keys.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_builtin_keys.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_builtin_keys.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_cipher.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_cipher.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_derivation.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_derivation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_derivation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_derivation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_derivation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_derivation.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_management.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_management.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_management.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_management.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_management.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_management.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_mac.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_mac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_mac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_mac.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_mac.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_mac.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_signature.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_signature.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_signature.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_signature.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_signature.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_signature.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_aead.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_aead.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_aead.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_aead.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_aead.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_aead.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_cipher.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_cipher.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_mac.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_mac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_mac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_mac.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_mac.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_mac.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_key_derivation.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_key_derivation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_key_derivation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_key_derivation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_key_derivation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_key_derivation.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_aead.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_aead.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_aead.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_aead.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_aead.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_aead.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_cipher.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_cipher.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_hash.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_hash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_hash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_hash.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_hash.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_hash.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_mac.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_mac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_mac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_mac.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_mac.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_mac.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_key_derivation.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_key_derivation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_key_derivation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_key_derivation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_key_derivation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_key_derivation.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_iovec_check.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_iovec_check.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_iovec_check.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_iovec_check.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_iovec_check.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_iovec_check.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_s_interface.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_s_interface.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_s_interface.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_s_interface.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_s_interface.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_s_interface.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_secure_main.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_secure_main.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_secure_main.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_secure_main.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_secure_main.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_secure_main.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_attestation.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_attestation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_attestation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_attestation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_attestation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_attestation.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_its_s.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_its_s.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_its_s.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_its_s.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_its_s.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_its_s.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_msc_s.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_msc_s.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_msc_s.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_msc_s.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_msc_s.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_msc_s.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_s.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_s.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_s.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_s.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_s.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_s.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_se_manager_s.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_se_manager_s.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_se_manager_s.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_se_manager_s.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_se_manager_s.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_se_manager_s.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_s.o: $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_s.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_s.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_s.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_s.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_s.o

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

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/aes.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/aes.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/aes.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/aes.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/aes.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/aes.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/asn1parse.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/asn1parse.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/asn1parse.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/asn1parse.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/asn1parse.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/asn1parse.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/asn1write.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/asn1write.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/asn1write.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/asn1write.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/asn1write.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/asn1write.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/bignum.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/bignum.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/bignum.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_core.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/bignum_core.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/bignum_core.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/bignum_core.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_core.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_core.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_mod.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/bignum_mod.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/bignum_mod.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/bignum_mod.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_mod.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_mod.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_mod_raw.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/bignum_mod_raw.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/bignum_mod_raw.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/bignum_mod_raw.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_mod_raw.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_mod_raw.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/block_cipher.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/block_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/block_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/block_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/block_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/block_cipher.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ccm.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ccm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ccm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ccm.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ccm.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ccm.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/chacha20.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/chacha20.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/chacha20.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/chacha20.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/chacha20.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/chacha20.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/chachapoly.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/chachapoly.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/chachapoly.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/chachapoly.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/chachapoly.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/chachapoly.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher_wrap.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/cipher_wrap.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/cipher_wrap.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/cipher_wrap.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher_wrap.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher_wrap.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cmac.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/cmac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/cmac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/cmac.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cmac.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cmac.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/constant_time.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/constant_time.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/constant_time.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ctr_drbg.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ctr_drbg.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ctr_drbg.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ctr_drbg.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ctr_drbg.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ctr_drbg.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecdh.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecdh.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecdh.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecdh.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecdh.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecdh.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecdsa.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecdsa.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecdsa.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecdsa.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecdsa.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecdsa.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecjpake.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecjpake.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecjpake.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecjpake.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecjpake.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecjpake.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecp.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecp.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecp.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp_curves.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecp_curves.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecp_curves.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecp_curves.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp_curves.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp_curves.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp_curves_new.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecp_curves_new.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecp_curves_new.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/ecp_curves_new.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp_curves_new.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp_curves_new.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/entropy.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/entropy.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/entropy.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/entropy.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/entropy.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/entropy.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/entropy_poll.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/entropy_poll.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/entropy_poll.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/entropy_poll.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/entropy_poll.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/entropy_poll.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/gcm.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/gcm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/gcm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/gcm.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/gcm.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/gcm.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/hkdf.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/hkdf.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/hkdf.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/hkdf.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/hkdf.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/hkdf.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/hmac_drbg.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/hmac_drbg.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/hmac_drbg.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/hmac_drbg.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/hmac_drbg.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/hmac_drbg.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/md.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/md.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/md.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/md.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/md.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/md.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/md5.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/md5.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/md5.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/md5.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/md5.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/md5.o

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

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/poly1305.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/poly1305.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/poly1305.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/poly1305.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/poly1305.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/poly1305.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_aead.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_aead.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_aead.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_aead.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_aead.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_aead.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_cipher.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_cipher.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_client.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_client.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_client.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_client.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_client.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_client.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ecp.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ecp.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ecp.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ecp.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ecp.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ecp.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ffdh.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ffdh.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ffdh.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ffdh.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ffdh.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ffdh.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_hash.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_hash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_hash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_hash.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_hash.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_hash.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_mac.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_mac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_mac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_mac.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_mac.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_mac.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_pake.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_pake.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_pake.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_pake.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_pake.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_pake.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_rsa.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_rsa.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_rsa.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_rsa.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_rsa.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_rsa.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_se.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_se.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_se.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_se.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_se.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_se.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_slot_management.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_slot_management.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_slot_management.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_slot_management.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_slot_management.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_slot_management.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_storage.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_storage.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_storage.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_storage.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_storage.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_storage.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/psa_util.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/sha1.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/sha1.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/sha1.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/sha1.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/sha1.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/sha1.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/sha256.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/sha256.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/sha256.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/sha256.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/sha256.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/sha256.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/sha512.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/sha512.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/sha512.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/sha512.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/sha512.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/sha512.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.o: $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/threading.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/threading.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/mbedtls/library/threading.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/lib/fih/src/fih.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/lib/fih/src/fih.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/lib/fih/src/fih.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/lib/fih/src/fih.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/lib/fih/src/fih.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/lib/fih/src/fih.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/hse/sli_se.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/hse/sli_se.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/hse/sli_se.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/hse/sli_se.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/hse/sli_se.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/hse/sli_se.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_aead.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_aead.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_aead.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_aead.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_aead.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_aead.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_alloc.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_alloc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_alloc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_alloc.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_alloc.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_alloc.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_asymmetric.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_asymmetric.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_asymmetric.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_asymmetric.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_asymmetric.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_asymmetric.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_cipher.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_cipher.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_hash.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_hash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_hash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_hash.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_hash.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_hash.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_init_sl.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_init_sl.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_init_sl.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_init_sl.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_init_sl.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_init_sl.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key_derivation.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key_derivation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key_derivation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key_derivation.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key_derivation.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key_derivation.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key_management.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key_management.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key_management.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key_management.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key_management.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_key_management.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_mac.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_mac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_mac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_mac.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_mac.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_mac.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_pake.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_pake.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_pake.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_pake.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_pake.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_pake.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_rng.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_rng.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_rng.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_rng.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_rng.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/secure_fw/partitions/crypto/crypto_rng.o

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

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=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END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA