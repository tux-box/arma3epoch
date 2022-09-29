#!/bin/bash
# workshop_download_item 301650 656993383
# arma desktop ID= 107410 https://steamcommunity.com/app/107410/workshop/
# arma server ID= 
# epoch mod ID=421839251

DESKTOP_ARMA_ID="107410"
SERVER_ARMA_ID="233780" #current ${GAME_ID} 
MOD_ID="421839251"
MOD_NAME="@epoch"

${STEAMCMD_DIR}/steamcmd \
+force_install_dir ${ARMA_DIR} \
+login ${USERNAME} ${PASSWRD} \
+app_update ${GAME_ID} \
+quit