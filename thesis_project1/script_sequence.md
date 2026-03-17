Kleine file voor mezelf om deftig bij te houden welke scripts te gebruiken

Sommige zijn outdated en ik ben te lui

thesis/tools/scripts/full.sh
Main board: 
    clean alles, copy rtz/ into slot_A en slot_B
    fix slot_B linkerfiles etc 
    sed voor juiste prints in beide slots beide worlds
    merge fsb + slot_A + slot_B naar production_image.hex
Updater board: 
    clean rail_soc
    na slot_A en slot_B succesvolle builds, create images
    sed voor const in beide rail_soc/image_A en B 
    build rail_soc
Dan flash production_image naar nieuwe board, rail_soc naar oud board
Dan open vcom terminals naar beide (scmder)


thesis_project_1/scripts/flash_nieuwe_image_versions.sh
    Assume juiste prints en linkerfiles van full.sh al done
    sed update slot_A en slot_B source files: increase SW en NSW image versions. +1 voor A, +2 voor B ... 
    clean en build slot_A en slot_B
    create slot A en B images, sed voor const
    clean en build rail_soc met nieuwe images
    flash rail_soc naar oud board.

thesis_project_1/scripts/increase_image_versions.sh
    Zelfde als vorige, maar zonder de clean en builds
    Gewoon source slot_A en slot_B files updaten