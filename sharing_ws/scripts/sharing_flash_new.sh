#!/bin/bash

cd sharing/ && make -f sharing.solution.Makefile clean && make -f sharing.solution.Makefile -j8 all && commander-cli flash --masserase --serialno 440330966 artifact/sharing-combined.s37 && gnome-terminal -- commander-cli vcom connect --serialno 440330966  