[36, 94](../image_slot_B/rtz_s/mijn_tz_setup.c)
sed -i 's/#define NS_FLASH_BEGIN 0x08026000UL/#define NS_FLASH_BEGIN 0x08062000UL/' image_slot_B/rtz_s/mijn_tz_setup.c
sed -i 's/#define FLASH_BASE_WITH_FSB 0x08008000UL/#define FLASH_BASE_WITH_FSB 0x08044000UL/' image_slot_B/rtz_s/mijn_tz_setup.c

[390](../image_slot_B/rtz_s/simplicity_sdk_2025.6.2/platform/security/sl_component/sl_trustzone/src/sli_tz_secure_main.c)
sed -i 's/In secure main/SLOT B: In secure main/' image_slot_B/rtz_s/simplicity_sdk_2025.6.2/platform/security/sl_component/sl_trustzone/src/sli_tz_secure_main.c

[390](../image_slot_A/rtz_s/simplicity_sdk_2025.6.2/platform/security/sl_component/sl_trustzone/src/sli_tz_secure_main.c)
sed -i 's/In secure main/SLOT A: In secure main/' image_slot_A/rtz_s/simplicity_sdk_2025.6.2/platform/security/sl_component/sl_trustzone/src/sli_tz_secure_main.c

[71, 81](../image_slot_B/rtz_ns/main.c)
sed -i 's/In NS main/SLOT B: In NS main/g' image_slot_B/rtz_ns/main.c


[71, 81](../image_slot_A/rtz_ns/main.c)
sed -i 's/In NS main/SLOT A: In NS main/g' image_slot_A/rtz_ns/main.c


[const toevoegen](../rail_soc_empty/ota_image_A.h)
sed -i 's/unsigned/const unsigned/' rail_soc_empty/ota_image_A.h
[const toevoegen](../rail_soc_empty/ota_image_B.h)
sed -i 's/unsigned/const unsigned/' rail_soc_empty/ota_image_B.h