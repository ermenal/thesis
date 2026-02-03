#!/bin/bash 

cd rtz/ && make -f rtz_ws.solution.Makefile && cd ../fsb/ && make -f fsb_baremetal.Makefile
