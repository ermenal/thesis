#!/bin/bash

cd ../thesis_ws/rtz/ && make -f rtz.solution.Makefile clean && make -f rtz.solution.Makefile &&
    commander-cli flash --masserase artifact/rtz-combined.s37 && cd ../../tools/ && ./scripts/scmder_new.sh
