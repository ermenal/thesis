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
 thesis_project_s \
 thesis_project_ns

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
	$(ECHO) @"$(POST_BUILD_EXE)" postbuild "./thesis_project.slpb"

# Per Project Build Commands
thesis_project_s:
	@echo 'Running thesis_project_s/thesis_project_s.Makefile'
	$(ECHO)@$(MAKE) -C thesis_project_s -f thesis_project_s.Makefile $(CMD_ARGS)

thesis_project_ns:
	@echo 'Running thesis_project_ns/thesis_project_ns.Makefile'
	$(ECHO)@$(MAKE) -C thesis_project_ns -f thesis_project_ns.Makefile $(CMD_ARGS)

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=eJylUttKw0AQ/ZUliNQHM62+1aiI9SGQtGIqKATCdjPa1c1uzGyNIP67o717AcHHOTm3nclrkMXpZRKfx+PbIhtfD+JRkY2S63E8GhbpaHCRBP0gOn2pjHjGhrSzx3nQC7t5INAqV2p7z8BZdh7HeXB6ktsozZyZeSaSYJWl/gtppky9r/sAbduG7WHomns46HZ7cJMmmZpiJfe1JS+tQnZmRd+6oayQaqlwTkickn6ev+FF2sgJhcpVQATL6BCVa9iJ+wgR0QL9nHheslJXzgxe4R02/BYkoUs2J6PC1jWPn9FhKb3MA1hJB+kA77TVH/rf+Qs6C2pHfjLTpsw81iuYP6zBnQ63r6QtsdkTK77YfZo5f7TTWbbfAz9F0lTUjXtA5UMy9WROiuB7RAQ/R0cLubC8Xq6/bVoQr9+sNw1TVyFgU6GV5ksB+C6Fv8bYf+TYjaAIti4yvzdsHDyC9f/IY/D2DgtDBrs==END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA