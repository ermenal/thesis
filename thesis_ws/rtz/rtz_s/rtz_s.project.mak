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
 '-DSL_TRUSTZONE_PERIPHERAL_AHBRADIO_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_CMU_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_DCDC_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_EMU_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_EUSART0_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_FSRCO_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_GPIO_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_HFXO0_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_HOSTMAILBOX_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_LDMAXBAR_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_LDMA_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_LFRCO_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_LFXO_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_MSC_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_PRS_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_SEMAILBOX_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_SMU_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_SYSCFG_S=1' \
 '-DSL_TRUSTZONE_PERIPHERAL_SYSRTC_S=1' \
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
# SIMPLICITY_STUDIO_METADATA=eJzsvQuT20aSLvpXJhwbN3bPcTfxfvjMzIYsyzM6K1m6ankfZ72BQIPFJiyAwABgq9sb+99vVeFBAARJVFYW2N57dj2SSAJfflmPrKxX5n9+c/f2/cd3b1+//fxvwd3nn394+yH4+MP7u2++++aP//iUJr/88odHUpRxtvvTL9/ot9ov39BvyC7K1vHugX718+cfb7xfvvnHP//yyy+7P+ZF9iuJKvrILkwJ/Xkf3abZep+Q25JU+/x2H73Odpv44baofgvK24co4oD0vZwU1fNdRP+mr7U433BY+gD974+bLFmT4oAdcaTBM+2TcUIOz5VJECVZ9CVIw134QIogK6M4ScIqK4Ia43bLWTyQHSnCiqzpS1WxJ/zLJN594d9swqSkX62ExVUFIYoErcn9/iEov2Yq8NdpuC4eFTHfbp6yroTUiCjCOAn2Ff0jCpPkPoy+lMol0TJTIeN+v9nQcsqzLAmoLlmksPGWcZonJLjfV1W2C+6rnaa81OJdXNE/ykq5pFxJ9ezLKk6VteNNuE9Y8TCLSO1wsA2LNdlR8xtEGwUW5TGOSF0j62gdLVEjVXifEFV9MyVpVjwrNjX3Ga0Thl0VtIcuokhBHlhjUCArzPOgGZBjZdUSZyUdF8M0IPsyLKrgMcpSVaNxVqgaf4e2UnlXKbIqi9Q0sPuKmeGKFJuQdn9sw3KEHpRGZKLXRkJIrtIS940jSfeSUv64qj3a/lfxLkr2a/IxrLb0476ImeBqv46z71aNU7xq/d4a64/t9/zTH9Q47Z8JbedUNwy3PdxXGS2rWX57bVfXpB0C4+q2lny/j5Mq3vWL+rj851QpNXZJTN0pZkur55w0lYmD/+nzm+B1lubZjuyqEhWa27UGmfq3VZhkD9gCyCMD34a7dUIKteCYtUqeQm6Vy/iBe0lfyPNtTlKFEvL9vTIhNxT5JiTlTRSlt9VThVsL3TBcVwR6Gz3CR+6+HX43hQh3kUI1atNfuywHaUqVOpKGrNvENBlboaGbpKzcTolRVmAqBqQROiZ37owU7LvbZI2Iy3wCEu2pl93MUZohHkoe6hh1nsVinlHzwHtShWs6Bi/qHrECPkzT/ruXdOfs3PGPGAVNy41OR6rLJU3Lrax+o9LbZp7E90VYPN9mkz7+6VJrJK7OAV6qnrEa3OjFUVw9B+X6S2Bohn3r3BqTWo1eZS79JivSiWdPvPEDnwCdfP7EW3cxJZjt3oX35YVXTwC8+fGTafz4F8Oc9fopFtm+uMh9CmdooZ/LiqQB2RSmsXkwzMb8X2wDtG5WbXmv6mJc9cpl1am4qnmupgQdW2Ix7hVtgft8CfJTkuazn2j3gpX9tjZisrXd8b/XdG1j60acWl4zrCGWWsN2dVKcZMV3uEEYpfkC/Ds5eMQ7P04t71oMGu37fRGmSxDvBGFSr6KFqNeC0KhH6X4J4o0YNNpsv2UJ3q0cPOJU/m6TLcL9IAqPfhpS3DIq4rzKikW0OJKIp0yeJIuo0MhBI06W6bQEudPWyzOLMO8koZHflEW0SLftBKFRf8ijYhFr2QlCpB4vUuitHFTiQZ4t09wHwtBU2G4WavGdIETqTwsxf8IlHhuLdNRGDB7tcBl3rJWDRzwKoy1ZhHonCY38F/JcRuFuCfY9UWj0k2i9BPVGDCbtYrMQ8VoQHnXqTC/CvJGDSvzpPlxkwtGXha4AO6AR75ZZoJmSiacQKcmuXMRy9kQh0ueHn5ah34nCo7+Ua5agu2bJQq5Zgu2apWGc3GdPS3DvicKjn4fb+4VWWPuy8BQoF3ExGzFotPNot8gcsJWDR3yTPuX5Mq5OXxaeAsUiw2wjBpM2Py1HqS5Evy8OTY0yKsIq2ubhIk7+UBqeEmRBqz8QhqfCMmvFJfJacUnnm93JerXMO0mY5BfaEDxIQiO/mGOM7xbvF/OL9/iO8WKbI/h7I4/rcJHW3spBI/51nS1iY1o5ssTT5l6NQs59EbKHqMbnspSxnpKk5AzVrEcvPHTp5+PL+2maTZ1yPftWvItmniA8uudTZWkM68811RWVvRoAzamLiStNMcweDlk0KDAKUbYmQZSEZRlvmrtPCJROoIIoxmo4noSFlSPZ7WErD8OCa2FgJKgqBDjEjhp2BwRtVQwNpSG1QGAieZwA3b0jKh0UlEwBG9jGRIrZg9fExZiqiHcwn2BI4wAEJJLEJUZb7XCg5RFWe9hCxLg8WiAokTXwKMiYx3rOUY95A/3RDYMCPOjWJgVyyrzRj8peDYDgvZD9UZGnFIHOGE6qV8rTOQABibBt8CQpMaj0oGRMBAKTFkemZ2LUTYMj1TNFvev7LKuSLGTfCXrYw+AfkH4/RAAV4YH+aoi2OgZXYfHCPIZoPohyIa94vDoCBLTlYeiNssqK8AGfXB9YmuSujPAJNqAAcv0QEb22Bxm1RwxPIwPLkBRFVrA5Dga7I0DZisUiNQCUbm15WJTAycLZBnfAReu16Bx7wECSBSkJC04AvP0xwW6IqMK8M/cNdhF1k4TlVugS6nSt7sIk4Fiydo6psuJIq2lwgQXDi1wlK/g817lNUGBZ81ghFlcBRY0+2KKe3bqIH8W9ujokBqzNz53+TRY6W6rkskENvVZ2VSO0HvUBD9y2x7FC8MgdwaK3aeCK+IXagfSJYQG0C9MdHl7toJE7gkWrHdhAxMP3XqdXdpGDZdo+B2mb/gDxpTf7A1mJxlWr37StAeKV2xW7OnWdZsWvnEm0KPZ+26BarJfelsDX+fo6N61I5MreNbZt6YwGEgFmEBD9Oi1zGJO9F7lLrM6aAlgN4Lp14UkZEgNhPAEZbEOYD3uO+jlBMgP5NGpQGksUfk8Umg6KeSO3lyWaCnorWaaBiLWNa44vE1YFr07b/eVJGXi9Ri1hSa6xYrIT+FefePBA1lcdkBsOvGikOvtQmcN0ZAgv05YbLLBzO4upiLt7gWhOijjfkoJaZmV0hzJeug0dtAaZ/j0qk27yN4THamzKmIqHBjlJFBrdYRZP4ZgOc/qEMrZDGaikeXB62KajIPWDJNWdmneXeWcM5vTr+qT00wMwruWJYqpJjjv5UJbqgqolo5RUr56ZB6ykyBq6063rSOrLcIWYy3tVP+iQcUly7tPDGw3ZYxEYxr9NhaKW9EHC78TR6Ioaw2LzUhmNi318xHpUSVcg8p7C/t5PPHidDt9nINVp+kBtrxmDy7SNQY5GhFWZS3xx1uviIWZ7zECqZU8wPyPmpduoQRtBK5amx4/B0WoSm+kx+pUtE29CxT6v5MyTaOs4SotwOh/AzJqL0jIugx0t+OAxLqq9ZOc7KhdegSE7aj0pSGmc+XFfOiKnQNVTYlTbGcmBLlZeOK0lBpfO7FqVujxySYHz4q5tlZpkVNfxlVrpcuXegHTF3QOVaiXDHKZKOPawUagWpAqLB1JJXHC5SPlYBgr1vbIy3guU8DUdt67hSpnRthTaoaUHKuWsqWAXY9E76lAqihAUov1Si1dCdC9PM1bHcwL6yqPgMPn2dcbCIQcpSziEau3hsQCZVjzKV75+pj9RR51d7yge68gLqlU4JVSq1R8llOfRCtBVOSMIsVbaoVp9VfQlIZa/lNmZVfCy1nxUDnmWJcoazQVhyGoswx+9xT8sYnoOcl66V6muQzVeh9L+1JSzatY9OZijB7WKZMfv/0bZrioyuZWySUXmyby2f5Xvr+RU5dJ7lxSiswH572WfkjKVa2pU6baj5C9hX48RCeMr3XFkkuXvFDRAXWPqg0pZzBaosQRKSPaw5QzkGFCmlQ7JToNLl2xeZBEpyyCMpCc1U4V7DP/ibUvXcDHqrrUyfVDU3qCCpML2hU33GF75vhKPE8Vim7L4enRWfh8ncfUss2spZsBPFfcUK5z+PI3di5o1KVfpTqZUp79Qgmid/1TBtRe6h+JkQ/t2gAq63DxNYJ1RvEuq9MMIyXkU9Ou4Ygf5kj23hTkElOsDS0U36JDqE091uHtVbEcyEInXibuV8u5EINJW2ziGIqRc4SGopBUaMZ5Cf+l+Za8HIpVFF062D4xUZ7gcx8hXnm3v1yQJ53ls6Ba+li3VgWuItvMeAGWsTI0ShEX66KTBQxTd3iEzHGG/9O7aFKtMN2hKoemmB8CXGh7j9fu7t3eiwTFeg8PRNZki4LVUH6CUCpjOVV4xHbrEFceo4H5VQz2SooT64Sf59UDB9Krf+Bo6eYLNdia4DREly40ZCtQyawDhtHjg7NSEZU2ZotUHBNNiy/bMtnpYtAaAL9VYkXRdPIoaq3UaXn7rxLtSA38tGDTqc0VXNQAfUQ9YL20MHZeY0aYxlF2bqVWWysE4KEY+JHfsVsfwy53Cb2oTRaUD1pUd7Fn5kZAa3aA0CTh8dF2YvcQURChwtNpweN0R+yuYroF8CQs2wOGG7Aj5pdmzM+UAb2LDcmAt7Qj5yi1u95iaV+i7TGywJptwn8iUL4PhxTrGAztYDAiLkDSR4IHsSAFMBjdVQj08OWJRGG1lbO+QVocmRwq69DhFSTZWXAsiEZD8BC2xKOSnyYEDDE3xkg4nxFGy+19JhGcPDnBytHJoRoMpUi2YHKWqgGapmOLUocmRYmHmZRz2IakO7UVfHuV2Hu4ocZWZf9TiYJhlJDoHNCwriEVsi5I34mC4sHhJR/Drmy0sUgc4BCuIRaoFwzA4WJw6NOXRxLLdJp4XTf9MV+cgsta2RlmNEK+9ZVde61RGI1miSTUIvFX10F70bLflCW9LrdZs8O6hvdz15CS+F11PBiYXJanE6RNOlLelPgwgARY7zJXu5Tk0IDAGBIMBkWIAD38wJCEU6uCYBzg+74CFUNqJIw7JOg3lObQoQA5Ext72aRAxU3vEJAVmchywSMGZG/mBSqgr02PQgMAYlFD/rkeghCbWZO/yk6UIHDocGA+kNinZIpFMlaSl+rrOYImfByRalPMcoMHI5MZlmNfDlOM7Rz0Y4Li8jXN5Ei0K3DeQpyAQNXOKQXPcHIVIDwvAhx1iRCmVIRCsZJqM8tKlcsCB8bjfQ9f2Bn0FmjS4vo6QAs9WDdtHhwPjUYTpZr9DsBw9IBgTmeNmAyaCR8ym6qaArkcPaqaApvht3pbcMhtxEd0wm57zSFMRiUd8as4jT0IoYtQpHmhG/ghOYiYmTUYoGd70TEyaQ4siNxOTp0HEln8mZ2LSLBoQMAO0ZjrEgs8MpYk0IOCZoTSBUsKylxhWtJSxonROGW2gy+19Eh2O1BwZg0eDI8MDb7Q9xpOZu0vTkbRhSEOu5IjLZ93SJFoUqbm76Ar9IQ2L6DI9cDmgTJpbnDBTe+DbRZc/oIFmoHX6GXhDmmYk5cQ1GGCXaZqShO/UIEDHx2k+8IHyABCQ3T5FJnXAhFNrLlfj8ToAypKS8bjOcZPzvnrpoPDKbhIUgxxiGZ7DVrGKC9xdHZo1yDp1T+820csAUNJO4lGS2O3rWTY8PvCtpqHtwGM0N3QEeqb5iFK9GBVoKrgQ61PZjuygdz2SIL0n6yopg3Kf51kxD+cEmvCxpBOVG3ekwigiCa0lidA0ddGu+mW1Ola7Pcd0Trh0yJ0DdJbu4pxFat5BYwfB1RrJRtAqL8Pr1NSUYCR9qk3KTjXvymR5lSZkLxkeCyfAGGHxVvNnaleL9dewgJ0MmF2CjRGfEiofKasRtogGPVmyxEkQkiVId3IkCbfgUQTNgSPAeiQMi3oaQqNEQbg30pDIk2hNjQ/9E3bOHqTCUKZ8i39You0c5MgT/jUPvyxhG3uSkJpLuYWd/gO1k0aYvC1n42tUPOcVNCGUmDkfikPyTZbjP5b3+4vS2Y6nSv23NsbsQZZkTdMBNQiBF5uFWPcESVKmA+kylHuCZCnT8XMhzj1J8mNGnd0gVT555M16LE6W/jbUlynzviR50obtLEa7J0ueuK0bixHvyZIk/rCUNXlAsyYk4h7WMrRHwlD9oiWGyqE4XL9oAf5jeTjl/xgme7KMqzIUd73A221xHK9LM4brIn6ceY3zFBDGWlazKlfsYBcZTtbNQcWBu90KQuoVtQSZlC1i9EfycLWQyiYH0gOSUu6kJtSbag5KB2uSk92a7KIYe5FuQp8zcnFMV1yx5PTASBbzNTmShVMnTVXf7+OkinfBF/K8SJWcEIuqEwXtO/DLaXUsGF0vauljqfSqUL2GglH1Ckm4XlCbVhyqDuiL4GdVwFkEH2Ly4J7VHnvX6qweA5mo2kT8qMOCqhwE4ujBN0PzsKCyl9fprHBl+m2h4Y7ktdsKx0US1G0pG3dGtDLdFrJ9pyXja7b8UHteOo6GWR7+bb/0kDUpFFWf5SvrpGAV9bSc2T8lV4VWSxnEaakvf1NvfLejDIVBTlYGj6W8Y4msin1ZkXVQVlkBjdc5pz744egyXF0SLtzQRCvnZJEcr36oLIuTEhWut6jW54xc3PWwDeFTBvUanZCJP/ddoGpG4lTMtZbT4iBQ5frKcvocC1a5HrasXrg76UerIMsp00hD9YVYIBNW5YtY5ymZqNpUz/ky48xYHv78b9GKOSkYX6/FqmhS6Mvbc21P+lx/wzU4cMGcFnWgXSrbgRj5nbADHo8FvRD3ThaqAvgz7XMqIM6v+7DNfZCltOiJQ1UDezH4nA5oq799UHWrUudUUbAkNYbfhrs11QP1YMgllfoyURVSsut1ThvcLa8+clhVpKwWbW0jkTj+SguehnFynz2p1OWUvJe/PHjGe0D07g7l1aZSH4hBbb5rsol3uM7pGfp9cahqoHvY55TAmwEd+VYLadDKwjUdKpYIx1qcFIhaF91qOT8ptVClHAnFrZ0WfrHa6QvEnTBsSfRFJqsMoHLGMnEVWlYVRUqgr0efVQJvMXpqXrWQFj1x+NO4hXTYCqd4nKGAuk2Bc6oo2BE4OaVaUKW+TEXTuIW0GQhUNo1bSJmRSDXTuKUG+568l7fezCKAZVUWZUlzk+rq687xmFFQhLQi0MOojKQcrp2ckY7QEFs4dRcCTuh1QjDGUYihROTdnHnVhGQmpgppEXVOCH6BBoMdQyFRkJUXo/qeBUJZZepxQa2mHm7v8E1PEsoBogYvuA8LWuHVkjoMZb7AVlYfxvuNKrN8IzuKqMgOw+Eddqx+C+LskSAfFenKq451wTmvxuJEm+05Hcp6FWMDTWEO0mQkFFUfUjzGEalvNS6n0EiqCo0UOfDzFJN05efoB801IqWXQG4SUX1UhVGYo5ZcSIU52sUV8nmfOWo1QlXoo2aja55acrtfs7SDZ0yR00wow8pcrbA3ks7rAt5Kgl4imAppLeI/XS5A7knUK/4qy7FmvpoWqrw4X0j03iPdUZcJDgXeTkGPpSHMcniXZpXJlsGQr8JNqjCShqXCwUsLkNehTmgxFoiriKKjORe0wT+dM3TIFq2aTh6uGiywypJqdPJw1ejvTCyozVgsslLcKVlWoZ5IJGV6U+gF9BhKW/IcGzgThlI36lBM7VCFf8ShXxdtWoPWozon/yV5VvMSEOHmgOGL8KIJYIowToIkvoclfxFeXDxuUIwAqPVwdVct/8PkpUMU6K2TrIJ0A0tyeZZZiyrNrs6lHpCiyNjRnzXweN55stNCpLnDT3Wepwu5GjXNUOrI43mSsMONI57I3Ua6zyjoMCi9RX1XUdFPlHQSpB6iqnuA+obMNl27mS2zRXefiLtWJywOhcIozVarFcVbjbAlXXBlNGEcEe6KEEI8zdBtC6sSD4iohXSAXU1LwqhZ9dyliMtX99f0fl9i1TQHQy0ojrg6wseoWlVkoUzl6/K3r+EjmunlYKjFwxFXR/gYdamKLJQpwn5DvCZfw+QLVnW2eKiF1IKupqRg1Kta1hKUFzo1FW3jXMYVI5vCNOTXyzjM04PxhLZkxoueaReUOYniTQw77zH2mingipNddZRXJ6WhbEMvqAiOFldf4TvRxsJ9lT0QsXWzEQQtOV5GBUlIWEqPhC1cWwNm8BBFLfhtKF/LjcqrEe/VRcEvzk7lyf4hlqo7rjA7XhFEYZLch9EXNK90iIoylHB1VxPoq9NCUc6yL6/OSalLekMHCutUPEjpuXZB8UB7ZpeKkOKupgTJ3+MaQqqo/knuV6txwJLU5aJrQZXU/cHTPCUSsxV0uCqawgVVUC4mHuPiLfMKKqQ4jtyJtj6kErLt2ybMLe4YOIRGbPpnpJz7Db0nUPR98Qi8VoigWiccW6temeF1CmitYXf6puDQO71w1WHGuplqGFdU7eo2rQrvEwIxZyeWIkzcpYiW5vo+DfLsKy1LUlXx7iFIwzxnf3P+ga6xB/76UWFV1gXVTfvNowcEKCIdtAfIf//yi+j9lYvo3csvonfXLqLfQxldsZCsl2+NrCtbI+vlWyPrytbIevnWyLqyNbJ+B9bIurI1Ml6+b2Rc2TcyXr5vZFzZNzJevm9kXNk3Mn4HvpEh4xthpdyaUkl9mZ2We71tO+ititM/jOfl27BYfw3PXKo5Piaa0VdEr2bMvYZ73Ba4uCDexULBuVq1Vvz1Njz5EGvWmdwTfKKMBcVMgoc8zrB4jTHP85vXfqBheC7oLdIbRyo3IQaP4GRqg9coEqUWS6r0Ra871UlyRDtVfV1sX/BrvEHGs2Z/nRc2UPKe/HFFRJnQ6n1XA016oGlV2v7RgKs+RC8Wo2q6DCCt8HwZNK2zAUcrA/VDCxtI5w8r1TamvS8Pi+pZtB+k92RdJfMWqacPHxWXZJ6peMFwmKxUVj1lVw37VUNkJRzgcsyn3OkUuRS6U3yZVR9VitvXIq7wuXWoYG5RlKKyavDgfLYh/S/PEqF8TZdpDWAl2RmaAm41KJgZU003NRuVWR8UXmbCOcQulxggUdiI1X2SsaQB+NzGwJLlFnwtwlxB4XW4cH5N5no8Yg0gmBGJcEuqwZPhAzjiMYcW6PDGSXbBjnxVxLCFlmC5Fsp6N4PbWjC13TGjUugU5hxKpeBxyxGnB+RR/EFyFE/XqHRqODCb7Zf1BpVPCyjRhn7Nwy+4/mAPU6LecB2IBg8+SscPuz1u0z5ASrKic1OxJIkzqXW4svzSDLcXDmER2AVFiDvuHEPDe6h40tjLPRSSGXaaV0Bdc6Hj4HPJdcBwv7AqgnVxL5QN9bJv2AOFjwPUwcSnNkCFR63ZhjoqrRZQhpFhO9icGkgZVrZuYLNqIOFtPtuVVcgyu8cp7phwhAzmWG0LEq4F0xRf5DdAha9eNHuXuKsXPVBpZsK53GfTA2RuH3MsQwX0eqDwlc+EjsiiSWwur3z2UeF+yC5I90J7epf9jw4SziosiWOBMoJepneMjeIDo3Ic4sryU1OOx9gYvroCig0slq+uhmELjcSS1stjWMZiEVYE6Q5koKxBK2qppyRI7IDwZLt1ajrxyLEzNkMm8VFW0VF5DnElPEcWOg+XWgeJ488GcZrjNstpeCy2KjrSaREy82RcipVgEpYRnzW53z+oKb1jaKldiy4be5jgOpZT4JJMFQxFY2CctSRUhiNgMMMkzcSyNV2k1iFKrJGzJFWopA6QMqzQx7geJpxXXgYKxrghrBQ7HvEXnVyHKsWNra2I5fWaRe4AK8WuKgRzL84i16HC10PCNfN7UZn1MOG8vqgZXke4MvzQbUgPU4JXfc4Nl1eHKb3upqhWp9DhMb8pGvVogi1JclLgjqkT2FI8lRTnGBi+A1EmQe3QqijLSXQprlESYy/ADmHl2PF5dLmnfbFUU/FnpUhxT2OxxK+zqLagUswoqG6qmX1MwyOw/UKe8bvSEBrM8snWfDWt8whZajRq183qvom9HXSEjsBVEUkkdkFIPWVV5dhio9Q4/kHmSXQMrvXFH+4WsgEu2GUBT8qIe5p4rkAMjcokq5q8f6nCjjchBoV9lRUUUhnrAzwGW+xD3sfQGCw3G+RjyxPYGDy3YamMZ4uNwRP7rsExNAZL9DO9E9gYPAvkA+zH0Ch2SZ1JQitJPoZjz/pH2Ij+gSKmB3QUrthnSiawsXiqWNs+LUKB96WK+YQYtb7jMnoMBWL5M4q4N9Bo/owimi02mj+jiGeLjcFTydLMCXwUvsjbsMfQWF6iIpYNNJqXqIhmi43iJYa7dZbin/45LQLLt1XFVnKPfuiBKiJZotX/eLlBFeFjMZirGqpYH+AXCNCT7NenY5XNgBCJFXOmeEOxiHQny7PRqPscosSxD4sYp+sf0WuAZfmVO10NvwYYgR/eRvsUScCW+yTT+iKDEpoHaFmO9T1jJRw7aFmO/VglSpiOBMjy3ccJi1W3ydSwHcBLco3oX0miyCL1wWV5RmoaaYMry66NjaSEYg8chSePL6WOaQsvzZVfscC7u3HMdihAlq86+4RmmSKsqecRQ+GJ5zS/LM3D6sa4fVLDcgAvzZU1nCBc/7ovqyAhD2H03G7rqyF/Vp4KbTYFnfVinSKfpU9fIqpGbE7EwWtBC2g0IRFdo3Kf82Dhy2o1IRVVs7LEWck5r0kjBZU5Oya1APVWDA53xR0crTf3AkwoojuUIMu4jQWjhGwPXJInP8arhGSHLM1QzXrOGmU9Z71VMzNpcCXZ8TiCKui1wPL8FJmfDlma4a9oWyHHHH8V3wo5wRJnf/aYoeDm7DS7JqSYEoYHbFmWaFfsjjiKX7ObZPigaBXkAWUVhMebVEGvBZbl14VAU0Kyjy7JNEnVjHgNriS7Bk3l2syxCFnOOOffjngKHn07wc1WRM7GYEfSrHgO7vebDSmCMEkyNUtIJ+RIst/RaWqZRV8I0smQMesRvizbmM7uvuBEMDpiesCWZJnFajpTgyvJLidqxsgGV5Ydzn3vI3KCV75PcItK3VDEr4VG4KjGWnbICAxdZQxdDIZtxEklJHvgSDzVrfkcScBizENSKmXcSpBl3OZOUUK2By7Ls4gfw4oEYRSRUs1QfixClnMbm1QJ2x64JM8ipmPbWnfUbF8P0GWZKlorEj4yOcmOx7JWQa8FlufH4lorYthAy3M0VTE0cfjZinykA7QsR0X7Zzg7ZjzQRRht1YzoA3QMpr2QHOoIj4Rg8M6yL7HCIu7gEbhWMZs/K+N6gJfkeggir4LqAF2WaZwqo9lBS3J8pC0+RrqTOCbZw5ZkqWxHH2kPnwdmiQo1Br8PjsNTTS/vg6PwLNVsA/XBBS6PzL+U0ao0uldB5wqydyoUHGyjrFZ459eay+j1AZlwz+6V7sL7hOAuVR44nxKFqkdzhGZNcrJbk10UIzshx+qckKhCqy/kmdKKi6B6zpfS61imCs3K5122e0bewzupU1/ay7y5wKjj3lqoy4FhVvGOhR7IsxLdRe+V+LQkXC3ygrpWVfyoXouhJFwtWA+jgw9bSsP27iY0OZaGo019UlwV+wM6Flv0jfgBW6wbEoNYFYghSSZIHwlB5r6ryFNVLmB5zktUo9UyffiyVDXaqbez5yXiaEWBC9zF8J4CHTgOVwW3E3pk8W4hNMEpVGyP9vgi7pB2wRSaJqeK8kAAEuf4N3UdsANH4loV+0iZN3BAx2GrdDqFPG96DJO9OrIHdCWrLbMenffQeMWGNomyIuubTVykX8OC3KSzFnAmgnJUpNiEkVRYDvHIHieAIOtQk62nCWuC4UMel/SqK7RBmzqWKdoFJlWJd9QzYHmcKurSVfIO12x9TghGUQohmP9sPSAR/s9R70cPx7D88xU5IRlFLfm7DbP1AF92ONE/mkRnjXyUiEkCneS0dOERUHQdf7I8eHAn+fn+3BLAm/1XmzQI81g9654gBMrtlI5s5NyU2dRHAq/nubRFMhrEk/hexpnYxFt5R6IsIhxHgrKRit48Uau0fFYUdkU5rhr4xSzFseOGV0zIjb8tJspx1cArLyb5nVTyVMm33r9F91kBrhi0rjBZ0zEhxLXlgpadqG1adiuuOu8aPUFAPwHYSZD6Ftt+K8XnRMvUYk2OhYDerUNaL21sA/QhrK3XWiCv2LOyYVV9TkeEgwlCesFPLFzWRfqwuJAm0NPjl/WgZOjnSjZuu5A2Q5kv26Qs5Km1C80y7hrKgFeFxQMRxzmBVsZJTI1KEt6LR4o9C7wF2/Mh7HCpKollU4RM9IO2auvOwIt31SuX1ZZ1jk6yVA+H9Qmpl6/g2MHXOI9mjNswUTJd7Oq8P1vsC0OY7TI4lP0vEf6wDbGFjGhJon1Bgs1XGSvKyiRmK6yQ2NYjrNoBwZnXdWkY4iooE2wj1RXd6qB/s8q5OpaMuXpbRw9YXp1OLqYyX8jzFVRppKLWimyWSmClCCewnKFK+ZxSb7OQzAYJVGggHHXXQz4/J0wlSOrOy+pIpw2EKSOeUXCWEegfjrqKPRgRwFYPKTMpXD1oztLL6snmhYTpJJwy8rIixe7hCoo0UjEVkc6BCdNEPD3mGVWY/8xOv3S+FHersd32c1qdZoCmYDvm4e8cXlJsKBlboSbaxJWU6km/3ubU9NY6zsyG6RpXZVCQvwXp7gH96MNkOZ9SaTXF5new21XmImuHJ+sZtrJyslqbQHGsltDXWA7VSnUfLFSMpb6k6sM4iHjp5xOrsMGMZdipd+lbPG0s7FhjUxm1wyaylXp0340HG8yzLKnn7iHtsMJuQb8oVj3dVkOaq5PSBBa95vAX7RNy/Gf2BaVtdOKHqa9GwYRIuE7JbbqeV1x5kf1KomrVe62v9x8bY/ExrLbdu0zgd6ttlpIVKejEImQGiJRx2fwVfC1XRfUb+19Axw92l/iB7FbkKc+KCh+/Pss1H36seskyYMZRXD0HtPEEhmbYt86tcVjZ/YE8xhFZ3dUN6h1rT29+/GQaP/7FMFdv24EAX259JnfFz7ugoW/DYs2GhdV9Rv+FDN5Rv8+yKslCZt6Uoq+oH6tYArcZmyQstyoE1RdQqBGqKvSq7oSUpOAtOOIZ4VrDt6gwfhQEX9jr93dv71avWRXhd8SuqzSVVBuafcHXioKMXYYrv2aqyrERytNNqK6rNbdwS7WMRhrbJVEliqTr4nG1TkP210IyVqURlPEDHa5KdeKUjAk9GewoitoG/ZDHyvpMXUZMAp+0FvtcWQvLScFX96lzori7bDdP2VJdsyu26wlUNFKc1XAVsvNECoVmZUU97FRdadIJPv15xYPYpXm2I7uKfWgzDpT7nHnHzRD2AihQYFISJe76bCa4lXHpCucSoppc6Sqb8mj2rNg8jKQptg1pvlc7Mu0eU3MBCVfo5exSVTPAK+5Wc64cqVC9COnz9M84CZiTVDtiCwii71VZlCWr+2QJvTpx7CqDpxm6bS0p9Wt6v1fiPp8S+NvX8HGR9rKN8xXZFKZR//n0YDwtqWcZr8nXMPmyhMxk/xDv6s+s+wZRmCT3YfRlkYodC6cTtGuIbQt+QSusagIvspy+sOXv3bdbWPL43K9Kv4T5rmGsfHmwFaPIy5ruMVRor9Pwm9lNnOMFrcWYRMUCn15dfjdQmIvUehKUz7SVp00gv/ie9nja9pU3OkJylqhG4VzilM/amOjm+Ii62cW0/Jg6zSQKslLlEtIJ1blB+41+5Ksf6nzZmQTqAwpXItAsSKBzAN0gvpL8w81DhQQW1u3MobGrMemdv3kJpXH6tJo6g0+BklDZsFKvglBlTowoaRgV2Q9kw+NEZezb5tzE3bvg86ef7z7/nw8/vQk+vvn09uNf33x69S549dfvP7364e2H4I6fnuDB1+jjuizu6/c/Y0P+8PqH19iYb/Bpvvn57tWnzxo27I93n16j19JfPuLX/F9//NcP6Nr/9cPd5/ev3r77/sO/YkO/++H9q3/9/tUnFbjomD8qaATvaIVhY76/Q++qHz/dYUPevVHUpu7wzcrdv929/vEvClA/fQZX1ecf3wevP/3bx88fgtcffnodfKDIwU8/vx+gGXPRukNn32u69qOtG2/fW56Agq8//PCG/vH+I9Xxp89Mtc9vhlTqCaAA5KuPH2m7Y2p9fvvmbu6Lf3316Yd/efXpTfD9B/qv4Ic3P776+d3n4NOPwfevfvoh8JzZWo2Q7n7++PHDp893gdGCQTl1SIikWihft2dDMdPz46c3/++gmkxf4/8nUFE1lZ9evX8zQPp//rbPqv/1/acfDEfTXtWfhFE/vfnnCdBXmimMN2qhr999eP1PwftXP736y5tPAxGDw2VCAjrsV59fvfvwF9p639zRz3CSP7z557ev+zZjQLQ563Q4LSIh6P2rHz4NS7o+fCQA+U9vP59qBMyw3PzwT7CGwHBPNQNDthkwJ2yAzA74wOH++oq3g/cffhqAspgNkwshgtBHbBmwPON6IDoCpha7qEQmOSPotz99fvPp088fP092s6PDMnMF8XOZwU+0ZwT//PbT559Zr4C+Gfz1zasf6Lj549t3U+02StmR8B3tZsFjXFT7MLndirW499+/+eHzuzs2RP/49i8TcpLqf/WOj3QrR10U0T+LSvp496rnF5wUyiOVDtOVzBZFq/oT9d2Cd2+/D97T0fUtHaY/f3j94V07Hg2kiQwlYzfizWTTOexGzYX+/ucff6TV/PED5fjqHTX9rz5/+BT8TPHZv9+1JVW3BrCXNx5iPnwalnt9fUesjE3qB70FM+IQP3+mf3x8dUbJphWON0tgraIV9/nV9+/e3AlKrXcnQMLHbefdmzcfP799P2473Z7AfOi3AV+meUW1oe7Sz2/psE7b5d0/vf3pLzL83gZdv6k77IhoPN5FgAv7ePeGzhDuRg5Et0cAmslQyJ9ZA59fisw0vaXO6pufuL5vfhCa69Tt6O5dI5hZn0+vPv3bbIz/Q1/8xP2pBkrQPWMkPr6ik5HPbz/81NXY4N3mjNyP9a0pnG289ooTx6bfFSQhYUm6z91GXvAQRe2vt+NzCUNmjUb0hTmPzXpoPLObfGiXUZ9i9GCVZcmHvClq9uEtu1N2+PZ2H92yT9E2jHe8+Wb8+3OP3Ub5fmx5K/J0k5rj7U4l0jcj6Zv80b4p80VEJ1lYBeF9PPLmivHluznS2aYWrb/ivPD2qdtmGyDK1mQgnTo142FvjnR+v/CC7PqZ5q+7iE6EqoHov2t73aEXsSfZLcDbZIEi2ex3Eb/RQ8umiWYmXzCCHNZhFaLKF6iYXbij/iWzY9fQPEvjKtiwKKdBXt/auAKJHUsOFpH8WtVP5RdVFS9c8bSvkSKsSG9Gw8PgD0k0vzSGoxkybsd+jiJq78Ocj07LV0nUxXoeDlL6eBlQheynpxPS/+f/1F318r+GxS7ePZS3YZJcoeg78Txh3zUJ5GQd7qo4GnoK9VX65SqBdjuefaa8Bg32RBr/xu+8Duc+8W9LDIzs+muQkEcybIlrsgn3yfj+0DSBNPxCuDcRFukt9adv28jNQwYnHjvyU29S+s2fBL1VSQ7Vdp/ej1g036kXPnaVb1L6zZ8ah/lmrTuLkJh0mikV9v0N/f5Psx3oIxEHw3uRzeHRUyPETVmt/zR3mDiDn+cCZPL89KBRE5o9ciBTmnJtbja77Kb+9iqETvh6nFb/t+XaUueKnZqfUaOTzjT3iOW1EC2RkmqHxWDsm9z8C/9m2QJSywZULsdO082/NN9dqWyUMRIpn5N+zM0H6Z4uWjIquYiUyelVh5sN++3m8NuyBbQYMZHSOr9OdLNpf79aqS1OUKj/nV/nudmwB274AzfdAwt3y+UpCvXWE1Ohm/FNb/XdE5nJ9MLQicdOLyTD148lGfEV1KP10xs6OyJR+Sf26y3/5xJcOpet/hykYT5k9a8N3i9/uHkf5n/6u7//8PPnjz9/Dn54++kfVn/39x8/ffjfb15/ZoeE/uGWv6yeM9mxHeXeMmSjxNHw2ON+wxzPG75PB5wEi3EcrJEGbK9suIkxKEbJZdN6O/I2XpPbZm9kzLI5VpblwwLi+4ybB8O813RtY+tGnB6dEJUrnbicSunHQd/FZdUBHzy95Nubm68FbWnUtBIS8MrrfZnymJtHX0fTXxek/X6glACLwzVHtnl8/C0t8IiU1KGP6uYnJIZNIJPxGYB55B6iU8Py6lBjAvW4zcrq/1bkiYoUK1M69t3WN955lyxj06jHxHV1W59xWt/v42TNt3hvH3b7285q3IdN1NVe0ffgDs/e1g/QAWuThA9TsYf/f1I1KvsYfZNNSm+Kr0+0sz2wnBhSnQ3QMKj3JNA0mqfbxvF/m8bvpmmcdKARDDHlGj/ssoKsb/62D5N4E5OiFFWagrBglTf8sv/4yKOikr7kEEuOdP+9ihi1sCBDWDflmzWIDTYMqa1ihX6bVVtSJFS931/xK2nhF9+fDJt/jmVKjSWtvZuE7B6q7Z/G57gXGM6Emkn/+f/bUH6vDSUO6Zz9a87HtlNG9+0btsL/od1KEyqbdRw+8CidBSVNf/kYat74lqQwYUaWfdEcPm1b4aN9a93qY/ZnXmiabbhe87PHYfJzSYoXoueR1xGWJUnvUcbEJ/qhg7v5GlfbG75w+BLnVaJwUVxE+yQs1iQnuzXZRc+wU0cvR6MddYrWR0uS888MyUxtENQ4TJMEquaP7fl9/ukPf/zHpzRhj9bhxOjD+q3GX6Yo2TrePdCvfv784433yzf/WAO0q23dYfh9dJtm6z3tUSWp9mzlmx87uiNVxc9msRQk5S0/o09foq/npKie7yL6N327W7xbqWP0ml9Z/Fg/9pHW+ve8KGcS6zeEUR4ZDlAmeX3siFUQVbkrcfpVu9K8nu4hOeXCq/WuIvmf/+7v2d3KkNZg8Q+MUPsj/Xd9We/v/r4hxRahm3/+RKn8A+fQXOhj6750iKZfV3wVmEME67j4rgXh39Av/qH+gjaJAY2Fmgm0OhS2k33UkAI1jVGmqmanZWoAGT9Kq48flKpOJ8UatbzbqIjay2VREcGaXzsenc+gtEBTCPMw+hLw+0Kva51eevn3GCurhWmT04rs7f8ESfZw+2vZbARBCYzlsJi0jWqKcLdAqznRYOfExeoaxNRI+M233zS7esGnDx8+f/PdN//5yzef3rx79fntP78J+j/98s13lOQ3/0XfuHv7/uO7t6/ffv634O7zzywA1vsPP/z87s0dff3f/5MlaeOqvXni5Kib8d2//8e3LP1Ymj2SNf3IfY1vuwfvsn0R1c8ddmoPjXN1otV9e3j4QvMYPDmo4BO/0CpijOveyjVve/N379/zL/9AzcGu/K759k+0LL/ZVlX+3Wr19evX1qWh49qqLFetdSX8AjF98lD5vzQ1zb6M1/yziJVgr+XrdIDzZ2aumqbBY6X+IQ8rFsuNP3X7P9ifrCkcWkKr0595eTTcqNYM8b++na5Q5rrVsRGTIM++8t1kfqW7V4Tf9h/qXRMePM7WekfFPq+hNNBhngeNoYx7N4/70u+rJOjiwAfR5tLPQWlE5uiZqUyAk8LquBunSoFnVmM/VkWWnHpoEMEkyMooTpKT8o6er9ha/qkns+Lkb/XJjfJrdvqBLjdTsI7W0ZznSLo/9Rj3lulTv9ZbmwE7o03YqcDjGqJP9zPdnEJsU6kEZF+GRRU80v536tlhaOqZTxXkgTE98bBgN+gin19+lLapyw/x8o53ZTWjB86AO77MD+vQp97prsZPP8mvWZOgTn4X3Fc7bd6Tpx7qwgZMPtEEhXyJ5n8fvSir346WR+19Sydwzbk18cH+0+c3wes2BG/Z1M0hOWjIavjmC3m+CUl5E0XpbfVUTT3Dk6wxE0Kfvc1ZuLIzz+T7+6nHRkfEvh3oTEebJI5q/6J6zsmIamfhm8UA3hlGfkY/2jA1AlXI/JQjGPLIfu4V6rmfj97uLGH9RHkMcPTEaYzakNcmldmXcBedRZx+/gL+mQdPtrPhYxOW9dxD0zUz+v2Iy9DYnCmNUw8OEVmXrk+BNSNN88MLs0CfScrCW5AXYYPErQsr0IOL+IJKthHxnlQhO7r+IoqX3d6UzW9y5A9c8hea/nMNydt5ktsQ1QOEOkD9CBYfsXbNMXBjTKpl0aYHmPJ+2fdzq1Ucn6SWPDh3CoMky/LjSlQJ3tSnUhE8AKCBLGPUfKgTHz+yYUFo3s5CzNOZdnX2JPS3g2z1Z1Q4zll+NM2+0MrPIcywEKPX6zIbzfNZiMcLVXEOZoaFnJ+PuvY/y7lancdraDK8mS3tOCv3qo7S2G2iz7RJJ4HY9qEsRrPKL4PDV1pS05TASPN9EBbpoyeBQT0K1grJ0+yR7ge+fLO6q5N6vWM5vbro0h1sd5sgCKM0VwVNLjVTKPI9bcmpOuxqdgsUxI7SvSJktqCnCpo+vttkqtDTkEoo+ZWvbLb1EBWSJ5eGESg0UVal9RRcEfiGmn5VVfqQR4WqxsiHYnXQAcserQh/u1FX5Gx5XRF0bKiqyzhUZrPiKIy2RBH4F/JcRuFs70IQPYnW6pCLjSpsascVQj/dh6rGhhaerfnGO2UuS0JKsitVNcmE8A0QVegKLVeiznKlYZzcZ0+q0PNwe6/ODU1LVbYxj3aqhrh8kz7luTIjkxeqeidF5vtKYaJKAvVwwyra5qEq614Ste29VObolnQ43cxeHxUHVzefU2l09yqtrsqpxeM6VFXeX9eZonbSj6qAKyFtDtSgojZXajv6KOD1Mu+qrGjb2Oc98Jlrg7PAx8RnYt9nWZVk4ZoUqzCPV/19/MPW4NxSGIGxA2Q8CiuLgSeB0R1CAyo1xEDgEeyoE4HAhaWeLecburNQTRpaFFotFpxXQb1ydnhh/vLWAKR/dHH0EaAgW3PmrNheJ4APf3+ThOX2UE4sAzD/CsrnJN5Mfs0OYLNzwW6ZzR94Ru9WWRrPHlmG797P3ykevshMQhBRhct40xgcKBDfUYW+K7S3Mn67mN1Fhm+S3X729Gb4Zsku/AJfrcJqP9uUj99dz18eHL9axLvZzsXg3RihlTQ7cU3/mNlXh+82h4NZ7OoUhlDXGuxVXvLAV3nJw95lK3FJMtvaNtuh9bGuzjjwT3MrbBJicFwMhtRuGdcQIH3aQhmQEUPiRxtarboj5YIa1SANmwOIGBO2HN8SEVn177/eUJixfz/KMt/r30TEK6zfru8Q8Lfrf4JfL412WaK9mCC4SjFAZMXREBIqDVZ+Xb5IzmvwjRiXIRijNAQTYrZ7TM3mcAP/9/B0uAgI04r9Q+LVQGjTYQqgOXYsA8EvUM13k6YgtuFs7/PE62Iu4hQIuxIj8352z891SiDkAjOLqferQmAWNwXAZgGC/ZwDsC7FW7J4T2pfbVqyBMBWdN4xBcIbgcT7TSOQQMgFpqpT79d1KATQ3GXh7aD5t1gjaAEYiRZgNgN2LJePeqngXG3wqtAZmtGbAk2+9160jWcfYxq+OH9Ze/wen5eFsBISmw6OXp0/nzt6UXx86AEInHUZvie03DzxqkxJi/iOgxdFtrSHL4ptxg7eFdj2G78nU0gCO2uD94owZaHnQe/O3wwfvgZshGK7TONXKzJ7JWTiValeB29M8G4neIB28K7IJs3hRbaMAjHHbJTrRhyhYa55k0mEvEeg79W1AnlVbB7be5GbMtCLBOA/NO+m8zcfBu8xWwR5rxTw1Pqv1Z0b8iq8bOBtgPeumS/m1ObkW1KECe9ih4+Cu+KXcARHnhEciw4QJiKe3zSAmJcxjSHiLEwjCIykJwH4wrskjFQNDzDgtdssv/UqR7zh9jBEzN80goBpmQZoShV23RGcSh4gi82H6tMNqxb2qQmRQ38JWFxStlUxt1LnoLc3NVEE1Ouv7LM8QjOTrff4+V7N7L51BnRDwmpfoEClm9nO5RkUFs9Akk1ThSgg6KXe4uIUfIsmXfYtkEzxH12E7kIgnIqMoEBOrFIQdUCPYuJg3RqfxEbi/d/xLvxFyU1sn+mIP2j6nZeyiC4YnXYiMlMzey7P/SZXjFChy2m6Lx7J4sXLhC5ZsrU8VP3qoF2dW2UePbC+T+u+X9aRilkauJz9zd8MdI098NePL5HVu3cvk9aLZPX+pbGyXmTDsl5mw7JeZMOyXmLDMl6kxTJepsUyXqTFMlRarOmvoaJaf5Bi1N/eJ7P3oc5htSwR4GJCiKcZum3VPx4+IyK3fPHAy3hNvobJl/qn9hMaaksYC/hrer8v6+/5P3HwWpYokL99DR+bVsr/iYPXUhSC5CGe6M/tcXQe/pJ+Ow58dvhGHXLAwuaxY+ICO5QAKdGWRF8EDxRCxPBlZpUCVGsgeHEeIIGwOFz5s0IJW4HzigD47u4Mix2hUA6Fp9XBw7qp7RxMEA/lKnBpAiCGn3Zmq70KZQgtUgDwRW5zzYSP+/ii6+EQGW37VSlD8Pr6RRHtbYjDiDQ7mqIo8mBEUielGSrUCWjtrDoJW4EjwQD4kf1TK6izf+rEHOyfOhncPuHCT/ZrORFJkN6TdZWUPKtiVlTttQ8mrf0pjCKSNPljJO3ILHlZuotZhkcyP6IKRFxehoupxmRVm5RdX9iViRpxzPiHhFbX/KsuQthRlKrDTsNIGTiJfs3DL0QZ/oPCgul6fKqiN3AJ21BXR38bGrajEt7WDXXw3deq4JldiIrnvJp9Pg4igef+VKVDrFIJNvC137EMJ9ij3QCf2iClAki0piVF/5T11c6LoZ1CCT41ReH8fWBR6AdFtUuhufVXA560zn3QxgZXJac1RIrge31YjYQYU8QhTxbHO4gYfi9tjmbKqfMQYnSOUwJbAX1nYElZ0gVJ674JIcDPupchF9Ut4PGsB2QtGntorry2+dVfCV4TBApBWkCaFEONWiMlJPNDH8IkoKykX5CBusA6Q5a6lj2Ulc6P2ScoIMvDv+1JwK4JViJn0GBiMBZzT4ngU+Kcjpy7Srk6fVkqdWrOttE2nZPdmuwigTB6c0T1Bu24KgORuATz4adMplohIgd9RUVUhfSS4iT2yBQrldAkDqq3u5RKQlkTvyADdVV5hixM1+mcLIxp5FkBWMvXp8Q0Rl99sx4KUtrmhqLUVVEjZ5G23R/N1FfWhDSlNTYhD2GbS0CaukbSF7ZIS5n0R2RFdZnquo0OnrBu8FObxA7ltExfJN80aK+KxUH1WxBnj0Te2z4noRSPIwyTU+cdRDyQNU9eXMk7qXPkCERjkZIjEnhOShDiAvgccWinAWeKEwrxAhKFcJhnLKAzRgfjUJ89RJTTWtiRADzD2hNQigdCFxTQpNwOY/lR6ISAY7OmVBCbGmMOcxMiWIAoxSJ4xDvFMvpnYxRL4sZEXgqb1NMOl5VdbI3eN7Jd/Cx4cE8dt5RUImLqPMIRi7w4PtI4+BIfEZTOewo2xmTaxtYeIApmZb6MCEz3PANYbKFKCBaRdHxcHBjVNoZtWYti1wlc6jv4XWjs7iuh3KszIQUiLU4hdqG3hyQBtXUBlfKEg7aVxSup7EHXtdbdRpOErz/28XsBrHhsIiRBw3qMREIYz0IUCU41C1AgtecsvEO5KoIV3QqZBB8240gkyPAsRJEwVbMAe8UqCMvSwo4Ltf+daElO4MV4gG2crT6ejMITeMAxawJ2qDfggkSN3MW9HxRrSJ+oM9nv6FPBY1xUeyzsssnk0/9BHrkp66MfAsGEJJckxAjks7IqSJh2pdF8xsIRDER4EW4vDxZjKRkj0WqbS8tKtHWcwBEMM3gRrqCTp+KBVGLpbS7C7gEcU5JmxfO4Jw+/Fa2OOZi0DB6ElnXPQMfH2BWdx7L1/ihjpxOFTdxITHsCcVgqciU9iRmsn3dhGkc8gVwhuiMiICfP5kfcEgYWPishgN80GzXQda9EAR+3SZQWeNTQgQWd77tOmQtPCNnbbQHmkGnaIMJcd0q//6UopcuIdbooDNwYkyorx24jYMQYVrfz8UlqyYOXCSF5kGRZflyJKsGb+lQqAubTX5Axaj5Bzje+BbZTayms84VxlyeO/Ru00HkKpzE0GHB5kUWkZJcoxfZxh4hl0uY8iHjY6Pg+TtjCdXsvvv5NpgjmSVCrzSH94NFvou2wE1WMWggSTttCEOBGZSqFGCO0YdpdD7mSWHV030hjxThgbTs5YAkX2mmsJmy+QEDy2ahicc5nw+IUQTyCFa2f/ZokYWcv6k9AjEbNBkNQsSmMICzSRydlEeBv787CsZMIq7LOtR4kLNk6/UD/Cnja5pFber/fbFqnP0ySLAqr7FJFIAg4X6hcQLWNizVLME6tanMfi9UMz3Lffg4vrvnOhyriS7Gh52OVOx0T62sRX3QwZgPehyVxLsV0m48WP1zOBT0fje/vzLquMx9zHyfrOZncZyNGYUqSBK+5sFvBWFDbkP5naLh4eZZcsoMCiLODp83HRG0w0eUrT/OxuAN4Y9xeil4kgMhKLgjXv+7LKkjIQxg9zzu5JydiU2QpOyWoRgg7fsgl1NLUCSn3OY9VqlRQWV5yPYDAT7bmIyPjVmlZhexeGnXA0ECrIlgX92i2Ys4ykgAYmv+x3qINAjw8Ax4WXgNpotjgwV3K7DofalYcyflwLLUNFtgDnnuw/bLeoGGxeEeYPTO5mNlsNlQXDwXVzUgvXVMXQLLRoOrpVjPN4jMsLOgd29+kDjm5eKliPmRMR7EvX7HgshitSvKLeVznQ1063SWAFJW6gYmG1u4YmIsG1qyAYOOheiId6IyrHvNB6dRKNzW8aql3I3hUwBKt2zLPGVPrIqbdba07aPPUAs9JYcHkELEM20FEu3QZTATLxrMsiBOekh0pD6MtWrflgHyBoNzHFZ7DznGz7EuMyrSK2XiLhVhtCxKuL0fing8Yp4ho85KJz4bDnB0zrCAq0Jp1g4dWszVeKT3JYGGs8FZIGRrOWtQBqV37YElyA7JjOV6knb5j9GY1RCDaDVwIuy+fh/G8APNwMeXzLts9y0+qegLa6C38plmJYU0nwIUiaUEEUB8pjav4coY+EfBoTi5sMUCMuWsPUCRyHAh3V5GnqlTTOMZClDWSsSAljYUiF9IOaw8PZzG7B4g1IetBdsF/MDHj31DrpayKfYTZibEt/KwwyCcBeT754nl1OcznZYgkftjNiD54Gajc6fSX8lJIgFlA9Ua5JFC9QT734s5luHqHXJYUR+EnLDChUHRDLqogzS4FgBJBQuMUFOFXPF4cDZUbrYbHsIwvpm67DNs/hSGrcA8Lr53sgnQvjXI5GPtliPa4BQoOP2YhjcSPV2C4kB0kSkNomsDXIswxoWR1uxwh7TKGlEN9QOlvnktT6oEFDAWVHlpHjiqwN9iDqHchJYuMnwtAU2xGhoQ5GOWlNAgzQOakDpgBI91rKUQQ7YtHed/zgBTsiPSQzNC6IO6X07DMxMMZieelXZsLE9AB5tKdQTEsSfUuJ8y4CMFPNMhidCcZJIGSNINvlbcgqbTzy04XSEPIHAzroWAM0mleSq5a9ZGkzub0gdjWCnw1o49UFZfjcV4EysP1jMAyl2G+oA2CFAqj+vMvUuffO5h2SUuyawyPAciCtdv/sjhzE9MIIM2JxCwMJ1uJBzicackxICLDJL4cqV0IEGHJZgSHZFh7qM0COuv57Ki1OuRgxxZswyqWnsHNkoGnB4IzPULD47bZyE9cxnB47GZETxeGw2OH5fX3IeX9yR4awmLHCA2PG8YsdQyHx64Id+ssRVlJ6aPKz+9HaHjc5DdkhmCIzJKsDfE1IxOKDDIi5yYpHCLXWWnmZiGiOLINDtrkoWCprZMq2JIEw41gcFjU+AlRyfJqTobKo7BTnLIooxOSeAXFwwPHCF2p5EEv2QotUntggGl8MYvDLBz6WTfRRv8DIs+RJYl2OAEq2Uj4gUNow2hyY95s4iJlGWZv0lWXCmB4zAHUWubD9ydmwNMes4WBFppmo7P4KDFbsZ6dYUVGFijHKVxggw+cnM4VA9wfnQVfbdIgzGNl2O10lWyETcSEDNrJV+SpWv0tus/qYCoxIcS1hcNEnMFm51LLOqFC/U/grXUhEfSVMCUVYMAQEsO2RtchfbfdJlUrjjtsOAI28ZbHu6F/IyIyrgxRcMyZQOxi4/CS4NEd29AzPPLMtqwT5IhPV84J6/c0Fp4IqZudxIcet5yQ0eTA2XxdsUdinoq2Gfe6Y+KAdV2gJH4ddRlR5XNKe3ohvhoIkwdbfobJgix7wSTxqGul8GwQJoz6t4sJmp+gEFEmfJECJhOwvgcTBFmsg0m6nPJYVlDPm8Jx2GYKmxc3FEMgm8p1/ZsPPKqEnpoocBosl1lB/hakuweMadGBQJkPR9QmJAID4aP2f1BJabbeJ+SXb7775Zs/5kX2K4mq796/51/+4SlNduV3zbd/+uWXX77ZVlX+3Wr19evX2zq03S2didCZ+epj/dAtYXtn7Mk/NJeK+GuUZf1lvOaf99FtLfe2JNU+v+0SdN3xjwVLKnb7EEX8nXydDkD+/Msvuz/84Y9cMXZLsvxDzuZ6RS3q9n+wP1fsoT+uRgr9mZdtQ4yqzBD/69v/7L5688TLqqQ//Tsrm4KW1yNZ04+bMCnJ4d27bF9Eh+deRBlSVyzcJ6wE6RsP5e+qEOlTnG2Z5PcvqFm+5rPsBuNjVlbfswuhv6uSfTFl+bsuxV++YZdsH8huRZtoxDe+yeo2KqJ2pYT+8wW1233Uvr9oIf/HN99+E2V5TNY/xgkpv/num3+nxU5LjRS0vNbNY/S9BuxjWG15SbU5ppOAmzA6GLOfWZKLbVisyY7as+CQpjYr4oeYjqXd6/zb5so8/UL/liOyPBnsk2u5mmnZhsMbwXw2YZ6z8M05oYM4GUVMEqNgOZZju75hCjLgcRTGCbbFRN8YumE4lmc6osLvq+SQlRZc+o5hGprr+9LSg9KITFgR6K6nm6bvOL54+R8lpYDXBCsIUzNcV5pFnShEhoyue7aha5btzSXT2j/KhnYM6pryGSO/xgmsFd/0XN/VLUuUwqfPb4LXrcNYwqS7tqkbnuPYosLJU0g9cxKU8QM3S2yqnpMUUgee7ms27Zqzm+UpDvn+XoKG6Zu655s2tChuqOybkJQ37NpY9VQBONjURLua7c3uGi0F+r/bg40GSPZ13zY1yz/uB60zMBZ9ambWLWH+wFMQru7qtdh3bC32zY+fTOPHvxjmqvYpVk0WBJ5Gc3NIoynG3fM03XZ077gDqeVe0YnnPpclb5quofuusRD5t800uGN9r+naxtaNOLU8mA11aLN1XG2xtnOkQhBGaQ7krlPeJnULrsedwEw3NZuGY2vXpH6/L7q0gILkbV/XTE23jm3+guSrCOhJOzpt75ZxPFIsRT7qkjwLjve+5dNyt7WlbOUx9V7Ka9Fi9x3DtjX9eHRcjDt9/BAES7S/GtTFcDTteuzTkGpQRkWcHzJsCM8hLMczfH3CS1pMjby7Vyjq7JqGRRvQhLO7FHcC7bee61LnTJ+YvC9GvZ+aVpC9ZXi+o5vX67ibsohg3dYwHd0yHPN6BvMhjwqYxfSoe+MatM1fkXsMK3ZqaGzLME3zutyDPIO2ed32fIP69db1Wv12A231um+ahqNNrBQtx/0J2HKoN28YvubrV+MeG2APR2crY971rHwcQr0zz/NtVzcnlrEW496PCiy6PKxR79J1HP169oYd5o7CHdTaaI7jWtYVe2wSrYGtnk1iHUe7Xoel1IsN0FAarqbp1LG8Hnnq1wMbjeU5mmeb1vGuxJLkn+5D4GzEsnXTdo0rOvQtf3YANN4Bl3Ko9XFM6t3bxtVWAYOElGRXwqwn21jSNTY1vCL9fr5VMfqm5lA3zXGvaH/gjpqluYy+f0W7D/XUDI06yBrtwNfjnoZxcp89gejbrks9Hte83oJOmofbe+gSrGH7rkWnKNdr9WkJczVvdMN1bM/x9Os1nDzaQeeFnuU4hm661xu08k36lOdAj8fQqKk0NUu7nrHPC+CWieH4lunpEwdQFqTOt6vDBKqCZdu0AqzrWZ0yohKjbR7C3H123MK3Nd27ogZExu5bhsHc5ust65TARWTT1R1L8/Tr7dOWdIYLPEB1ozu6oxnUy7yej9yktof5afT/qJd5RW8B7iCzzU7bdq5o8fdwD5nOcl22wqBb12s48K0T3dRcw7Ooy3A18o/rEOqn0QHXckzLu56P+XWdwewNLXTT0U1n8f6a8l3mCDYTt32dLecsPTYdHeMC7VY5vuZT5xKxm9bRAfj15TIJ7mPwVo7mO3TQNxDnG0NqUbYmQZSEZRlvmiOl0C7n6r7rGZj78wOqMRpX3XZt2l5Rl9yHpUpYWg0INddxPU1DHfCGzGjhEfDGIi0zjU5+MSeQ49bYC6ohuvtmmSbtxybiFOuIXB4nQE/mxrF1zXF8RAM5ZlcAd6Acx9Po9FSZiWF3dfbgo4a2QTuEjd8fWByIQ3+AHKC9sT3Tcx3Lxm9xDbnm7klRkacURpEaZU23bMypy5Aim1iFSVIC6Wl0bNMsD9NDvs+yKslY/OvRBaLRRyBjz9U9w/dsxI48YBwPb97AWBqarfuOaxiIM+5zLEdBBIVdB51tgJuYB4rPst2VEbT22X6TadiIzvmIaf9uT6+xwnbHKFmHHXhWWq48mBjzzYCrctTxdujcQS3JQ4cClaRu0sI0UA+FnW2hOUs7B/M0dNuhXpCFOWWY1fVhThvtS76J6e5OcC1ISaoAfn7aNahXTmdiaiqfDfKrDZ3VbA8Fy+JU8K9AZkrXLHbDwVA0Rp0nDFrmMzSNWirM46JjvoxpLzaZqI2iRUptAKYb9fr93du71WvGrV3MiNIyLuWmGewwhE5ntjpijzrJdJgjXXgy6dAqp2Mpot2fYFr91ubLhS7+s91q18RcHDpZoA8RbL3Td2zbMUxMAzXFkc9GUhN6Cdx26SzTNTD3ryZYpvk+CIv0EXalkLL0TdtzTcz7DiRdF4/9STEBe0s6dewtjVU2Nr3dY2pycuwfQRPKBlaGtmUYNh01ERffJzgCr7MYnsau3SN256ny48AxcPfC0ihLy5i4lo7KUeLQMu3HJnXdLMTp5RTDbQi8b+V4ju1qqMseJ/hJeD08Mojus0vkamn2cm+Jhk0xfdPTMA9MTPHL7nmkHKAb4bP7sA7m2sEUxxw6xWFhLhzHwTyhOsWvn6dNsJJtz3R9zVdMsAt5B6hjS9NN20e9O9yjyFYy+YACWhKyqMNg2jrmTvMEt8ZYgxj6mmtoPuq5oSmGW6k5643Bbk/RCYEak92x5LYQNKmm3qvpUf8V0cmeItgYQxBF3WPxjVC3YKco5tCVXt2nvdh1tIkITKgEa1sDaoaOZ3uG7WPu0/UYRnVAqbpHw4NH2Y7jep6PuQ9LUhYgnZUgSXmQB0jp2WzHwfQwjwwNeBEgL912fGqhTdwBpEeM3zYGMTNpXVqaZaJ60j1mKXCrg45qumPbmAd6BrzqgzsgahTZ0Q3UMxI1NT41T+EhTuiU16TTNjp7U8eMLw+GwCN9juYx4zYRcw6BHzuhI1V6hm87ro65bzEoPJmTL67jGXS2a6I6eT1u99DzEaZmW67uOeiGrW1x8AM57OQG29PFXUnrcSvCdLPfQddY6JzCt3VfVcHJrI0bbP3HsU3cefegVoFnhXyXe2+mMgPHlphl1s50W9dsx7IxL2gNGELj6FBinmtrmoM+oDbEJAKeaKxaXUdHXVPuUQNftzM0TbMMy8BdIBsykxlQbzxf19h5IFUmTuLaCpsMWtQC4861htyYBwcbTzXTMFzbVWV9m2PhUqvwOu2rpqWh3i3niSHoz+1xUh5Al8cXrlMaBuU+Z4F/2oki86nan8IoIgmjAN5ytT3Ntn0NM1ypjEJZuotzdjYDfKHV92g78g0NsYlDFGL5+uRrhzpKvu07mLtmUGVYppKqCHdlInHInk66bc10MRf0ZuvTHE6lvxZZ/sxj2LPULKDppkvdMc/1Meclono0XwPXZOi0T/fsq9EnPNAsbKLvW45p+5jxMYS4t9+xuNrA86Ls5BA76HJtDQ75t4QP53oWrQEf80QRSAUSralpon8CD8WZhkbbEuYuiGg/eIA2I9d2PM8xMK+2iHL/tZdXTXgg0HTd8F3E2SyoAZXbEKaAx+/wmphTN9ERgKcErnPSAi8EGA6bFl+rDlrPQkIHi8Uu8VCDtc1WobnJ1I7DEH/I1Oh8R3Mwg0MK0aeDcBBCT3Tpmm94voG6TSHEno7AYPa66bBdUQ1zL0OMPB184exd37NtD/PAmlizJ/1coaCW77KwJagndMQ02IY6vOkbGrua5DiY6yii9A3bAStgULtJOy/mmQBR+rZuwMvf8myNhXe9hu/D+D/IWB6dXeY2fe9aZpNE3G+DNx46cTQdy70W/6HnA1t3p7N3zbEwD3QIqhBL6+DquuU6BuYVOUg1PIbJHngVkZpQ2paoD7GABozquogplYHrWR3yNYvGZDA8dqpliWXTE9zrr3gKdOjBK5POfnXMQ55AHZodZdhahG9qvmlb9pWqgvpCDbdgTXKyW5NdBL1JrtuO4bAQpEsYpiNd+Dcs6zX84Kuhua5laT5mFBXBymiaVJMElccxB+ni+7rP1hqXsK9nNaEa9L1tULtyTOauWpiHA+HKrAlPJR8DezzzPXTNw7wjCNMlJOEaaLPoyOE5ho55bhimA3QJmOXvdU3fsZZYujirAY9fWu2BGzk3zOJSP0q/3ujRjoFxviUFTAnTNwzDRI1ALKgE3xnMw4I+hKGQ71IXXdO06/WPCYW24HsMums61AYb3hIT1tn6wO2XY7LYeO4ie+yz1YHvZrGrWJ7tYB5Rl1AHYYhkF+np8MJ2qK+mUpaHf9vLjzOWZRiWoy+yRXdWEYRq0V0W1sQx/Ou5LsNakTHROo877VuYp2WllAGbM+qGsWh3NmbWijmasFUU+pFr0wVMqYp9SWVLRdCxDc+zfW2RUzYjfaYn9sBFXpc6NUtPWVolTk3rQWt1tJdQJ3OR00Ln62NDuKsMvHNLx3zLYGsUV6uSfleHbVqaHo/loS88bznWobG9MC10m7lftr+wP3msxWhUBDYr19R1d2lnf1oZyX3NG9NmFx5tzNsQMGVSaJx0yzQNaquWXvjqadCM6+wiD2tVUKPLDpQ7ztLrwsd6VM85dOAwPcsybdTE9II69GcmchVyY+imaeqeiZkyXUIbiWrRXM+0DWeBky/tQYtujf7wDXDqrlG/yvIX2PQ5Q72OugeMDmxqtk19W/UD+DkFJGZOuksHCOpFYd4IBmhA6nPwUBU0wzdN/6odQGZBznAthy2YXrcbYCz1mLpv+raBeVEPqMk23K2TGLihfuN6OrtuqF+3V8juJrAcklduVGFVERZeH7546NoWnV9YC9wJG+sR9xVp06JBlPAsFqNTx4zJfVGFNrXBYYQGHa+yXV93PczsBuLMpRII6wZbgNIXWHs+pwHcvbvRTYfOHkztyhqAQxPrtP86tAsvsKk55j/owFKrTbpjG6blYGaBANRBty7Lz5FA9HB1tvyHeq0ZUhetItADz67t2KazwInhc7URbUn0RSZIFrvA7dNpqLfAzbWzisioYJkeNa/aAnfQz6ogsX5p+Ba7encF+zQ1A4KowLxuh4VSuKoGW3CYWVPTbddb4OLROfoIi8fUtmq26drudTvDYPoD0oPlkzB1S1O/0ndOj8P0B9avbdfWddS0sgAl+hMgmPtkswsmHmYka8iQLZMWmsWd8zTXcaxFlr+LrMqiLGkuNByOeA+/D4pwHWfQm/9s0UZjy2YL9PXTKrUqyB7JvaFOukZHkGXu0M+sIOCFJs3VNNdf5CaKSLXAlvZ1m0UPX+IoJduZJ1GQlWHS26tvvgHm9bZNnV3qWGD38Sz74D4saCVU0PmGZVoGnf0tsL7cnLj5jX6s7+U2mQypNtVvQZw9EmioKFNzqRIuZnxIkA6ldJ4znfpXvr/IPa2zipCCZX8OwIk+dJfNwx1nkauXczSR9VTYKift7pg5fqT0gQb10w3Ptz1Lw4yZJ6WI9AVTzzB0DzWSqJQ+cQXds3csT/PsRWI8zFFEcnFdd2zdsTRvkZvjs/SRCOZo8SQOLmbkZpAu4HVqx9NMR3OvYI75Y2QwyteLi+DzeLS/mxZmLPkZmrTO70gFUFg1i206OYuEgZxUoK4RNueF7VpahuOw4JzLOikDBQ7eSQBNNOG4lqaZC6yfXFBCeg/Z8FjSB9So9zBNWDRf4AVg19U921rkVtBZFdiVbGCDMqlLZesLLCpeUKG/xAhMX+tpDvXcnWUH7ilV+IgNrRDLtg17iVXeU1rIZpH3WeItOuVYdqBoY9G2w/bhp3bgkNlR42vvmuugTqN4a1mlJM2K526Vt43dOvgWVhGeobENWdz98fmkg/XzLkzjiCfSLiQOsNm2TjuFhxsJ7Iwe8VgRqeAjruVbjucZqEeaBWqhIFVYPBDoGrRpUxdcd3FPZAsUPvDCiGn4mmlhpjIXKvQ8yxK5ZkOdPM/RDdz1DkENgOGXTYfvW6COw0IN/gHslLKkEZ5ta+q5t7FBERq7Z3kO9aVxr4DMJ90WOGxebDuuS1uMjjrDP0P+yLhT+0i5sFucjFaRAfdVXJs6CCw7vQI98n3X1PN9UBrgkcj0DdtR4sRQim3jyIGpbjzHtT3X8+TpseWmVbWNi3WQhwV1G5vodKskvi/C4nkF3WDWTQcpHt1liuVOp7+UQCec3Zb0dLZ2tgzVr9Q9h1LVNNZ3NHkLcJEpOCI/HdR8w6Se0AI1H21D+l+eJbCbNze6z84MsJyzS3E1NGCp6izIr2UiuGkXmbLyZHnvYLEcNd/1NcNagKfMtTFLd30X4bTIRZL3LB+yXGwQS9ccw0CYm84s0eBrEebQhSXPtlwTYQZ3mSs0Co7j27ZtuAhh7i9yJBGsHG9s29FN315igKccg2hfPEJTyHgmLUpjiSHpwDTYka/QfDGazkwpwoX8GXyBmVSotafzcdoEnEVKdV0C03Y4jm9YloZwKOciS2hmF912fcs3McIRXeSYAgPAGSz5A7sDvEBtb7+sN9A5keZZvu8inIGd0Sbh2XBuLF9nKVTdRWoc5iTRMd1ybM9DWPi/7IDED7s9rPP4bB5M/1tgFKpZ1nlzgdnUHdfQlzDrDdU0A3Z3z3ccx7SXpRoUIWzENDVH030f4a7a5V4vEUSBnRA1fNP3tSUG9ibrIZ0owRZ+qRfiGB5trkv4yVURrIt7YCAB06cjqOYi7LFeHppYEh8wU512Kc3CyJ90kShLdwPs+tSnd0wfIc7zHJKG7UBHJ8e1DdNACAszh6etA5dpHddyDcNZYqSnUssqZIGO4hQ2Qnm6oXvWIo5otS1IuIYGD2HndCxmShdYcGhXx4H1b1iOpRkI4WxnE5UItkTnyLplGB7CjtllumUIZ0pnn7Tv20tMPsOEeijw+ICG5jq+7+gIV3Qu+1K7IN0Db+DwWx+2h5Ej6TLPsCSOJReiQDd1x3YdE2H/S8jzB3GlnrTLElcu509Lla3Fzmj7FsIRHZGZCqzZmqZum66PEPhHdKoC4ctWnqkTuIQtGJCl7eExLONHYHxpNhnQ7CWWo/t7EdIxTDTX16hVW6BpNIFK6lvPUsE+DM2hxW0inBQS2koBmmDNso0lrJpMXHHdZPEvbd9cYCVr4IMHDAXE2fdMz7UX2fwbMZYakn2fumV09rjAkBxV4FDaju3pKAfaLpJck/v9g6QV05k7brjOEhNdtnvVBcCC55rVfU3DOPI+k6/EwOa5JluVRTiuJrYgB2wJtkcJuwiH0i6yTdIMeoPUosbL0EyEYCoz9jbYxV3wfMenUwh3iVMglCd8kDU0y/UcfYkpeZqXMhk8qCPusXSQSxwDYVRJUWTQUcCn0zHdd9wFfBdGlS12QQ8EmyazqDbCFeZZVKsCHDjCdzyd5ZddoOvn4ZrNFKC1b+uaTk3UEkS/yDpV7Mq3ayCknp/DFW6nXJvOw60l9g3yL/X5VFhv8m3PccwllrnaFU7JBmCYjuc5hrGAVS0oY+r3BVuS5JQO7JK/77N0CdoCcxdGV867tqin6us2wjX4y7tIZRLUEwKZ0r2xNUu3mUewDOMoiaFL3yyotcUuty+x38mo8uWMck9NQylrc9kxIt1ECO8wi3kaQ+PoWOyAG1spWIYo/aybclOuG9twbIf6NAuVbU0ZHM3ZMj3bd3SEyLUX2T7Zmi+/AMPSyS9A9hAwqTURsNuFDvVv6DxsCUfsEOIJeLHFo364vshFjF7pgrNcmtQhc11nKUenbQzwWwQWy7FkGcs23iZ5GnN72Zgc7LKAx0EBphY22bBBh70FVkB7SpRJVknHJzUNSp6OJgtTb9KewmJTmNQys4sni1KG3pigXoXh6Z7hLLAy2qO72UCP+Osei1CtL3Lou0dYIsuTRluE7zrWQsdXGsLQWz6uT/1403OWtXjwU+uGrtn8ROiyxVsA736YJou8gxDOSciewcrWcEzNtzyES//CvgV0F80zDd9FSH0F8C6glE3HZAewl6UMPTRErZntGyad4S1PWGoXgLZjz9fcJaZMpx052NalRn18iwVreSE+KKzd2CxMqLO0mWZuEYyva3oe8zWWtSXcLwIWsKtTb9le4mDR2C+CEKZWhJoSf+GRUGqVSHcdNhnUFtlO6HGGh022HZ36R8vaPHDKbzoLsU3PQEgHJOx5AjfsNMdyF9oE63me4W6dpfBjXLpj6RadkSxxQm7kMIN2bmzfNDXdWHa6VwLPpNrMBpvLTv3HCy1AR9Sjhs3ylzh7MLHSAuLs8fi+lsprLPEuSvZr0n0OgXkkPZPlpzFthd7PEdUiBp5CcliOI6WnUI64ljsdmoeQhSkwDJWbpVNs4Zv9nm+ytIMqz6OOCddXW8CGQbNdahcUGrUjvvXVexhf03Z8X1d6MumIbz9WEWhMpoVsabaOkFRsPul9nKypQ7wBZhdxHM1zNA0hVfpsylGYkiQBmjXdo6Xs2brKk6pHhCNYK6azZV/TfKVngI+4tnHWYIXr06LVXZUbZdOEeRA74L605rqe0jP3x5RlUweblmVrhsrL0EecZZY3WVA76r2rXEI+4gudgNJOp/mG5ttLGogszcPqxriFJtg0qPvjsv3dJTmz5huE61/3ZRUk5CGMnmXyVLHrkpbjUUduSWs3pcSmoBNr8OF9Q6ftRzMNhOwQQDXYxIrrUOsDXYZhgQyoMtfUotyzRWdSyWiis8xUOp15LTkmDTQpS/C9d4vtWCw6qxlSZ+e+oAvRlkXLXb9CA4Lfu7Fsw7JdByF7rAjnXmQUqMWhAxad/S7ZTNqwSDDGmm46lq8yftOYMD/eDO2GpmuxUG6L0gWu9rOrY7Zt0FnOgmS3wFk6C9Tpe7qGkGRsNlkeVhTC1tVpD7NclQvmE1yBtkz3XMOhc3OVJwqO2f4qsY3iGK7nab65YCeDbgv7LOOLr/R65hHVJrgftC2YLLTHgstKMvcfHV+zdctach7wAF2hMVmqSmtRj4HHoAUOu5rrG65lLdgQDmEJgburFguKri85G09S6Nir2abm+7bKU5Njss3fMqtJukEn3paDkXlrPm3Y4T7X8T3bXnQDjQUpBpWqRnsaHX+X3IFoEg7d7zcbUgRhkmTAQxieZrCtiCV3p3Z0ml9m0RcCPOfCdisNx7aXnFTsYjpH/gILt8Vi/7DoYJbK2D9jwlkMPVTre2w2b6s8qDUmmxPwtMJ0Pd3TVEazPSILu++vUzeShQtccokn/xKVugG81OlZnueqvIgzxRZqgTU2Fnv6gnMgxtYFDm22a9mLTiq68LGgXuabtkWdM5WX+E4Rhi+W0TahW45jqUwdcJI1DykLahumT51gZ9GG3Gaxgk2LXNOhHsSS+1F5ET9SGUEYRaQEOvCu63qmuaT73kUaBk446MxTd5VeJBozLmI6Lq91B3ZC4MZ3TcvzTZWXc44Yg/cDbLZtZNsLuhE8OD5wcm/Z/A74gva4iZIP8yQMzTM0d8n9IUrXBBau6diO5y+5w9JE9ofQ9TTbty1PZfjpI7bQPU7aw2xb85bcLecBWcJoC91uczyDhfhfmHAvggzU8zEdOiIv2yiCKMu+xLCSdllyvGUXUHhUlpgtQgBPQ5q66yx7DPmQrQLC2HR1lnDSW3B5lfruULbU4bF8zdRVZika0224QAdlmzYGfdHpBvjMhu5prs/mywt6EDywUFRAw6jrvmXpxpLrPA1hcMYNOsv3PV9lHuJpxiXwSLrL4kDQAXoBwnQutJI5QGg77OydaSxgHA5U25NS4Z7dM96F9wmBLbHqpmU5nqMykcFp9s3JqTXJyW5NdlEMPn7CAkK6uqsyztdFNb6QZ/pKXATVcw71lgzXdFzXsxdw807qUT7vst0zdDfSMFzL8FXGOu8rIHmPhO2d2iwugLdsgTPaVbxjQSXyrAQ71ze679DprL90e2np5wV1qqr4EUjf5pH8VUaPO8Od9dY14at3YD9L11zbYhH7Fpgr9FSoz+1DrxmwzJCLLCkMGMOPCbi6wZKEqoz5MsG4iUAiE/WFzm9Mw9GXuLs4RZzyeKpKWRNjWOyenaUyV9sMJRA6KzWVluv6SnPezNBE0mTeWBo7ibLEdl1PCcq8gN5L0TTDc1hqwkUZS91BcXTHt72FXWKpXVHd8egwZDraAstsPc4lado3cC3e8XXDcZa4T9gnHf8GtYXUWzRcw1nYopdVsY+Aw73v8HS7S5xO6jGWmACZJnVQ3EXubPYIP4bJHsrY8lnCRSVRemnFlxTqZhMX6dewIDfpikfD3oQRGajRRDKRcVdsOqywRGAKljFmqxHv6NDIEm1V1F2pZBxzjwUSpf+voBnN1kYiUYDjaYbp0enFNen3Y5lLGSHPMXRFkctmawO/GaCbtu441JNXcHZAoGc0OeiaN6RiF+nUH9NY/tIrNi+pOAS0c7PQpSpOc8ziX23SIMxj6MVgW/dsV8V68Wzy7eSEbMALT5ZtGraKDYUJJZL4frWJt6uyiNjfsFjjnu9QI6SpOGZ1hjItdU4ZtneuW2wtdSHXglGmM73V36L7rOBlHRNCXBsWu0nXbdP2DN9Yrokw8mwVuyScff1PFjh2tw7pu+2dZ/Aeg63TUdlREftdSCGJzSo65bJsy3dVnNYS0gF++NBnUUUNFZF8hRSgr4QpobYVfGHaNU1X11UEHJ1QpF1dqLUJiwdSrcqYomW7JLwvV1umXRJDg7XfWJbL0nyoCBl1Tpv+mLYNE/iAZtiaq9n2QoPySf5yi0CeZrK7MirOa08oUZJoX5Bg83XFHonZZK1sJg3t3IHN54IyASZC0mgX0XxbwZIWTJv6YhtIFzZs+LaKpWeYKl/IM8yJ0n3Psxx9IfM7p1KgyaDYIKJptue+nPZVPqd0SCmgmZZ0y9M801MSMASmkUTqKxa9TTM8FQeAYLpI5OAxDcuhxsx4MS1ttJ0G0sqxNMdl8RJeklKSGb9oDzJZdHIVYUVhSkETKTk2S4+rqdgnhClS7B6gKZZ03/DoTPLFqAJOF0WnLrZmKAmYJagJ8zfZdkjnp3E3FHx7zTEs8wXUT29lC7o6x/IqaBadmKnIWwFXp7llCF6I8SzdVBHiaK5Gp5avuY5xVQYF+VuQ7h5gK/SmZxi2s7yxK/PhDK6Jg8FAgHuJ1E0wXMe35zc+dgsjJbfpGuaZ6LZuG97EPQGq+KS46regvC2T/B50VJo6Qj67fiddUd0Muj5/sLrfV1W24ws0ZRLUn2DTAha+XUeYQp9gyNaDDwxBJsqx6LyY7afhcSxJ8RhHZBXxWPK1F1W0pTn4EjhtdHVfp7MT+Q2bWZTjIWe2tAIMeG1TX9DyjIV4H9MOSgOYu1ZnV8JMhLxtF5g3DXrYSGCOBC1sTXMRLt7NohwjcPZsOl2g5lN+ZndEeU3YX+MG0nzLmcN8UF33bNtAOI53iXHTMAaMIWXsaj4LN+DLL81eYsw5lmPSAdkUpvH0YJgw20dbtUfnLxNXjU+MsfXOOKPBFSHNYBHcVztNZtvc0g2bLdMfN1ZBIjJb9wbt35auTWwUnCDBbjjRx45ZxHw3LyIlcDuYuvi250/EdIMTAZaIYdNCQXDPzztFA9Kw9MHUc6M1hzDTO+8cDZnCCtXzfc8yEPZzxlQf8jhri5T9G2aFDdOhvj7C8YlJek05cnrAvW6dWixDQ9jrFhvYwCVq6KbluLaGEKNRbGCTKGQ6J9dNR0c4aH5EmU+4i31eDViH9IkoLeMy2NGngse4qPZA15hOkWyX2i0VrvE0eVrkRz+Ar8dbmm9hJGOawb2dkiCRtzw2mzIRYuHN5n5MnaXErshTCpubeLrB4tUi7Lx1KuSk4HtNYdK2FTZ5ut/DxmTXtCyWFA2xbU8TlDAemqfZ1ClGiJowxbGp+I4jbKph2XSYm3DcL/qbPG1CUH6VujnoWDpzNV3EXt4MspzeYeRquAJ3B5lTxULIIg5cA5rdcNXSBC2x+nRstbyJFIHn63KdhuviUWrG4PqaY1g+YvGQlHJqqPFarP8Jqj+LXQD2MCKtTNPjtWdQl/iBUirb8mw+QvPNOAa7CWkgdowjzk2RAm2badu+6/iIixQkZWf5WGWTNEgoO+gGscWCJ+uII0PNjJVZywxWaGx51WFJp7BrlQ0AnQfAi3DwDdTssQDEmoFwfuAsXVauQ7og80ettGVqEydrzpu/fclCxhYy9o8OD45u+xrmSm5dUA05XqPNv4ErXDa7fmogBKw8wZBVYssQ1jlc6m5a/tRqD45FgZfeDc/abhmYbsrApMCLzdAt3/NMhGQ+04V2vy8q2PEW22O+CEaa5ekyq5nBtnBt37FtD+HY6jS1aBvD0gfRaS8LfEoJolNr6pPsy7CAjQeu4zkspQ16U2tKraEGMx6GY7BcRggxgs6RkwnrwvJYadQK/3/dnXmP5Day4L+K0X+/LqWOvAy/eVh4PPu8sDGG27PAAl4ISolZKZeU0kjKOryY776k7oMUD5Gipufo7spSKn7BM0gGI3YSIioSTCawYIKAw4htnyyZa9Wh1QTEB7mTtd/tkTGiqODSTPCA4nw4wQHOkmvP9QotFby6Yu7RXVgUOEsRWB4/RMO/H497yUuxXk2K3o0xrTO0kBzbUTVb5WKOYSeUwROuXlW1/LcgEfP5PMBhDFrcEsLZ4surBBOcChzzZKKMP4rKTHwGRaup88GW6j4xKDXxGRTa3dZhB8cyeWSZF4QJ/DOMXIRYxb1A21zoI0FfH5SnztnLnKRmKd34KnjP62ifz2fIKvFwc57Uy3MADZQyhgI0U8SzxJ5OOzinnSWE5WAkF49E89lEbgpnlJt5Ldgr8IpHJhqHBkUBd5y9hKS2FFzxLnY4HGCBysiVxoAo3r/OzvlswvWI8oqX2bkOx525s88yPVdnoBdEeDqe4HrqsJMQz5EFdFGfgpjOCe1tKUOF3y8SP4mMSwTacQD+W3QV6FjOcXeSEFGNCXghLWyxZ9M5yfRFJNGiSBannWXunbaUu49Et1PQQHE6yXTcYsCXwX48HeyTaUqIGkwlf4svj7wt8/InwVgozgla346EjC2MzAuBLbjs26FtyhUK+c8377UbPsqfRJ1Ldqe9ba7RpCvmpcBwlobEBwk5xqnAeRiANy96acu5+UBw+Dg7O7TzJHEXhUq+HNu0rf0OxUeVeNYznr1vYWqUPtdG43n93pY5+qWbp8APr6FgkmE4aqNke2eV5h1OBUn8Nip9aOqpazeNozP8d/lZBiLg5aD9ufWHd599v/ntkydkadsOWsceBFyEShR01c71vSi6eP7LsmzkJnL4Ou9knkCM+2P0gEAGBpygj3BGPpScRqrvLo8moTxV9ifHOZrOflHzCOJlwQZNaGah03+FC+tJeULmiRJim89nG9p6loW59LEuvNCS1kZB203MQQNH9acLa393PMFZ+uxMFynzEJfH9QoyN02SqIoc5BXJIkcQuLrboXwZsgIi1eG/3DL+F/wB/oXceoFRX2NufICxiog1xiNKSuaYsiKpLtNAzEC20KHcWebWa+N9/QhA5H00XqXVT2IuiSfzhG5ZrYPoeln8eoiRLfD0RWSddN6bjmVhPEtl4dYOsHWJik1EcPi3kKMO/0gUJnmRAa895X/1k3iZP6yzQ/voUzuFfm+tZbl59yASDngOjbYzbGHMhTFHIHa5+XA+WvYe45DBQVAGp1t4d888nu3z8eAcRa4zDknq5rEMyN5XGWckmn71ZmrdieDIGQsvvKAldTThhC7RxB7SwfIUz/EJuzi0N44ytxJGdFGYC7sg7eCgfjqoq9i8CASvopjH48FGLqASTczmYCzrV6uY88XZOcLpxZS5hz+iK6tV7CKUfXB20KhTWHKB4OUduB7eHx17J/OyL9MN0O4SkmBcOmt/RN5mK18DDS1Bf1G4QDvazl5CWHI+4F45C0599mm3cw4y/dM4wZec7p8tByX5Vt+6qx9zvALoft2y8BKwHhy0OyEjl/b0QmhtobT3QOufRUc7c384rwq6xCX5AEeRvSkjVDo77kMU9rODCtc6y3R+nNA2t7CbViC2z3o+7U7Y1YNs0HAh6fm8sw9woaWyAYyKdJGfOlpEw2WRkpvhJN6HKO3xaJ4groogZsRmIE4LzUgLmeDKb6wvqP+9c0RRRWSurvCMwo7jyGkcmmcSkgTQCV1wfwimsD4dds7OdiyJngb4m/ULJie7HEdNCbmTKYyi1xdgU7Sk7OrdvCxAkTebS+3V1tkjK0NXuwn8CF1qbwPoJYK4O7jgOR/3Enz0GYGbuHmJsC/teY/O4Q8CpyPDMINJ7odRtPR4AkVgPVo41zNOHDhUg2XnJKfj+XA2pV4E4YjaiHbzBLc1ofm2351tBQYyS5TMchtSNFTmydrbKHK6vjJfFC5zf7bPh519UrBtQA+XWTUZoSnVQmPW3sKEPqb2utv1PenF8xEPs7I/HI/YPF/0sIIRAOniG/Jod9QxncMJ40ayuPb6pdTOi73PhJrbybbOsNBkhn9j5V3SS0z7CHvI3pIZl2OGOxyCNzHEBd1Hrd3hdHJk3rLHojdWaL+JCK44DseDdTgrL+xmlSQB+YDcufZHFUGHu6Gi23dvPhG8X2tbe8s0DwqG/DnYqgN+5MKhD8oDvp3MYBvM2AsCNux30EJw9gpO+anUSyKbWOfzzrJUbM5PsMMRt2AWb3S/SsEg18NtjzPb/idmuqAMvruzihF5Ahsupf18OO5tlEBWYkvA713UQ4NQkdonxz4fTxKyszFBLoxYAcsThdNSt6fWO2hZUKqfTZQRxraPezWbLVjSJUVrOo592J32Mqdh/ObQgmnMdKChcNjvuUNq9Y5c0aIv8AN/0eIBXZl3jgfMgTGV45LUaYWLLIkWOZ87R+dwtHALGLobUUURgKv3iArx3Yc92jp2TIwnk6wTUYQ2OuzvqlB04Y6YLduxVRwk9LlHp/0Nt2CoAVjM0EqWENOy3WwsW0Gb/6ZsEuIbUeYONsiTw5GGSISv6TjiMb9RaLwylrNsziZLT59T8IKaA4sSTh1qEYU3kOy9dTydzjJvglIPuTNQJaBe5J1kOecjhBfxQQWv8CW1A6qg7bpDVyocU2YY0M52hYvwsPXgQv9e0pPRHWvnKPUWKo20zoMmuMV0sKGhvZN5+IbnDafAQguug3O2Zbo+zpUufJkP8tz1fPG8rdbuAG1u2HeUrGkr5nps6tquUCc7owQtR5kXvmmcSxqCedhb+71tqUhfheMdtQUxs9N0rPP5dFTYFPJylVCgwJXliia8hBH8drtVg/md6N0i67izziquvdB0aTZEqt+JN3jbRNE5d0cFxxh8KshoWzbaDIbGOfeS5imP4HKggA8bXur5L25537BeXfmZ4CrhtIerYgszrVBoWuFu/SV0iB8lz09/5EiQgM2K3N9OuEinVJKwXWSKFcJ+Bxd5e1ykYQ7Rglso6NqcDVXnFR2F9xeQXcMIPEWBmNZnFBbphLnXQRGNUp1WuV7r+4T1L0T9pa2DaZ1sTKBRusmKu1Et1gZO5tHZYfey+O7UFt4lAotu3MNOaZ7hgL2XGecRfzcZcyG4psrnfifoSrBzkPOYzGjBErR6ZK+it+1MFNr9BDuvxJ16ufUk2iFRIqK9zMwikipqUdjCHbqVYe5lrkmktT8xSwLa1aejLfOgiE2haoxrQ7jYkweCC7SVkjcIDooivD9DGytN0d/lN11zhx74718Ez8dMuG7fW+oDkqhR+2cxtT8fTmUuCZWxyVSq/ZOg2rYNl7u7g4StTD1qi+ptOnAA3tk789+vdzsLevfn88F0dkdTZXQ4lWoL9m7TOaH730eVIR9Vqi3Yyk3k8LffmTJ3NVdVW1Bv29yjiwoqo/OpUdtaMnPDadvewXauMIiiSq1FJ24TOcg4x/P+324ktxbN3LBzowROx39bvYUVR+fu1l5qFmsuxfEfC9pfRzhCO7io1OzblWh3st2hE9yo3B8clHcbc4uPZ5dI+MDQROGjbeuAcSHjli9SD9buuIdVYWHMf479qTa0z6L9KWuHzJWTiclTzLNXVkdhXeakZJ1tuACWeRWZFsUvbaPH4rQR3UnalxF2VMYX5tRDcI/lcICNw5F5UrNMjyUB+Q87e2+azpl7g7y8vhinyR35U/he4UWieXUs03J2zpmjqxH9OcQOxVF1Hg/8JyP0MF5CEfyOpoVOagQGwb6DGogfy7wS0VYM/L8C7waKSyAiF/QIPB32cNQ+qojaQPEHBIJ5yz5b57ONwlTt//V/P/3Hpy8//vzLTz9+/+Nv/8f98ts//vrj391ffv37Lz/8+tuPP3z59O0nqFSGTqbK9/6/33+H/N4rCL7AYeDlf3tZWNpA6ONv0R/oAfSfTylslX9P782P3zb/KI3HKzQeLztzd92bVhg7p+aX/9H8w0/SEMoIXn5CwTOREuP3EAqx+fW/qj9QMfy18lT99+T/F6wgWB3/64fvf3O//P0fv35f1sl3//UeR9/U9fufv38yn3a/f/oG3P0kgNY2/OAfv/3t8+n3T//1l9/v39XN7xv4dwqy4uMLhAP/2TbL3z/Bh7755rtrEgUg++buxeiX9XhT/3Ly684IbZ9Az4QRaF+AP0r/5pGF8LfoyW+NWxIDA2QxgE3XKG4gD/P6L/ctN2CrM8qWZ7Cf1Bt4mImhLAtj8uIG4DujKrC2+Ho0lCP+RWyUdxt4nsFB/0L5g3dR5d0kyrsR5BF91hdJJr6VxACXwrDDVzWCrKfFuhPeiZX/628/uN83tlO+WPT0dSStsQbbUrWxLyURTNxvl0qfvJBNsoQGN3khVjJ49+DcAtw8fL6jzZcX8PGUgniheOJbmRjSx0UNRv/FcySf4VOfPZB/9v34qXgv5GBM30pqC7hQyEubA+6dzPIlNEfcO6nyp2GQpWFMX81Gg1tDyYXCSRBkk15gOAkkNoJf2FIgwmtJFKXtDNzLoyiSu9xqm3k1L42Eipp5Nb2GZFk50zcyypZQANM3YmWPnDYXSR29CytvzlNzkfC5F2NJ0O/qhV0Il7HLpI9fVkkcLGVG68DK8u6tEkfGHz3ulxBwt/3EIIFomc5FAZOKNXo3CSgAl8czitUmjwP3Sqz4IPaC7FWS4MnLSBoTQkItVJrwVo45TR7L/MvpSMNkUtJghq/FYtDyCS1hob2bbaq9FPedvMKZfTfbjDc+ApRWXbiX05FSJU0npbacRz4OsbZE+PRtJM2bbRi0q4k2RNAFZlAuEv2rjDKgvp88sBPjRywe34lvZmofk1sVMpvJ5OUkpGH6LHk0xPfObxP6kwAbCzlIr2Usjww8o+amqlgmr8dieWnqdrahJBjiS6lrY3xyq4UFQ3k7eYszk2k6Dt/GNhUqmgW5RpOp34m8wWT6brzNUkRV2MarB0dFCaM+9oVsot3c8m3p8tu3EtsFLsTp0kaBeyfLZDd0CJA41w1fTF+nwt4cwiIs8CvVIoNGxp/JHTSL7zLzcPbxlIguqGtxxtyb6dSkM2LCoWzjPzA4kh088deyCHu/nzzxpUpx+ZN3yQePTR784W+/2tbf/qdljx6bvjF5ZCOZzXP9hlNdBG9P14U3rqjOFVUZGD1FjVYXo4I1cDQGRYECVvoj3YwGOJyxCqNDakIF/nj3o0dArUGsY4Rwt19WCDWyQWSiVGb7Pdfz43QrSrQw7PQLtqGlww/3ransl0dWJdLZBH1Lw8NfBYDcCn9Fw8zvV95lm6CvWZjZm0h5m4BvYNjp4fvv12Q7CnQ87DrEHvxe7mdhWue+3oYqEyx2jdIo2o4eNQwzPdhQbwacvbnLUbUN/BaHWYNrnvnb6c8tDTP/c+pn2xlQWxoO/nA7xd/AcNG7abKhLjAgYtbjdt1SL2hpOPjft4T/zkdfJwzeBHzNws7ubciea2DY6X3Pv4m7+0rnb3GYNXgBH7nvibu3yFahx8OsQ+QHm+GvWXjYs+uW6Csadn5od28Hv4bhon+/eNtZxfSBuLVA9xXC+4Y2hnBg7FqBHNzz7QyuPR4OHdo8MRvRoeVh12FTtl3EbdtFW7LtIl7bLvbC6JK8b0aBHg+7Dql3u2xpy7cPxK5Fvh1DtWZhZk/9+3aWmA0MO/01fk/TDZlJfSB2LbLtTMw1Cw97eS3LizalQ5+JWZfcz7zCv6XedhYNQyR2TcDWZocBEbseG9rBzjl3sHO4XF3gjCQdv8Xh0WBLx5kdDrMG27Kx+S3sx7ZM7Ae/jb2tYxz+U5zXwNtOD2hgmOnfggV372XTNzA0+rj2+tMN3uegOYKNfcf0ouNwmPzAMB9OPpp+ML4eGMfJfc7fMLz7Ez/DoT+pVyRxqLDfVYxNfKVOmjFLdVlwv5UT6RJihqmpD3oAXD/y8jy81gFB1uIjiJ7lDTUCE2XPlzC4PxTuTQyLtJE1TwT5gcoJddQzWmm0loi+tV7ja6RRqdJwSfwXfq5WHo0sUzi9jakyzBQ2uUJQZOFdoa0wZOqkUaiiMF+tsbfCaCXlFQ+Fmx3jkmqk0agCle4uY6hg6s6Csx1GVxsy6rxfjTfKvOhrNepgkJ00em9FfxTgPV6LbSyTqfeuxNZJo1ChA/soEo/RwsvVk8cyrqyF1Qhj6cGrVWEtbLYH00z9S5IUUeLBT+bM/eGFz7kRYPikurLouEe3UY0pAd8Q56XhnIKDq30r6RcaE6kzDXF4+TAvksx71kTal85MfM99TbS15BnSfuDGXiNTNmmPcMniKaULsizJ0PppNdSJVNb6X5VwIJW5haZelqtck8w20k449xigB7gnnUKcgRygSB0qL9FgUIdi+WYLZOTN37i9Rl5+w9y2xdUWVM4tn19lAETsRinOwBNMNhwp0GtU2jz0tI1h90jHeqBoBevR9yUuMt6CLHydN9yqgBDzDXS6psPsm5bvUdcqK02MSkxj4XZCZxviOPzFypQT2UwNkLKbTqwBZY10qFuzh90K5auBdSknsqk1QB/Xywh8y/tNG8hPeaMsJXU5Mnpi1bTHToTqyq40axNp9MRKqGd0JWp5NZd3w1TXMBLSVHAjUE3dqr1311enrlX83ToZR5l1Tpa5OXIQ9HN5WxjGEF0UzZc548xAZrv/iAWhDOQh5mvuzVNoHc3pMEdDm5Hw36zTBW2iOno8XMpsQQGBprSZViTUgDbUdkjNRtbwjxk4Vq635twTC8LXVzZAzgAdboEaAyHFki7jv0mbX+v3lajqu+OQfpSDrmWgNcn6ebVmIhMy3nAkEqcgC9MbyLxIM/cQRNWSplerynvgSN1hosCWgadl6UUmxccgBZpUGdeACZgQzYDeE/RiD0G46bsMsJvQocPh79NlJxmfRs93a7dNgr76eFbRjvv4EIi/DKp3MRdCr+CRFamvNGpufJuYoMkzQ5ARKc0G6eK3r7EyoOTC7XGwDsHDFLpa6TsMpXN7W1KrDYCkLMCk8IKUutLOjY0CJ9Qj+/lelnfJ/tvUt+a+tKY5jwloNTvId7PW9gINnH1PKhx+rzmIVd9AMSrMsKgZTgZ1va7GdZ8cE3DVlhbkKYKEQaSs6uyRFmwjCb5uRzHn48kjo+L0Y1Qwd6io+xpmxWONVj9RtCxVD7mFYmmYg4YPG/ZEjC7NSCz8/Zlh9gi3oXczmDEozlBz6v3daZrMM8no/XXml+XmQ/OmFQqrltSWUU8ytY6HmW70wfYAmJkzUHjZMyhUu8lT2acgzDo89Jb6A1vmsoyatiWqH/oaBZuRvieZashowwx5OCddRVuhzkS+nm/n+ogfbLyhZmCMfAmT2jDP2/Kpbfg+9aPXUF4zhk0paI1xlO8u+IC/gjYu8tbOXqvb35vQhURGbbyTPIflnWg9Os3QcNZTM7tupHL6OJw1on48YaoKloF7pHSZoVdre6IQCeizIUWEesXzdgasDkaNIam5G9XWxOJeVBfTJvB7MLzzChwBwb2oc8WiVLaaNGIDk2FApQ8JVlO6zrkYlNP20lTtGRh8/wpVD/VpWnAq66gIvcwLJdxjQm9ZySe7ltZWbl8ydSBqHq67jD7aHgB93Bl/SXljG1LjCZjKOs0SH+S56/nrrCtwxT1lUDQMtC1xtfppBoS+ZO4+oI12YWPSwj1lEDg4KeOxoDCEKCwWXNdewgjS0A7QcOPwtKRwb16x3+EBemFosHDMh2rUTkkskHU7JqkcmpuVQyZaCM32C7p6AJs6tL5B6h1ilkuTg3258dK9a42O0sjqYiD1pVPvA3e550uPkirws1bsEQinBlUmXv0KtByc/BtoN0MOqjk5/OIag8gIHYegxiTr9a011WyjJvalc9SLBtixeAmLy0cAIm9s1QgMz9V71HexSk7TvTqptAGhetL1svj1ELvPvv/0RQfqCEBNh6pLRXn7rBWsO1InVf5F9u9//vLjl7lr7N9TIxHVscXnC6/yJlMfd7fUx0DQbczzqejZJl09/gqyXKmNSQTtSZ7lhGLQ/iZ4V2jXYyCHYhlKEnXI9UuxljrPV0ZSjW2FQflxfH2ps3xo4xaNaqdV+QZS5Q84IA6y17kBJ4i98RP882b1EnWTZqmFUUkp56FOoKyZZ6iw1eStoi35KxD1mbcGJVBOVC2iMWUQcRuui3Q9DTqBEsw/TLILfpMDqI2tWZVAL4I3IETVFA2B1DrqLuzOg3ep7tUDYWXnnohXYF0OZSiu8qGKqOYn4iW0gPtrbC/sAOgVKBOw94iUFwqSVZbFWOjsJI0eXpWMich9BneQqUyUgyuznlA6YZt3fj0+Yqr7KZ3SrSEcG0v0oOZB1XFRCXykYKg4SrXBLnCATKEtyieTyx/AX3k46WTS+VKlQZVxdI1EOluRKY2ljYNrRdLpUPhb5TbvkK4VqeAGWTncK7Z2Sm2QkdMIYx251+TqRPKMj6sS3pgjXHej1aqATEGl+mPVqnSdTMbxcVW6RiLrCLQqXCtSINRNcr+G43jE2C5fPrjKyFqJMkZiZRzI5DIOzOu3qK7iWkxZyz2RChaezdsV122jEJo4eyJVbDBG4WVug5GSbAzEqg/lS8KyZvuyZpJYIMeT+LESUC1pHgeshgOYcBTfWx4SEe4oj6HUhmUcIBHido+AoiD2VgJqRFGAgPKxtM8ESMPoCCtWmSlqgBRTM0OVfmVKDYoeTi1pHidXanv1aHJafi/0TOl6txZQK2weas1Gzdik1xwfGYfHMun7OkSNKIPLXqQkI2/nboWGE9KhPJfpyaLYCbcwXYmoEUU3XFbiwYaQm+LUTrzrUfUEzsAhJ7T1ymsobb7MVGcWH5QXU2Lxsj8o3egb9DxaKsTKMVxpnvNhm2JJcw6fy7z4+rivNUL1pM1jKfetGmAR/ammVagy9fqoAqmZ1+un1jjIG4GRj/Fwq8B1uPDhQfGrwJWICNFv8FDrzjkTmQwL1XXICBmZcAvVdYAaUWwL1ZWYAGl7DLNQXQeplkTFWbedDwXSV9HrUNWSqKvodWhyhokmX20cz1nGcbjO9q9KDxv6RK0wpp2G1aBqYSxQK9sIU6Es2yHrsDEOnGsaCox2QrlHsQ5RI2p2O4R2zNLlVZg7a6HsoeRRfflQ4djcgbYxrjuRs+vxKmGE4raCx2OyLutn1ZpveD4GO65+Uum8i4ejT8Ddgy64P2IdhJ1gOmd9u3hlyE4qK6Fy628OlM0S7KWDWblUsZJ5SNcu3TkAvp10yon7cMxTdiTQU6/JUDGQyjjSrszHcLTbG/ZWhqMfGA7HkpXx8FEZBJI9+xB6FKFmGtQG9Y7kDu60yy6RG19AUES5mz/SNMnGz7N6aWHOD5oXe74PIlgaqsOkVOVi9JU3pvo1Ll1zhNQYMN1Xk/gepigo7l1pRBtx3UaADKqlubfhOsPRMSpVXGPkv33Po43qhQEUi8bEFp4KoICU6QccnbLgzcsUulIwF0g9XuLI6IGZ6pdtR40eEI0euB7YDHkLQ6Fuvuz7SnOKcKCPiFj5Y09p2CMRBWokRg2AH8DxA/6p8KKBkB5DMHoveN5MU+pg6NR/pN7LZobPHg5j68lvCl0xhZpNTUQf89G06WcfaaE02Q7fsD9kYjRONqbEGEplVMhmmtRvjzXRRTsgSu3BedL1VN4G50Lv0VC44fy4Ie4eDY0bTotbAu/h0GeJKiZ8vI2lYtnUx0w0HW6euaHS7+PQya39YVvsPSA6/d60tkXfA6LQP29qrHlmHmuAX9pRG2IfEXFZR9vQYMLEZx1tRYkxFFtNvHrRA2zIzBkyicaHxu0pozcHWfg6ueAqtlNV745ld4V3NIiF1+kyMI0bGsYGXL1BeVoOPh1GUHyqqE+9JaQMOf8WRh1oANUe2W4AUnAPwN0PtezDYZSagWMbb8ICpcxWGbWDXZ0JEFvt1JV6eYRREd7dF/CxncohsHEpBr/UN8E3ptqUjls5ONSH6hNZiio3pONSzgNesDWVGiYuRfTsfc/qwbb3PfxOGd+zeGg5xZpVZgDGpZJfehFsTZ+Oik2Z8kAz9TL47o0qNksorORNadSn5SreCOGhmBXc1Ag4wyes4JZGRjIev3obnZfnEdnUTFLvn49NTm1YMi6lNlptRDqRGtvYzECCE1FtU8MlHk3uId/whkbuYR7ClFsZ9/mOkihlj7wAgZsXSaY0BilL0ZUuyLln0AgxDQNfhkx7K9pVJmIt2FvZhFIzcHy7YFdQ2vYbUYsAxr+w3YQ2UyaR5dPGVOmoluylbEypKd2SXbANKsd3TD7ZzNiYRjUSlxWDoqmgyt3ISEcA41Kp+Ei3MnBjoPjXddurIiIdv3LbqiwsmbwT1MYvR87xqdu9b/UFSCu5TZU6YKEfZHXPl7Glt6RAC8SlhaYl7pweHAvb/tfqWxqbUqXHxKWLlt3aOUWYt2f7X9K8RTSnj8D+0PjrN+8eRKEGJxCaXn0wLq30HVrNqcR3YtX/plcUIC+21/hGXGzWR/Pl2AujS/KuXSESlErX/N5svbbp1anfpPAesHC1ywBcw7sG83FGhz4Tly56DOE5TdiXLBPjaUtqNEB8o4O2DcCxKkQqrlppN7dLdybdOs2S8dVT83XtOhGp+FYRN+C/KM+EI1BNYzA+rTaoj6AmejafZzVh33nGrai2pEqPiX+VtyVFboQcljyrvC3pI3AQQFxMbU2vPpjgKm9LKg2ohFd5W9JoxCW2ytOtEAlK6vWcLCkSP4nqG0yy7ugM3+pmXhAmeqKajFC6eyIziAzNpXlcs8s+QTkCHYs/w/CNOk5Z2CqMsVvjSmI7OhHoJHZw5AgCfDfJR/FwMQ8zbQP13rd+OfaE9/xcejhMDjv18+7Fy2CJF5tTZAgmc7AvvdT+hBCiTWEU/g+5gLG58sHiCpNXoMP9oVW6CtNQQhtjpmnDwSuRV8v0q9Jk40KqjMiYFQLZa+iD6i7exjQaofGqpNM2ZdOMaqXOK6g0zcYixbBpOegKab3ez6IX7ar/vHphocNrhUWvmoxXIY1HQmx60c6JKOopzvexTDVCfhCyWlpOWeaVmTlnIfvKT2MgT+0ZUhmUE361Ma29KCp0A0/GXCISo8BOONZf0HYl1CyRpkgMRn7ZT1Dpom0THfejsHqMkFj16KwgV8cGCkGVMRWfNjq9Qygq8TuIDA2f7VVSC8WnCwrRsTldWig+Xfqb3VtTaczGqVlpB2xQqx4Xo0a9FexWlBkiiblXzaRJEDRlOthmTtF0Wt4vtiaAfWPVzEEus25wiV14c2eUO69ziTMyL4zcKLzMJ80g7IGN6wu9TF3llLoYDXBnYrdiJ+0Wg+fGV4VZBGcRG9FMmFUebhdkWYI8MgKV7lbz1HgSJiUUO+7Nc5MvqeBQ1Tu1zdPOua8NgHX0MaYOpqt3MXetjfQr0U6lr0dxdCetfYnSkVhOj5oTTNrJ0SXCWTDYkQU+ulpBNPgGFGqMACjWqV7WOVBG734AwGlnmXuHtWK6b6yvcyfbwOOw1NZGFGCgZ6vCt/jyyFlrr3x4fb1LscYEgqW6tBLP47LVz59v3ivzsFc+vL62pVhjAsFSP1qJ53EZd7/DALx50QtrFTXPr69zI9nAobDU1QbQqdzCLiz+LUxpBgi4ZrZF32wpH3t/tt6Z9ltKlZB0N0+BH15V5rQfm3BQqlHSGi2zQUSingVuTRNWNRbuD03q33sUyTPA7dwMHoPcJWEGIuDl1DG+ebzRz3affb/58pO3UkHXuhkjeINKJ62jptHjOaQWbgmDjoBd34uii+e/MBs5w2+tN9iVehkYBINMxuSlulGdiGhiE3H3siDGBQEk1zV8Xt2hAK1EoHADR0O/KjH8irYqxSogoRaJuwJzJdF8SV99djYLiYunZtvvaateij5Ml3qm31t5T41TK85YSzh36N5LPXQ4VYeB5JuEhl9du03PoMz9jruJw28/sleVF3gk6NcS8qrWK5iVW7to/fF26bp09HRp7krkCSOBawJb10/isFV4lwjgRyzsetdmX+82IoJL7KbJG9QIFEV4f3ZjL03R36Vs19yhB/77F92lXpVEu7S0Jw9w6MHgUivw7p+/kjL6WWEZ/fSVlNFPKsvoqykkRaXkfCUjkqNwRHK+khHJUTgiOV/JiOQoHJGcr2VEchSOSNZXYiNZCm0k6yuxkSyFNpL1ldhIlkIbyfpabCRr3kZizSaDg9pI0ZDhRE+iaH7g4x+Hi+SblwVv3sAHf+zelsBH5tzGpxftxtVRvkJN9ueG3yhlNMFvhwINBjg/QUHVIvc5DZNVIceCjbmqnXq6TaJWzKonvROMNKujUk1kstRAWVtr8jUCZ0ucdqkCk+cdexfmkZXX69ykTIr6No46xXB3dVxqfiJ/a7otrjrnA569acA1Ab9nLS7WCk49Za1hXr26ldQEVPWWDcBoIiAPvsUthC019bLiY66NxRcQFNF4TxTn2JF9zJe8iohlSEWjp4lR4xo1kUGIQTYEy+8m/HYu/6IcHa8vmgr5loWFJshW9Cyk78fr49VC58FuHvxfmkTyk2rQ+QayGTCtnS7ISvIsItLDtHf79RH7kudLUU0iGHoZErO9DPAuUYICOWuCHEtnKEn3LfNSXcXZCp8HVZGRmE5IyDY8QAO+hrKrhdLAVPkhsPDNeBgQMN07eNOJ2sin4Aby8x0xQAbYpEZjtFy+3x8LW4518BvAPeswHZ4ZTIdYfnJpKleMzxrdx7q9BNf1wRqplHb2R+q9aDBUe4IpVarBfKmFzpsG4fP9oaEfdHIZ8ODqVUFeLUbGVjgLaJxo6LtD2YyYbuZpmNqm8uf7taK0hPR+Tc49iAN04UpBvj80K2Urfd5gLTI3yC7yU+7Rjdae5PkZBlq3mhgHoucDa9w8c32+RioNzdoftMDVcml4e9PSglfLne8gyT0vPJQFOIw1zDYT8bOwxS0DXqAigyYVdCB6fuemPlXUsHPTk8yEqCYjMTMnMf/wEDb3dHH2JM9vGkdwhleSpYG+adwXPW8F3d34If/8kG79tHLn8bwcHBx1ae7onFMAZit9fdihcBZQjSU7BWBdVuhirWXzLCs0ojbyOXBhbbx6eaggRAYn9wCEeUNfZ2smYVCOnMq0klXaJkWBLxlOn7AQzGcT6wMPhVMsWRQ2TANjK5fd0HaRMB2oOAYebG29jsxBW/9rYC2wmRsGYAG4PJ41ludUPvV0qE1g7EUaDF0cAQOyrkluLJ19Q2191JH0WdQoThQkhKEytmIpBw4o2c36dJ1cGp6eabQneB4wzV1d0+hQNhWzjLWqh7IVTYVEW0YK0gwxUXayqZhFpiIzHBNlK3p+C8gLkNG9PmJP8Dzgi8apfCScBqpnCOoJpgBWLpAaAFvBTNuROischzAfyBl+A9pM7g1EKcg0zN8YACqwvgIeS58/4Mkjt7KmtZUuFoEK7Uehli3roWw6ZrkHkD9g58w1tolZFKoScagg7SUTcyOZigi/aNoaV0x4BkbsF/Chqd8N5c/ivu93Z40teCKeOs81O4VVZ9Vy/jZBYITWScuB6XrQTNdasg0Ac2PQ5FCPRWCFrm6LlRYomh7de+KW2fI0OLOzUrGqlkdJUadii3X3UgwLsxpFksGv6cXvGFixtdw6mMpnxb1edXjNYwBYgW9erhe4AWAF1nJBZiqfFVePAzkGgBU403G1YiqfeVjTPKJxlW1pCmjZzRgBcNoiOpE7BGZoLQ5DGAAeYG3HAmQOQdtPqwoYluUm7IYUGlLxGFE6lajlcxlROnkbAC4jSidwA8AKrG8TigDBDK7jbHwqn8dY1Ylby+cyVnXyNgDMxqp3D5JYk7MXmYPH1taKzeBTMTR2ddLmXE1jvFWilXzKwrttoxW/YxAKZBU9gmmOLKbwTJOS8RREKSQWRY3e/uwxZR/wsnDFXj1hrKXTIPO7qRGyls4AubKzAo6U6LaAvWCjj7WTTwOtbsnrA23l00D7MX704Y4oaNCPMEKRE6+JRuQBAwXYh39Fkc5Bq09Ag/U1NtxaOA2xCUGmj7NHwARbBnXTjNswUIHLKzYrX/CZIg8paNCahzDmwctfdcU6wSSsV6cXkVKv+Gw9vWtEHTBQgVE7cb3gj0deuBF49vyPxpVBowazUCIqXTO4CF71ggCTUn0sLrXQGqj8cvWiraiFweJWK3+kZYT5DaqGQeNSL89X3AyaV6dG4cJHXmRb4W9Y2BTYQs9n7ua9qCg6mYcYNOwm5JE+4h4BBbb0l9ZH2oqnYmrcUQqYdpSCm8Y1Ty2cgljG7dTG2EinQ+ocoVrxVMw/1j2ImYL+QTqImV4B1omJPVUmBPvTh9kB0FDXvXI5ASVduxxhPuvcgnlm2oIpw7tqY2yk0yDb4ID6SPsIFNwo1jhR1sIpiPXT2neHphw08BXdAiewWI/ACeBeJ+GeBRHESfbhXh7XK8hcL4oSjTtZBBiKCne46M0T/wWs6eUyRh9B0JBDuEx8WTE41wS3A6CgJqHGXlYLpyCmQOPUWgunIa4YJWBCiA0UMAH0c9PSCdnIZwDVOKq24hkwj3oxjyyYTWxWfaQ9AkZYzftPEwxW7DJoq37sBoOG3SRc0kfcI6DBZuGrVwDX832QazQDphw08CaYrz7kHgEFNgvhbBeYB42H9AMEGq7OfSuCl+g4VAAKJa+NsZFOh0Qh5XVi1vLpoLZWTJsNcq/T0urk00B1ngiynQGW0U88/6bRGhggsOD2grVoph6RsMAnyUuou7BbBgbgIkRLcr3AHQMFuEvmoI13gEDDDWO9rK18CugrbOXhmrdEx6Q9AAqqXjcGRseFMmKPn2mcHfoEbLAax4A+ARNsrvE4q08wuW2Du7gyuZMC1xO0+yi6nPggmsHuq1df/q98erwHupF79y4R0LAf2oGTeLiUqb1+ApCCewDufqjDFJnqRMASUe0FfECxYeYWH+mmlJuCiaiXf9yT+4eOo0WiYn2kDd/1QPx89zwqZdF3ivCOAj2kSa7HeO+VPR6HT5U0gwZUEb5uRJUhDp8qqFfBKQjtvWkx9DDqTJHYVKpc5LWq0CGwIutxHBggs94pGQQIWTt8DIZ8QsKpwL0A70W+lXFpHktMtQ11bjqamIobGYrnsdhUg1/MNGy797RoCdiAdV3l6BGzX9moA35oO7XtQXMc3LahKOoWppV7QMEIHv6puWe2BIzARfbw9RoRHQIbsv6FGueK7NWLHpqJOwSmrRrMh7iPhts5sBrzAgSfr2EWv3kZ+ByPdncmkUsKkF09nxq7hBTihHFDabzZX0VbWc2imxaL0Wo+qKop2LR5jXQJ73DSRenECmg3FStZPcwKEeioWq2V14FZEXKyB1KXr76x2ujKrgkBj6rXSncnmBWZuUwx6SN1zr363euFfOLoKGREzBSD31zHxbhaabnNqij74ru4xq6XhhtB79EwcDdLJHBdYc5n5h9RiZoBkzk3Ci+0+fsa3uhzd5759Lkbvkl9OGpMkUIlDSjbgJBGzcDVL8fmDJumOhpPoymENGoGZk3ZTv3gopveGv7pX5KMUEpMzWY8CQAAjvsVgocRihQqbZQ6lU2oR4OdvogNibGFoaOWHGcvixZf9UIUGfkeeFDX5mK9ngGuKdCKqizRWUBcGeMVXOu4mUupuXNokiLrOApzqUH2HCYpAYXAn4tVYp5zqTIEk9GFhaffZm+NNgczjbqFlz0D3HPTcSOEpZrcI++CCymK+cKNMB5N6j6PwlWSTmAqvCnLqtbLsjB6iho31ApaPEI7JlW8pDbBtTkyMkxvXqTPKm0Lt2+U9okYLGv0+Ho72jxKzG1xC/ftHPiPDLjXN1rnRrwh2l7Bx/cdPFvNJnQDtA0iHxZuHmnpj63+RqdgvYNhTPFYt2aqy8Ib1aeFY9XmBXxsVZcajbleVkkkKFgthByDRF3yjxgaCNka+fkENRoQMm9rrpQ7UUwnclpFkj7rZGcT04aUuG1mJOh7GGxUqyklj35rpokU128+gSRJv1US74kpRcjJR9Ikuz9vVZMajVWTdbILiqlCSjw40QXZqOhouDWZStNVi/08pxYZk0nDZl7TdGhA02yIx6NRfVF8y1r1EJdsi+MPwehLFUQSFrmbgX+68f1ZzzEltqhIOhk4ZMn77Hk63RTi2D3ADSJV0CVUGnr2ELoyhsoN1uBjtGVlyeL+Mv0Au0PmTrbIps/BJ8rckPPuMrWKlXExPRsZ3Zso42KlSRJVS0oPtjs1E1lfT6OnjDHkNYhIk+0SuiJK2t4yRSZtTqANDX4c/tAvE3TvNgZPcSBYCr3vG5i3o2ee8ii9iL6+94L6/dWx/yMrbf5G0F/B1XtEBZQCixpEg08uiZcF35eXC8ILrJfiA7WFLLAOu5337e4J/fd/7Gz4JBorxg/G/uPJy+IncM1s6+n6bNnVP9G/Ljtzd92bVhg7J/j1Ataif/PC+/gd8HewiYw/9ZP4qWoaT/C3T3nh+fDPEP7726YxPbmfzd3R3h2OlrX/bNlHe7+znOOx7bDfgfdy3Ap+8YrbX9DtvGdwN/IItqg32K7qZgaXf/cgQqvZ74zBF3Avqcp3+o7G3YLrFZkXRuVAOnpZudXG8UZSZ2v3UHOQvYY+MAZiymOWygMOp0/pGcdSJAqkg9hRLTqPAEjdKEnSiXiNot0q1rdGALTFnlurEoQjhNbGVceAfC4m1b6yvLqulUsNVaiZeUGYGOUAhg5v0+jxHN6NuQGNNuDJaXIKuAjlFYDcz8IUzbN/+c7o/1TZFIOZGH72nZFmyR/AL+C/P/3r/wM6AgWk=END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA