#!/bin/bash
# workshop_download_item 301650 656993383
# arma desktop ID= 107410 https://steamcommunity.com/app/107410/workshop/
# arma server ID= 233780
# epoch mod ID=421839251

#cleaning up space for install
rm -r ${FORCE_INSTALL_DIR}/steamapps

DESKTOP_ARMA_ID="107410"
SERVER_ARMA_ID="233780" #current ${GAME_ID} 
MOD_ID="421839251"
MOD_NAME="@epoch"

APP_UPDATE=${DESKTOP_ARMA_ID}

${STEAMCMD_DIR}/steamcmd \
+force_install_dir ${FORCE_INSTALL_DIR} \
+login ${USERNAME} ${PASSWRD} \
+app_update ${APP_UPDATE} validate \
+quit

#cleaning up space for more installs
rm -r ${FORCE_INSTALL_DIR}/steamapps