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
 '-DHARDWARE_BOARD_DEFAULT_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_2_RF_BANDS=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_915=1' \
 '-DHFXO_FREQ=39000000' \
 '-DSL_BOARD_NAME="BRD2600A"' \
 '-DSL_BOARD_REV="A02"' \
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
 '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_trustzone_config.h>' \
 '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_TRUSTZONE_NONSECURE=1' \
 '-DNO_CRYPTO_ACCELERATION=1' \
 '-DTFM_CONFIG_SL_SECURE_LIBRARY=1' \
 '-DTZ_SERVICE_CONFIG_PRESENT=1'

ASM_DEFS += \
 '-DDEBUG_EFM=1' \
 '-DPSA_CRYPTO_PRINT=1' \
 '-DEFR32FG23B010F512IM48=1' \
 '-DSL_CODE_COMPONENT_SYSTEM=system' \
 '-DHARDWARE_BOARD_DEFAULT_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_2_RF_BANDS=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_915=1' \
 '-DHFXO_FREQ=39000000' \
 '-DSL_BOARD_NAME="BRD2600A"' \
 '-DSL_BOARD_REV="A02"' \
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
 '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_trustzone_config.h>' \
 '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_TRUSTZONE_NONSECURE=1' \
 '-DNO_CRYPTO_ACCELERATION=1' \
 '-DTFM_CONFIG_SL_SECURE_LIBRARY=1' \
 '-DTZ_SERVICE_CONFIG_PRESENT=1'

