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
 tz_psa_crypto_ecdh_s \
 tz_psa_crypto_ecdh_ns

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
	$(ECHO) @"$(POST_BUILD_EXE)" postbuild "./tz_psa_crypto_ecdh_ws.slpb"

# Per Project Build Commands
tz_psa_crypto_ecdh_s:
	@echo 'Running tz_psa_crypto_ecdh_s/tz_psa_crypto_ecdh_s.Makefile'
	$(ECHO)@$(MAKE) -C tz_psa_crypto_ecdh_s -f tz_psa_crypto_ecdh_s.Makefile $(CMD_ARGS)

tz_psa_crypto_ecdh_ns:
	@echo 'Running tz_psa_crypto_ecdh_ns/tz_psa_crypto_ecdh_ns.Makefile'
	$(ECHO)@$(MAKE) -C tz_psa_crypto_ecdh_ns -f tz_psa_crypto_ecdh_ns.Makefile $(CMD_ARGS)

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=eJy9Ul1v1DAQ/CtWVKH2gewVJB6OQIV6PERKeghfpSJFinzOtmdwbON1mraI/8621/tAHBJPPO54ZnZ2vT8yWdafqvK8XHxp5eJyVs5bOa8uF+X8oq3ns49VNs2Ks7veiluMZLx712Sn+aTJBDrtO+NuGPggz8uyyc7eN66opbdDYiIJVjma3pFhyiqlMAUYxzEfX+c+3sCryeQUrupK6hX26qVxlJTTyM6smDp/oXqkoDSuCZXXKq3773mRsWpJufY9EMGmdY7aR3biPEIU9Iw+VVxvWLXvBouf8Rojz4IkTMfmZHU++vjtqXXeqaSaDLbSWT3Da+PMo/7v/Gc6C4KntByM7WTCsIX5YQceHXP6XrkO44nY8sWL74NPb4+ON+lPID20gVSr431IvkXdrdqRcrJhueYW8GenAg4nKEL0X1En4XjLPMUBb+KfsLulw8r3CBh7dMqCNH2wRpt0L9PQGQ+3b9rtFg4nPYTSbrf/lMn9j1BuL1UBv335+qBg76IK2B08l9nPX4aNLZY==END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA