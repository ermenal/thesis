#!/bin/bash 

cd rtz/ && ./scripts/clean.sh && cd ../fsb && make -f fsb_baremetal.Makefile clean
