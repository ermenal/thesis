#!/bin/bash

# Clean TZ project en empty rail
# Build TZ project, slot A en B, build empty rail
# Flash TZ project op nieuw board, flash empty rail op oud board
# Open vcom terminals voor nieuw en oud board

cd ../thesis_project1/ && ./scripts/helemaal_refresh.sh && ./scripts/flash_both_new.sh && cd rail_soc_empty/ && ./scripts/flash_oud.sh && cd ../../tools/ && ./scripts/both.sh