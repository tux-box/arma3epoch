#!/bin/bash
# workshop_download_item 301650 656993383
# arma desktop ID= 107410 https://steamcommunity.com/app/107410/workshop/
# arma server ID= 
# epoch mod ID=421839251

appID="107410"
modID="421839251"
modName="@epoch"
${STEAMCMD_DIR}/steamcmd \
+login ${USERNAME} ${PASSWRD} \
+force_install_dir ${ARMA_DIR} \
+app_update "233780" \
+workshop_download_item ${GAME_ID} ${modID} validate \
+quit

echo ---Reanaming file to match mod name----
mv  ${ARMA_DIR}/${modID} ${ARMA_DIR}/${modName}
