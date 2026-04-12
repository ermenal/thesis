#!/bin/bash 

set -e

cd rtz/ && make -f rtz_ws.solution.Makefile -j 8 && cd ../fsb/ && make -f fsb_baremetal.Makefile -j 8 && cd ..

if [ -f image_slot_A/rtz_ws.solution.Makefile ]; then
	echo "Building slot A workspace..."
	cd image_slot_A/ && make -f rtz_ws.solution.Makefile -j 8 && cd ..
fi

if [ -f image_slot_B/rtz_ws.solution.Makefile ]; then
	echo "Building slot B workspace..."
	cd image_slot_B/ && make -f rtz_ws.solution.Makefile -j 8 && cd ..
fi
