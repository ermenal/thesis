#!/bin/bash

set -e

FSB_IMAGE="fsb/build/debug/fsb_baremetal.s37"
SLOT_A_IMAGE="image_slot_A/artifact/rtz_ws-combined.s37"
SLOT_B_IMAGE="image_slot_B/artifact/rtz_ws-combined.s37"

if [ -f "$SLOT_B_IMAGE" ]; then
	echo "Merging FSB + slot A + slot B into production_image.hex"
	commander-cli convert "$FSB_IMAGE" "$SLOT_A_IMAGE" "$SLOT_B_IMAGE" -o production_image.hex
else
	echo "Slot B artifact not found, merging only FSB + slot A"
	commander-cli convert "$FSB_IMAGE" "$SLOT_A_IMAGE" -o production_image.hex
fi
