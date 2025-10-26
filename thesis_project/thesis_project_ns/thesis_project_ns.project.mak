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
 -I../thesis_project_s/autogen/export \
 -I../thesis_project_s/config/export \
 -I../thesis_project_s/inc \
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
 -I$(COPIED_SDK_PATH)/platform/service/mpu/inc \
 -I$(COPIED_SDK_PATH)/platform/emdrv/nvm3/config \
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
 -I$(COPIED_SDK_PATH)/platform/emdrv/nvm3/inc \
 -I$(COPIED_SDK_PATH)/util/third_party

GROUP_START =-Wl,--start-group
GROUP_END =-Wl,--end-group

PROJECT_LIBS = \
 -lgcc \
 -lc \
 -lm \
 -lnosys \
 ../thesis_project_s/artifact/trustzone_secure_library.o

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
	$(ECHO) @"$(POST_BUILD_EXE)" postbuild "./thesis_project_ns.slpb" --parameter build_dir:"$(OUTPUT_DIR)"

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

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/interface/src/tfm_its_func_api.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/interface/src/tfm_its_func_api.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/interface/src/tfm_its_func_api.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/interface/src/tfm_its_func_api.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/interface/src/tfm_its_func_api.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/interface/src/tfm_its_func_api.o

$(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/common/tfm_ns_interface.o: $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/common/tfm_ns_interface.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/common/tfm_ns_interface.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/common/tfm_ns_interface.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/common/tfm_ns_interface.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/trusted-firmware-m/platform/ext/target/siliconlabs/common/tfm_ns_interface.o

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