INCLUDES += \
 -Iconfig \
 -Iconfig/export \
 -Iautogen \
 -Iautogen/export \
 -I. \
 -I../tz_psa_crypto_ecdh_s/autogen/export \
 -I../tz_psa_crypto_ecdh_s/config/export \
 -I$(SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Include \
 -I$(SDK_PATH)/platform/common/inc \
 -I$(SDK_PATH)/hardware/board/inc \
 -I$(SDK_PATH)/platform/service/clock_manager/inc \
 -I$(SDK_PATH)/platform/service/clock_manager/src \
 -I$(SDK_PATH)/platform/CMSIS/Core/Include \
 -I$(SDK_PATH)/hardware/driver/configuration_over_swo/inc \
 -I$(SDK_PATH)/platform/driver/debug/inc \
 -I$(SDK_PATH)/platform/service/device_manager/inc \
 -I$(SDK_PATH)/platform/service/device_init/inc \
 -I$(SDK_PATH)/platform/emdrv/dmadrv/inc \
 -I$(SDK_PATH)/platform/emdrv/dmadrv/inc/s2_signals \
 -I$(SDK_PATH)/platform/emdrv/common/inc \
 -I$(SDK_PATH)/platform/emlib/inc \
 -I$(SDK_PATH)/platform/driver/gpio/inc \
 -I$(SDK_PATH)/platform/peripheral/inc \
 -I$(SDK_PATH)/platform/service/interrupt_manager/inc \
 -I$(SDK_PATH)/platform/service/interrupt_manager/src \
 -I$(SDK_PATH)/platform/service/interrupt_manager/inc/arm \
 -I$(SDK_PATH)/platform/service/iostream/inc \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/config \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/config/preset \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/inc \
 -I$(SDK_PATH)/util/third_party/mbedtls/include \
 -I$(SDK_PATH)/util/third_party/mbedtls/library \
 -I$(SDK_PATH)/platform/service/memory_manager/inc \
 -I$(SDK_PATH)/platform/service/memory_manager/src \
 -I$(SDK_PATH)/platform/service/mpu/inc \
 -I$(SDK_PATH)/platform/emdrv/nvm3/config \
 -I$(SDK_PATH)/util/third_party/printf \
 -I$(SDK_PATH)/util/third_party/printf/inc \
 -I$(SDK_PATH)/platform/security/sl_component/sl_psa_driver/inc \
 -I$(SDK_PATH)/platform/service/sl_main/inc \
 -I$(SDK_PATH)/platform/service/sl_main/src \
 -I$(SDK_PATH)/platform/service/sl_main/sl_system_compatibility/inc \
 -I$(SDK_PATH)/platform/security/sl_component/sl_trustzone/inc/common \
 -I$(SDK_PATH)/platform/security/sl_component/sl_trustzone/inc/secure \
 -I$(SDK_PATH)/platform/security/sl_component/sl_trustzone/inc/nonsecure \
 -I$(SDK_PATH)/util/third_party/trusted-firmware-m/interface/include \
 -I$(SDK_PATH)/platform/emdrv/nvm3/inc \
 -I$(SDK_PATH)/util/third_party

GROUP_START =-Wl,--start-group
GROUP_END =-Wl,--end-group

PROJECT_LIBS = \
 -lgcc \
 -lc \
 -lm \
 -lnosys \
 ../tz_psa_crypto_ecdh_s/artifact/trustzone_secure_library.o

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
	$(ECHO) @"$(POST_BUILD_EXE)" postbuild "./tz_psa_crypto_ecdh_ns.slpb" --parameter build_dir:"$(OUTPUT_DIR)"

####################################################################
# SDK Build Rules                                                  #
####################################################################
$(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_control_gpio.o: $(SDK_PATH)/hardware/board/src/sl_board_control_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/hardware/board/src/sl_board_control_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/hardware/board/src/sl_board_control_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_control_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_control_gpio.o

$(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_init.o: $(SDK_PATH)/hardware/board/src/sl_board_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/hardware/board/src/sl_board_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/hardware/board/src/sl_board_init.c
CDEPS += $(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_init.d
OBJS += $(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_init.o

$(OUTPUT_DIR)/sdk/hardware/driver/configuration_over_swo/src/sl_cos.o: $(SDK_PATH)/hardware/driver/configuration_over_swo/src/sl_cos.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/hardware/driver/configuration_over_swo/src/sl_cos.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/hardware/driver/configuration_over_swo/src/sl_cos.c
CDEPS += $(OUTPUT_DIR)/sdk/hardware/driver/configuration_over_swo/src/sl_cos.d
OBJS += $(OUTPUT_DIR)/sdk/hardware/driver/configuration_over_swo/src/sl_cos.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o: $(SDK_PATH)/platform/common/src/sl_assert.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_assert.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_assert.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_core_cortexm.o: $(SDK_PATH)/platform/common/src/sl_core_cortexm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_core_cortexm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_core_cortexm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_core_cortexm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_core_cortexm.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.o: $(SDK_PATH)/platform/common/src/sl_slist.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_slist.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_slist.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_string.o: $(SDK_PATH)/platform/common/src/sl_string.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_string.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_string.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_string.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_string.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.o: $(SDK_PATH)/platform/common/src/sl_syscalls.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_syscalls.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_syscalls.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.o

$(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG23/Source/startup_efr32fg23.o: $(SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Source/startup_efr32fg23.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Source/startup_efr32fg23.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Source/startup_efr32fg23.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG23/Source/startup_efr32fg23.d
OBJS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG23/Source/startup_efr32fg23.o

$(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG23/Source/system_efr32fg23.o: $(SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Source/system_efr32fg23.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Source/system_efr32fg23.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Source/system_efr32fg23.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG23/Source/system_efr32fg23.d
OBJS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG23/Source/system_efr32fg23.o

$(OUTPUT_DIR)/sdk/platform/driver/debug/src/sl_debug_swo.o: $(SDK_PATH)/platform/driver/debug/src/sl_debug_swo.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/driver/debug/src/sl_debug_swo.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/driver/debug/src/sl_debug_swo.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/driver/debug/src/sl_debug_swo.d
OBJS += $(OUTPUT_DIR)/sdk/platform/driver/debug/src/sl_debug_swo.o

$(OUTPUT_DIR)/sdk/platform/driver/gpio/src/sl_gpio.o: $(SDK_PATH)/platform/driver/gpio/src/sl_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/driver/gpio/src/sl_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/driver/gpio/src/sl_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/driver/gpio/src/sl_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/driver/gpio/src/sl_gpio.o

$(OUTPUT_DIR)/sdk/platform/emdrv/dmadrv/src/dmadrv.o: $(SDK_PATH)/platform/emdrv/dmadrv/src/dmadrv.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/dmadrv/src/dmadrv.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/dmadrv/src/dmadrv.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/dmadrv/src/dmadrv.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/dmadrv/src/dmadrv.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.o: $(SDK_PATH)/platform/emlib/src/em_cmu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_cmu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_cmu.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.o: $(SDK_PATH)/platform/emlib/src/em_emu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_emu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_emu.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_eusart.o: $(SDK_PATH)/platform/emlib/src/em_eusart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_eusart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_eusart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_eusart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_eusart.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.o: $(SDK_PATH)/platform/emlib/src/em_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_ldma.o: $(SDK_PATH)/platform/emlib/src/em_ldma.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_ldma.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_ldma.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_ldma.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_ldma.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o: $(SDK_PATH)/platform/emlib/src/em_system.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_system.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_system.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o

$(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_eusart.o: $(SDK_PATH)/platform/peripheral/src/sl_hal_eusart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/peripheral/src/sl_hal_eusart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/peripheral/src/sl_hal_eusart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_eusart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_eusart.o

$(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.o: $(SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.o

$(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_prs.o: $(SDK_PATH)/platform/peripheral/src/sl_hal_prs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/peripheral/src/sl_hal_prs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/peripheral/src/sl_hal_prs.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_prs.d
OBJS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_prs.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_ns_interface.o: $(SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_ns_interface.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_ns_interface.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_ns_interface.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_ns_interface.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_ns_interface.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_ns.o: $(SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_ns.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_ns.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_ns.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_ns.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_nvm3_ns.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_ns.o: $(SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_ns.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_ns.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_ns.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_ns.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_trustzone/src/sli_tz_service_syscfg_ns.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager.o: $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_hal_s2.o: $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_hal_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_hal_s2.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init.o: $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.o: $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.o

$(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s2.o: $(SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s2.o

$(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s2.o: $(SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s2.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/clocks/sl_device_clock_efr32xg23.o: $(SDK_PATH)/platform/service/device_manager/clocks/sl_device_clock_efr32xg23.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_manager/clocks/sl_device_clock_efr32xg23.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_manager/clocks/sl_device_clock_efr32xg23.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/clocks/sl_device_clock_efr32xg23.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/clocks/sl_device_clock_efr32xg23.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg23.o: $(SDK_PATH)/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg23.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg23.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg23.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg23.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg23.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_clock.o: $(SDK_PATH)/platform/service/device_manager/src/sl_device_clock.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_manager/src/sl_device_clock.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_manager/src/sl_device_clock.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_clock.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_clock.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_gpio.o: $(SDK_PATH)/platform/service/device_manager/src/sl_device_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_manager/src/sl_device_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_manager/src/sl_device_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_gpio.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_peripheral.o: $(SDK_PATH)/platform/service/device_manager/src/sl_device_peripheral.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_manager/src/sl_device_peripheral.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_manager/src/sl_device_peripheral.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_peripheral.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_peripheral.o

$(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.o: $(SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.o: $(SDK_PATH)/platform/service/iostream/src/sl_iostream.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/iostream/src/sl_iostream.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/iostream/src/sl_iostream.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_eusart.o: $(SDK_PATH)/platform/service/iostream/src/sl_iostream_eusart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/iostream/src/sl_iostream_eusart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/iostream/src/sl_iostream_eusart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_eusart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_eusart.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_retarget_stdio.o: $(SDK_PATH)/platform/service/iostream/src/sl_iostream_retarget_stdio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/iostream/src/sl_iostream_retarget_stdio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/iostream/src/sl_iostream_retarget_stdio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_retarget_stdio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_retarget_stdio.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_uart.o: $(SDK_PATH)/platform/service/iostream/src/sl_iostream_uart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/iostream/src/sl_iostream_uart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/iostream/src/sl_iostream_uart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_uart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_uart.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool_common.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool_common.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool_common.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool_common.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_retarget.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_retarget.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_retarget.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_retarget.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_retarget.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_retarget.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sli_memory_manager_common.o: $(SDK_PATH)/platform/service/memory_manager/src/sli_memory_manager_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sli_memory_manager_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sli_memory_manager_common.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sli_memory_manager_common.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sli_memory_manager_common.o

$(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu_s2.o: $(SDK_PATH)/platform/service/mpu/src/sl_mpu_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/mpu/src/sl_mpu_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/mpu/src/sl_mpu_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu_s2.o

$(OUTPUT_DIR)/sdk/platform/service/sl_main/sl_system_compatibility/src/sl_system_compatibility.o: $(SDK_PATH)/platform/service/sl_main/sl_system_compatibility/src/sl_system_compatibility.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sl_main/sl_system_compatibility/src/sl_system_compatibility.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sl_main/sl_system_compatibility/src/sl_system_compatibility.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/sl_system_compatibility/src/sl_system_compatibility.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/sl_system_compatibility/src/sl_system_compatibility.o

$(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init.o: $(SDK_PATH)/platform/service/sl_main/src/sl_main_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sl_main/src/sl_main_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sl_main/src/sl_main_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init.o

$(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init_memory.o: $(SDK_PATH)/platform/service/sl_main/src/sl_main_init_memory.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sl_main/src/sl_main_init_memory.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sl_main/src/sl_main_init_memory.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init_memory.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init_memory.o

$(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_process_action.o: $(SDK_PATH)/platform/service/sl_main/src/sl_main_process_action.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sl_main/src/sl_main_process_action.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sl_main/src/sl_main_process_action.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_process_action.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_process_action.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.o: $(SDK_PATH)/util/third_party/mbedtls/library/constant_time.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/constant_time.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/constant_time.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform.o: $(SDK_PATH)/util/third_party/mbedtls/library/platform.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/platform.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/platform.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform_util.o: $(SDK_PATH)/util/third_party/mbedtls/library/platform_util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/platform_util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/platform_util.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform_util.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform_util.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_util.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.o: $(SDK_PATH)/util/third_party/mbedtls/library/threading.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/threading.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/threading.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.o

$(OUTPUT_DIR)/sdk/util/third_party/printf/printf.o: $(SDK_PATH)/util/third_party/printf/printf.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/printf/printf.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/printf/printf.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/printf/printf.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/printf/printf.o

$(OUTPUT_DIR)/sdk/util/third_party/printf/src/iostream_printf.o: $(SDK_PATH)/util/third_party/printf/src/iostream_printf.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/printf/src/iostream_printf.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/printf/src/iostream_printf.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/printf/src/iostream_printf.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/printf/src/iostream_printf.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/interface/src/tfm_crypto_func_api.o: $(SDK_PATH)/util/third_party/trusted-firmware-m/interface/src/tfm_crypto_func_api.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/trusted-firmware-m/interface/src/tfm_crypto_func_api.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/trusted-firmware-m/interface/src/tfm_crypto_func_api.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/interface/src/tfm_crypto_func_api.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/interface/src/tfm_crypto_func_api.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/interface/src/tfm_its_func_api.o: $(SDK_PATH)/util/third_party/trusted-firmware-m/interface/src/tfm_its_func_api.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/trusted-firmware-m/interface/src/tfm_its_func_api.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/trusted-firmware-m/interface/src/tfm_its_func_api.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/interface/src/tfm_its_func_api.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/interface/src/tfm_its_func_api.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/common/tfm_ns_interface.o: $(SDK_PATH)/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/common/tfm_ns_interface.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/common/tfm_ns_interface.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/common/tfm_ns_interface.c
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

$(OUTPUT_DIR)/project/app_psa_crypto_ecdh.o: app_psa_crypto_ecdh.c
	@$(POSIX_TOOL_PATH)echo 'Building app_psa_crypto_ecdh.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ app_psa_crypto_ecdh.c
CDEPS += $(OUTPUT_DIR)/project/app_psa_crypto_ecdh.d
OBJS += $(OUTPUT_DIR)/project/app_psa_crypto_ecdh.o

$(OUTPUT_DIR)/project/app_psa_crypto_key.o: app_psa_crypto_key.c
	@$(POSIX_TOOL_PATH)echo 'Building app_psa_crypto_key.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ app_psa_crypto_key.c
CDEPS += $(OUTPUT_DIR)/project/app_psa_crypto_key.d
OBJS += $(OUTPUT_DIR)/project/app_psa_crypto_key.o

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