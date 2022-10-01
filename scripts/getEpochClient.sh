#!/bin/bash
# workshop_download_item 301650 656993383
# arma desktop ID= 107410 https://steamcommunity.com/app/107410/workshop/
# arma server ID= 
# epoch mod ID=421839251

DESKTOP_ARMA_ID="107410"
MOD_ID="421839251"
MOD_NAME="@epoch"

${STEAMCMD_DIR}/steamcmd +login ${USERNAME} ${PASSWRD} +app_update ${DESKTOP_ARMA_ID} +workshop_download_item ${DESKTOP_ARMA_ID} ${MOD_ID} +quit
echo ---Creating Symbolic link for ${MOD_NAME}----
ln -s  /serverdata/serverfiles/steamapps/workshop/${MOD_ID} ${ARMA_DIR}/${MOD_NAME}