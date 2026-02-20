#!/bin/bash

./scripts/build_rtz.sh && 
    ./scripts/build_rail_soc_empty.sh &&
    ./scripts/flash_new_rtz.sh && 
    ./scripts/flash_old_rail_soc_empty.sh