####################################################################
# Automatically-generated file. Do not edit!                       #
####################################################################
.SUFFIXES:				# ignore builtin rules
.NOTPARALLEL:
.PHONY: all debug release clean pre-build post-build

# Default goal
all: debug

####################################################################
# Definitions                                                      #
####################################################################

# Values set by the initial generation
SOLUTION_NAME = None
POST_BUILD_EXE_WIN = 
POST_BUILD_EXE_OSX = 
POST_BUILD_EXE_LINUX = /home/ermenal/.silabs/slt/installs/archive/commander/commander

# Pre-defined definitions in this file
ifeq ($(OS),Windows_NT)
  POST_BUILD_EXE ?= $(POST_BUILD_EXE_WIN)
else
  UNAME_S := $(shell uname -s)
  ifeq ($(UNAME_S),Darwin)
    POST_BUILD_EXE ?= $(POST_BUILD_EXE_OSX)
  else
    POST_BUILD_EXE ?= $(POST_BUILD_EXE_LINUX)
  endif
endif

# Command output is hidden by default, it can be enabled by
# setting VERBOSE=true on the commandline.
ifeq ($(VERBOSE),)
  ECHO = @
endif

####################################################################
# Define Project Makefiles                                         #
####################################################################
PROJECT_MAKEFILES = \
 rtz_s \
 rtz_ns

.PHONY: $(PROJECT_MAKEFILES)

####################################################################
# Rules                                                            #
####################################################################
clean: CMD_ARGS = clean
debug: CMD_ARGS = debug
release: CMD_ARGS = release

clean: $(PROJECT_MAKEFILES)

debug release: | pre-build $(PROJECT_MAKEFILES) post-build

# Generated Content
pre-build:
	# No pre-build defined

post-build:
ifeq ($(POST_BUILD_EXE),)
		$(error POST_BUILD_EXE is not defined. Post-Build cannot run. Please set the STUDIO_ADAPTER_PACK_PATH to the post-build tool when generating or override the variable for this makefile)
endif
	@echo 'Running Solution Post-Build'
	$(ECHO) @"$(POST_BUILD_EXE)" postbuild "./rtz.slpb"

# Per Project Build Commands
rtz_s:
	@echo 'Running rtz_s/rtz_s.Makefile'
	$(ECHO)@$(MAKE) -C rtz_s -f rtz_s.Makefile $(CMD_ARGS)

rtz_ns:
	@echo 'Running rtz_ns/rtz_ns.Makefile'
	$(ECHO)@$(MAKE) -C rtz_ns -f rtz_ns.Makefile $(CMD_ARGS)

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=eJydkltLxDAQhf9KKCL6YGfVt7Uq4vpQaF2xKygUSjYd3Wia1EzWiuJ/d3Sv4uXBpzKTc74zmfQ1KtL8IktP09FNVYyuBumwKobZ1Sgdnlf5cHCWRf0oOX5ujHhCT9rZwzLajXtlJNAqV2t7x42T4jRNy+j4qLRJXjgzDSwkwS5L/WfSLJmE0PYBuq6Lu/3Y+TvY6/V24TrPCjXBRu5oS0FahUxmR9+6c9kgtVLhTJA5JcMsf41F2sgxxco1QASL6BiV80zieYRIaN79rLheqHJXTw1e4i16vguS0DXDyai4c/7hMzquZZBlBEvrIB/grbb6w/+7fi5nQ+sojKfa1EXAdtnmg1VzY4unb6St0W+LpV5sPk5dONjYWky/DT68xGTa8ewkge/cBH7OS1rv7lEFYXmnPDOTKuJFm9VOYeIaBPQNWmkgTJA0zT9VRx/ZMHfBn1j7P65dAyfwZc2zR4S1V0xg9ZNxGb29A2bY9JA==END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA