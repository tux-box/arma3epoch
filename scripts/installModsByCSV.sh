#!/bin/bash
#Read a csv and install the mods listed.
DESKTOP_ARMA_ID="107410"

while IFS=';' read -r mod_ID mod_Name; do
 ${STEAMCMD_DIR}/steamcmd +login ${USERNAME} ${PASSWRD} +app_update ${GAME_ID} +workshop_download_item ${DESKTOP_ARMA_ID} ${MOD_ID} +quit
 echo ---Creating Symbolic link for ${MOD_NAME}----
 ln -s  /serverdata/serverfiles/steamapps/workshop/${MOD_ID} ${ARMA_DIR}/${MOD_NAME}
done < modlist.csv

