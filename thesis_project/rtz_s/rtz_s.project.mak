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
 '-DSL_CODE_COMPONENT_GPIO=gpio' \
 '-DSL_CODE_COMPONENT_HAL_COMMON=hal_common' \
 '-DSL_CODE_COMPONENT_HAL_GPIO=hal_gpio' \
 '-DSL_CODE_COMPONENT_HAL_SYSRTC=hal_sysrtc' \
 '-DSL_CODE_COMPONENT_INTERRUPT_MANAGER=interrupt_manager' \
 '-DCMSIS_NVIC_VIRTUAL=1' \
 '-DCMSIS_NVIC_VIRTUAL_HEADER_FILE="cmsis_nvic_virtual.h"' \
 '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_trustzone_config.h>' \
 '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DSL_CODE_COMPONENT_SE_MANAGER=se_manager' \
 '-DBUFFER_POOL_ALLOCATOR_USE_LOCAL_CONFIG_HEADER=1' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_RAIL_3_API=1' \
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
 '-DSL_CODE_COMPONENT_GPIO=gpio' \
 '-DSL_CODE_COMPONENT_HAL_COMMON=hal_common' \
 '-DSL_CODE_COMPONENT_HAL_GPIO=hal_gpio' \
 '-DSL_CODE_COMPONENT_HAL_SYSRTC=hal_sysrtc' \
 '-DSL_CODE_COMPONENT_INTERRUPT_MANAGER=interrupt_manager' \
 '-DCMSIS_NVIC_VIRTUAL=1' \
 '-DCMSIS_NVIC_VIRTUAL_HEADER_FILE="cmsis_nvic_virtual.h"' \
 '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_trustzone_config.h>' \
 '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DSL_CODE_COMPONENT_SE_MANAGER=se_manager' \
 '-DBUFFER_POOL_ALLOCATOR_USE_LOCAL_CONFIG_HEADER=1' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_RAIL_3_API=1' \
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
 -I. \
 -I../rtz_ns/config/export \
 -I$(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Include \
 -I$(COPIED_SDK_PATH)/platform/common/inc \
 -I$(COPIED_SDK_PATH)/hardware/board/inc \
 -I$(COPIED_SDK_PATH)/platform/bootloader \
 -I$(COPIED_SDK_PATH)/platform/bootloader/api \
 -I$(COPIED_SDK_PATH)/platform/bootloader/core/flash \
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
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/inc \
 -I$(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/memory_manager \
 -I$(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/lib/fih/inc \
 -I$(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/platform/include \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/inc \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/src \
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
 -I$(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/secure_fw/partitions/internal_trusted_storage

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

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.o: $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.o: $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.o

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

$(OUTPUT_DIR)/project/second_main.o: second_main.c
	@$(POSIX_TOOL_PATH)echo 'Building second_main.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ second_main.c
CDEPS += $(OUTPUT_DIR)/project/second_main.d
OBJS += $(OUTPUT_DIR)/project/second_main.o

$(OUTPUT_DIR)/project/mijn_tz_setup.o: mijn_tz_setup.c
	@$(POSIX_TOOL_PATH)echo 'Building mijn_tz_setup.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ mijn_tz_setup.c
CDEPS += $(OUTPUT_DIR)/project/mijn_tz_setup.d
OBJS += $(OUTPUT_DIR)/project/mijn_tz_setup.o

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=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END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA