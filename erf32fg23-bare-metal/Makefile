#-------------------------------------------------------------------------------
# Toolchain & sources
#-------------------------------------------------------------------------------

AR      := arm-none-eabi-gcc-ar
CC      := arm-none-eabi-gcc
CXX     := arm-none-eabi-g++
OBJCOPY := arm-none-eabi-objcopy
OBJDUMP := arm-none-eabi-objdump
LD      := arm-none-eabi-gcc

FLASH     := commander-cli flash
DBG       := gdb
DBGSERVER := JLinkGDBServer

SRC_DIR := ./src
SRC_DIR += ./sdk/platform/Device/SiliconLabs/EFR32FG23/Source
SRC_DIR += ./sdk/platform/common/toolchain/src
SRC_DIR += ./sdk/platform/common/src
SRC_DIR += ./sdk/platform/emlib/src

INC_DIR := ./src
INC_DIR += ./sdk/platform/CMSIS/Core/Include
INC_DIR += ./sdk/platform/Device/SiliconLabs/EFR32FG23/Include
INC_DIR += ./sdk/platform/common/toolchain/inc sdk/platform/common/toolchain/config/standard
INC_DIR += ./sdk/platform/common/inc
INC_DIR += ./sdk/platform/emlib/inc
INC_DIR += ./sdk/hardware/board/config/brd2600a
INC_DIR += $(wildcard ./sdk/platform/*/inc) $(wildcard ./sdk/platform/*/*/inc) $(wildcard ./sdk/platform/*/*/*/inc)

RES_DIR := ./res
OUT_DIR := ./build

DEVICE  := EFR32FG23B010F512IM48

# Secure project
PROJECT_S    := tz_secure
TARGET_S_ELF := $(OUT_DIR)/$(PROJECT_S).elf
SRCS_S       := main_s.c
SRCS_S       += startup_efr32fg23.c system_efr32fg23.c
SRCS_S       += sl_memory.c sl_syscalls.c
SRCS_S       += em_core.c em_usart.c em_cmu.c em_gpio.c em_lcd.c
OBJS_S       := $(SRCS_S:%.c=$(OUT_DIR)/%.o)

# Non-secure project
PROJECT_NS    := tz_nonsecure
TARGET_NS_ELF := $(OUT_DIR)/$(PROJECT_NS).elf
SRCS_NS       := main_ns.c
SRCS_NS       += startup_efr32fg23.c system_efr32fg23.c
SRCS_NS       += sl_memory.c sl_syscalls.c
OBJS_NS       := $(SRCS_NS:%.c=$(OUT_DIR)/%.o)


COMMON_DEFS = -D$(DEVICE)=1
C_DEFS      = $(COMMON_DEFS)
CXX_DEFS    = $(COMMON_DEFS)
ASM_DEFS    = $(COMMON_DEFS)

COMMON_FLAGS = -mcpu=cortex-m33 -mthumb -mfpu=fpv5-sp-d16 -mfloat-abi=hard $(INC_DIR:%=-I%)
C_FLAGS      = $(COMMON_FLAGS) $(C_DEFS) -std=c99 -Wall -Wextra -Os -fdata-sections -ffunction-sections -fomit-frame-pointer \
               -mcmse --specs=nano.specs -g
CXX_FLAGS    = $(COMMON_FLAGS) $(CXX_DEFS) -std=c++11 -fno-rtti -fno-exceptions -Wall -Wextra -Os -fdata-sections -ffunction-sections \
               -fomit-frame-pointer -mcmse --specs=nano.specs -g
ASM_FLAGS    = $(COMMON_FLAGS) $(ASM_DEFS) -x assembler-with-cpp

# Secure linker flags
LD_FLAGS_S   = $(COMMON_FLAGS) -T"$(RES_DIR)/linkerfile_s.ld" --specs=nano.specs -Xlinker -Map=$(OUT_DIR)/$(PROJECT_S).map \
               -Wl,--gc-sections  -Wl,--no-warn-rwx-segments

# Non-secure linker flags
LD_FLAGS_NS  = $(COMMON_FLAGS) -T"$(RES_DIR)/linkerfile_ns.ld" --specs=nano.specs -Xlinker -Map=$(OUT_DIR)/$(PROJECT_NS).map \
               -Wl,--gc-sections  -Wl,--no-warn-rwx-segments

#-------------------------------------------------------------------------------
# Support
#-------------------------------------------------------------------------------

VPATH = $(SRC_DIR)
vpath %.cpp $(SRC_DIR)
vpath %.s   $(SRC_DIR)
vpath %.h   $(INC_DIR)

# Command output is hidden by default, it can be enabled by
# setting VERBOSE=true on the commandline.
ifeq ($(VERBOSE),)
  ECHO = @
endif

