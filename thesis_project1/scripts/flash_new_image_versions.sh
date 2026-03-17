#!/usr/bin/env bash

./scripts/increase_image_versions.sh

./scripts/create_image_A.sh
./scripts/create_image_B.sh
sed -i 's/unsigned/const unsigned/' rail_soc_empty/ota_image_A.h && sed -i 's/unsigned/const unsigned/' rail_soc_empty/ota_image_B.h
cd rail_soc_empty/ && ./scripts/clean.sh && ./scripts/build.sh && ./scripts/flash_oud.sh && cd ..