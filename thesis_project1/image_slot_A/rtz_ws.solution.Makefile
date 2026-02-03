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
	$(ECHO) @"$(POST_BUILD_EXE)" postbuild "./rtz_ws.slpb"

# Per Project Build Commands
rtz_s:
	@echo 'Running rtz_s/rtz_s.Makefile'
	$(ECHO)@$(MAKE) -C rtz_s -f rtz_s.Makefile $(CMD_ARGS)

rtz_ns:
	@echo 'Running rtz_ns/rtz_ns.Makefile'
	$(ECHO)@$(MAKE) -C rtz_ns -f rtz_ns.Makefile $(CMD_ARGS)

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=eJytUktP3DAQ/itWhCo4kFnobUmLEMshUsJWeJFaKVLkdQbW4Nipx2l4iP/OwD5RH6ceZ+Z7ecbPiczLb0V+ns9+1HJ2PcmntZwW17N8elmX08lFkYyT7PShteIXBjLefamSo3RUJQKd9o1xt9w4k+d5XiWnXyuXldLbPjKQBLMcjR/IMGQRYzcGGIYhHT6nPtzC8Wh0BN/LQuoFturQOIrKaWRlZoydv1QtUqc0LgGF1you/Xe0yFg1p1T7FohgbZ2i9oGVOI8QGa267xXXa1Tpm97iFd5g4LcgCdOwOFmdDj7cv1unjYqqSmBDnZQTvDHOvPH/jl/BmdB5ivPe2EZG7DZtHmybe/ucvlWuwXAgNnjx6Wfv48ne/jr9AYT4VA+Uku3my2EGv0tn8GfLrAv+DnUUjtfKsd/EiHdtt2uFhW8RMLTolAVp2s4abeKjjH1jPJAOKupFHZ9WSWClAf80cf/Dxe3YZPDhCssbw86RM9j+QS6Tl1fT0AFQ=END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA