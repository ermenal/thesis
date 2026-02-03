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
 '-DSL_BOARD_REV="A03"' \
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
 '-DSL_BOARD_REV="A03"' \
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
 -I../rtz_s/autogen/export \
 -I../rtz_s/config/export \
 -I$(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFR32FG23/Include \
 -I$(COPIED_SDK_PATH)/platform/common/inc \
 -I$(COPIED_SDK_PATH)/hardware/board/inc \
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
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/config \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/config/preset \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/inc \
 -I$(COPIED_SDK_PATH)/util/third_party/mbedtls/include \
 -I$(COPIED_SDK_PATH)/util/third_party/mbedtls/library \
 -I$(COPIED_SDK_PATH)/platform/service/memory_manager/inc \
 -I$(COPIED_SDK_PATH)/platform/service/memory_manager/src \
 -I$(COPIED_SDK_PATH)/util/third_party/printf \
 -I$(COPIED_SDK_PATH)/util/third_party/printf/inc \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_psa_driver/inc \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/inc \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/src \
 -I$(COPIED_SDK_PATH)/platform/service/sl_main/sl_system_compatibility/inc \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/inc/common \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/inc/secure \
 -I$(COPIED_SDK_PATH)/platform/security/sl_component/sl_trustzone/inc/nonsecure \
 -I$(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/interface/include \
 -I$(COPIED_SDK_PATH)/util/third_party

GROUP_START =-Wl,--start-group
GROUP_END =-Wl,--end-group

PROJECT_LIBS = \
 -lgcc \
 -lc \
 -lm \
 -lnosys \
 ../rtz_s/artifact/trustzone_secure_library.o

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