.PHONY: all info build build-s build-ns dump dump-s dump-ns flash flash-s flash-ns debug debug-s debug-ns clean
all: flash

info:
	@echo "Secure sources: $(SRCS_S)"
	@echo "Non-secure sources: $(SRCS_NS)"
	@echo "------------------------------------------------------------"
	@echo "Device: $(DEVICE)"
	@echo "Secure target: $(TARGET_S_ELF)"
	@echo "Non-secure target: $(TARGET_NS_ELF)"

build: build-s build-ns

build-s: $(TARGET_S_ELF)
build-ns: $(TARGET_NS_ELF)

dump: dump-s
dump-s: $(TARGET_S_ELF:%.elf=%.dump)
dump-ns: $(TARGET_NS_ELF:%.elf=%.dump)

flash: $(TARGET_S_ELF:%.elf=%.hex) $(TARGET_NS_ELF:%.elf=%.hex)
	@echo "Flashing Secure and Non-Secure applications"
	$(ECHO)$(FLASH) -d $(DEVICE) $(TARGET_S_ELF:%.elf=%.hex)
	$(ECHO)$(FLASH) -d $(DEVICE) $(TARGET_NS_ELF:%.elf=%.hex)

flash-s: $(TARGET_S_ELF:%.elf=%.hex)
	@echo "Flashing $< to $(DEVICE)"
	$(ECHO)$(FLASH) -d $(DEVICE) $< 

flash-ns: $(TARGET_NS_ELF:%.elf=%.hex)
	@echo "Flashing $< to $(DEVICE)"
	$(ECHO)$(FLASH) -d $(DEVICE) $< 

debug: debug-s

debug-s: $(TARGET_S_ELF)
	# DOCS: https://wiki.segger.com/J-Link_GDB_Server#Command_line_options
	screen -dmS "GDBServer" $(DBGSERVER) -device $(DEVICE) -halt -if swd -nogui -silent -singlerun -strict -localhostonly 1 -port 2331
	$(DBG) -x res/gdbscript.txt $(TARGET_S_ELF)

debug-ns: $(TARGET_NS_ELF)
	# DOCS: https://wiki.segger.com/J-Link_GDB_Server#Command_line_options
	screen -dmS "GDBServer" $(DBGSERVER) -device $(DEVICE) -halt -if swd -nogui -silent -singlerun -strict -localhostonly 1 -port 2331
	$(DBG) -x res/gdbscript.txt $(TARGET_NS_ELF)

clean:
	@echo "Removing build artefacts"
	$(ECHO)$(RM) -rf $(OUT_DIR)

#-------------------------------------------------------------------------------
# Build
#-------------------------------------------------------------------------------

$(OUT_DIR)/%.o: %.c
	@echo "Building $<"
	@mkdir -p $(@D)
	$(ECHO)$(CC) $(C_FLAGS) -c -o $@ $<

$(OUT_DIR)/%.o: %.cpp
	@echo "Building $<"
	@mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXX_FLAGS) -c -o $@ $<

$(OUT_DIR)/%.o: %.s
	@echo "Building $<"
	@mkdir -p $(@D)
	$(ECHO)$(CC) $(ASM_FLAGS) -c -o $@ $<

#-------------------------------------------------------------------------------
# Link
#-------------------------------------------------------------------------------

$(TARGET_S_ELF): $(OBJS_S)
	@echo -e "Linking $@"
	@mkdir -p $(@D)
	$(ECHO)$(LD) $(LD_FLAGS_S) $(filter %.o,$^) -o $@

$(TARGET_NS_ELF): $(OBJS_NS)
	@echo -e "Linking $@"
	@mkdir -p $(@D)
	$(ECHO)$(LD) $(LD_FLAGS_NS) $(filter %.o,$^) -o $@

#-------------------------------------------------------------------------------
# Objcopy
#-------------------------------------------------------------------------------

$(OUT_DIR)/%.bin: $(OUT_DIR)/%.elf
	@echo "Copying $< to $@"
	@mkdir -p $(@D)
	$(ECHO)$(OBJCOPY) $< -O binary $@

$(OUT_DIR)/%.hex: $(OUT_DIR)/%.elf
	@echo "Copying $< to $@"
	@mkdir -p $(@D)
	$(ECHO)$(OBJCOPY) $< -O ihex $@

$(OUT_DIR)/%.s37: $(OUT_DIR)/%.elf
	@echo "Copying $< to $@"
	@mkdir -p $(@D)
	$(ECHO)$(OBJCOPY) $< -O srec $@

#-------------------------------------------------------------------------------
# Dump
#-------------------------------------------------------------------------------

$(OUT_DIR)/%.dump: $(OUT_DIR)/%.elf
	@echo "Dumping $<"
	@mkdir -p $(@D)
	$(ECHO)$(OBJDUMP) -d -g $< > $@