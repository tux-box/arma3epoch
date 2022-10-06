#!/bin/bash
# workshop_download_item 301650 656993383
# arma desktop ID= 107410 https://steamcommunity.com/app/107410/workshop/
# arma server ID= 
# epoch mod ID=421839251

APP_UPDATE="107410"
WORKSHOP_DOWNLOAD_ITEM="421839251"
MOD_NAME="@epoch"

${STEAMCMD_DIR}/steamcmd \
+force_install_dir ${FORCE_INSTALL_DIR} \
+login ${USERNAME} ${PASSWRD} \
+app_update ${APP_UPDATE} \
+workshop_download_item ${APP_UPDATE} ${WORKSHOP_DOWNLOAD_ITEM} validate \
+quit
echo ---Creating Symbolic link for ${MOD_NAME}----
ln -s /root/.steam/SteamApps/workshop/content/${APP_UPDATE}/${WORKSHOP_DOWNLOAD_ITEM} ${FORCE_INSTALL_DIR}/${MOD_NAME}