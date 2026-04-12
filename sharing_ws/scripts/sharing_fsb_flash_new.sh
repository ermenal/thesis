#!/bin/bash

set -e

FSB_IMAGE="empty/build/debug/empty.s37"
SLOT_A_IMAGE="sharing/artifact/sharing-combined.s37"
# SLOT_B_IMAGE="image_slot_B/artifact/rtz_ws-combined.s37"

cd sharing/ && make -f sharing.solution.Makefile clean && make -f sharing.solution.Makefile -j8 all
cd ../empty/ && make -f empty.Makefile clean && make -f empty.Makefile -j8 all
cd ../

if [ -f "$SLOT_B_IMAGE" ]; then
	echo "Merging FSB + slot A + slot B into production_image.hex"
	commander-cli convert "$FSB_IMAGE" "$SLOT_A_IMAGE" "$SLOT_B_IMAGE" -o production_image.hex
else
	echo "Slot B artifact not found, merging only FSB + slot A"
	commander-cli convert "$FSB_IMAGE" "$SLOT_A_IMAGE" -o production_image.hex
fi

echo "Flashing production image to device"
commander-cli flash --masserase --serialno 440330966 production_image.hex && gnome-terminal -- commander-cli vcom connect --serialno 440330966