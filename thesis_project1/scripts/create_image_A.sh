#!/bin/bash

cd image_slot_A/ && ./scripts/clean.sh && ./scripts/build.sh && cd .. && commander-cli convert image_slot_A/artifact/rtz_ws-combined.s37 -o image_A.bin && xxd -i image_A.bin > rail_soc_empty/ota_image_A.h
