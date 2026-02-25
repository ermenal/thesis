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
 '-DSL_CODE_COMPONENT_SE_MANAGER=se_manager' \
 '-DBUFFER_POOL_ALLOCATOR_USE_LOCAL_CONFIG_HEADER=1' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_RAIL_3_API=1' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DSL_RAIL_UTIL_PA_TABLES_CONFIG_HEADER=<sl_rail_util_pa_tables_config.h>' \
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
 '-DSL_CODE_COMPONENT_SE_MANAGER=se_manager' \
 '-DBUFFER_POOL_ALLOCATOR_USE_LOCAL_CONFIG_HEADER=1' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_RAIL_3_API=1' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DSL_RAIL_UTIL_PA_TABLES_CONFIG_HEADER=<sl_rail_util_pa_tables_config.h>' \
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
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_power_manager_init \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/se_manager/inc \
 -I$(COPIED_SDK_PATH)/util/silicon_labs/silabs_core/memory_manager \
 -I$(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/lib/fih/inc \
 -I$(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/platform/include \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/inc \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/src \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/sl_rail_util_pa_conversions \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/sl_rail_util_pa_tables \
 -I$(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/sl_rail_util_pa_tables/efr32xg23 \
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

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/sl_rail_util_pa_conversions/sl_rail_util_pa_conversions.o: $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/sl_rail_util_pa_conversions/sl_rail_util_pa_conversions.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/sl_rail_util_pa_conversions/sl_rail_util_pa_conversions.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/sl_rail_util_pa_conversions/sl_rail_util_pa_conversions.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/sl_rail_util_pa_conversions/sl_rail_util_pa_conversions.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/sl_rail_util_pa_conversions/sl_rail_util_pa_conversions.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/sl_rail_util_pa_conversions/sl_rail_util_pa_curves.o: $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/sl_rail_util_pa_conversions/sl_rail_util_pa_curves.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/sl_rail_util_pa_conversions/sl_rail_util_pa_curves.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/radio/rail_lib/plugin/sl_rail_util_pa_conversions/sl_rail_util_pa_curves.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/sl_rail_util_pa_conversions/sl_rail_util_pa_curves.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/sl_rail_util_pa_conversions/sl_rail_util_pa_curves.o

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