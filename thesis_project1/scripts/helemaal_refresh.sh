#!/bin/bash

./scripts/clean_both.sh && ./scripts/build_both.sh && ./scripts/merge.sh && rm -rf image_slot_A/ && cp -r rtz/ image_slot_A/ && rm -rf image_slot_B/ && cp -r rtz/ image_slot_B/ && cp slot_B_files/tz_secure_memory_autogen.h image_slot_B/rtz_s/autogen/tz_secure_memory_autogen.h && cp slot_B_files/slot_B_secure_linkerfile.ld image_slot_B/rtz_s/autogen/linkerfile.ld && cp slot_B_files/slot_B_nonsecure_linkerfile.ld image_slot_B/rtz_ns/autogen/linkerfile.ld && sed -i 's/#define NS_FLASH_BEGIN 0x08026000UL/#define NS_FLASH_BEGIN 0x08062000UL/' image_slot_B/rtz_s/mijn_tz_setup.c && sed -i 's/#define FLASH_BASE_WITH_FSB 0x08008000UL/#define FLASH_BASE_WITH_FSB 0x08044000UL/' image_slot_B/rtz_s/mijn_tz_setup.c && sed -i 's/In secure main/SLOT B: In secure main/' image_slot_B/rtz_s/simplicity_sdk_2025.6.2/platform/security/sl_component/sl_trustzone/src/sli_tz_secure_main.c && sed -i 's/In secure main/SLOT A: In secure main/' image_slot_A/rtz_s/simplicity_sdk_2025.6.2/platform/security/sl_component/sl_trustzone/src/sli_tz_secure_main.c && sed -i 's/In NS main/SLOT B: In NS main/g' image_slot_B/rtz_ns/main.c && sed -i 's/In NS main/SLOT A: In NS main/g' image_slot_A/rtz_ns/main.c && ./scripts/create_image_A.sh && ./scripts/create_image_B.sh && sed -i 's/unsigned/const unsigned/' rail_soc_empty/ota_image_A.h && sed -i 's/unsigned/const unsigned/' rail_soc_empty/ota_image_B.h && cd rail_soc_empty/ && ./scripts/clean.sh && ./scripts/build.sh && cd ..





# Voor main production image: 
#./scripts/clean_both.sh && ./scripts/build_both.sh && ./scripts/merge.sh

# Voor rail_soc_empty en image A en B: 
#rm -rf image_slot_A/ && cp -r rtz/ image_slot_A/ && rm -rf image_slot_B/ && cp -r rtz/ image_slot_B/ && cp slot_B_files/tz_secure_memory_autogen.h image_slot_B/rtz_s/autogen/tz_secure_memory_autogen.h && cp slot_B_files/slot_B_secure_linkerfile.ld image_slot_B/rtz_s/autogen/linkerfile.ld && cp slot_B_files/slot_B_nonsecure_linkerfile.ld image_slot_B/rtz_ns/autogen/linkerfile.ld

# Dan manueel image files veranderen
#####################
#sed -i 's/#define NS_FLASH_BEGIN 0x08026000UL/#define NS_FLASH_BEGIN 0x08062000UL/' image_slot_B/rtz_s/mijn_tz_setup.c && sed -i 's/#define FLASH_BASE_WITH_FSB 0x08008000UL/#define FLASH_BASE_WITH_FSB 0x08044000UL/' image_slot_B/rtz_s/mijn_tz_setup.c && sed -i 's/In secure main/SLOT B: In secure main/' image_slot_B/rtz_s/simplicity_sdk_2025.6.2/platform/security/sl_component/sl_trustzone/src/sli_tz_secure_main.c && sed -i 's/In secure main/SLOT A: In secure main/' image_slot_A/rtz_s/simplicity_sdk_2025.6.2/platform/security/sl_component/sl_trustzone/src/sli_tz_secure_main.c && sed -i 's/In NS main/SLOT B: In NS main/g' image_slot_B/rtz_ns/main.c && sed -i 's/In NS main/SLOT A: In NS main/g' image_slot_A/rtz_ns/main.c

# Dan beide images builden: 
#./scripts/create_image_A.sh && ./scripts/create_image_B.sh

# Dan beide images const bijgooien
######################
#sed -i 's/unsigned/const unsigned/' rail_soc_empty/ota_image_A.h && sed -i 's/unsigned/const unsigned/' rail_soc_empty/ota_image_B.h
# Dan rail_soc builden: 
#cd rail_soc_empty/ && ./scripts/clean.sh && ./scripts/build.sh && cd ..