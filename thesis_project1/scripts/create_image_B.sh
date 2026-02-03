#!/bin/bash

cd image_slot_B/ && ./scripts/clean.sh && ./scripts/build.sh && cd .. && commander-cli convert image_slot_B/artifact/rtz_ws-combined.s37 -o image_B.bin && xxd -i image_B.bin > rail_soc_empty/ota_image_B.h
