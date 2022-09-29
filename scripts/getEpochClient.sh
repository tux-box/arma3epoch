#!/bin/bash
# workshop_download_item 301650 656993383
# arma desktop ID= 107410 https://steamcommunity.com/app/107410/workshop/
# arma server ID= 
# epoch mod ID=421839251

DESKTOP_ARMA_ID="107410"
MOD_ID="421839251"
MOD_NAME="@epoch"

${STEAMCMD_DIR}/steamcmd \
+force_install_dir ${ARMA_DIR} \
+login ${USERNAME} ${PASSWRD} \
+app_update ${GAME_ID} \
+workshop_download_item ${DESKTOP_ARMA_ID} ${MOD_ID} \
+quit

cat /root/.steam/logs/workshop_log.txt

echo ---Reanaming file to match mod name----
ln -s  /serverdata/serverfiles/steamapps/workshop/${MOD_ID} ${ARMA_DIR}/${MOD_NAME}
