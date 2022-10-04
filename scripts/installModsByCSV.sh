#!/bin/bash
#Read a csv and install the mods listed.
APP_UPDATE="107410"

while IFS=';' read -r mod_ID mod_Name; do
 ${STEAMCMD_DIR}/steamcmd \
 +login ${USERNAME} ${PASSWRD} \
 +app_update ${APP_UPDATE} \
 +workshop_download_item ${APP_UPDATE} ${MOD_ID} validate \
 +quit
 echo ---Creating Symbolic link for ${MOD_NAME}----
 ln -s  /serverdata/serverfiles/steamapps/workshop/${MOD_ID} ${FORCE_INSTALL_DIR}/${MOD_NAME}
done < modlist.csv

