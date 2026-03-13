#!/bin/bash 

cd rtz/ && make -f rtz_ws.solution.Makefile -j 8 && cd ../fsb/ && make -f fsb_baremetal.Makefile -j 8
