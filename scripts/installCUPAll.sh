#!/bin/bash
# workshop_download_item 301650 656993383
# arma desktop ID= 107410 https://steamcommunity.com/app/107410/workshop/
# arma server ID= 
# epoch mod ID=421839251

# Use -mod line with quotes to support spaces in folder
# Example: -mod="@epoch;@CBA_A3;@CUP Units;@CUP Vehicles;@CUP Weapons;@CUP Terrains - Core;@CUP Terrains - Maps;"
# ToDo: Support CSV.

DESKTOP_ARMA_ID="107410"
MOD_ID="583496184"
MOD_NAME="@CUP Terrains - Core"
${STEAMCMD_DIR}/steamcmd +login ${USERNAME} ${PASSWRD} +app_update ${DESKTOP_ARMA_ID} +workshop_download_item ${DESKTOP_ARMA_ID} ${MOD_ID} +quit
echo ---Creating Symbolic link for ${MOD_NAME}----
ln -s  /serverdata/serverfiles/steamapps/workshop/${MOD_ID} ${FORCE_INSTALL_DIR}/${MOD_NAME}

DESKTOP_ARMA_ID="107410"
MOD_ID="583544987"
MOD_NAME="@CUP Terrains - Maps"
${STEAMCMD_DIR}/steamcmd +login ${USERNAME} ${PASSWRD} +app_update ${DESKTOP_ARMA_ID} +workshop_download_item ${DESKTOP_ARMA_ID} ${MOD_ID} +quit
echo ---Creating Symbolic link for ${MOD_NAME}----
ln -s  /serverdata/serverfiles/steamapps/workshop/${MOD_ID} ${FORCE_INSTALL_DIR}/${MOD_NAME}

DESKTOP_ARMA_ID="107410"
MOD_ID="541888371"
MOD_NAME="@CUP Vehicles"
${STEAMCMD_DIR}/steamcmd +login ${USERNAME} ${PASSWRD} +app_update ${DESKTOP_ARMA_ID} +workshop_download_item ${DESKTOP_ARMA_ID} ${MOD_ID} +quit
echo ---Creating Symbolic link for ${MOD_NAME}----
ln -s  /serverdata/serverfiles/steamapps/workshop/${MOD_ID} ${FORCE_INSTALL_DIR}/${MOD_NAME}

DESKTOP_ARMA_ID="107410"
MOD_ID="450814997"
MOD_NAME="@CBA_A3"
${STEAMCMD_DIR}/steamcmd +login ${USERNAME} ${PASSWRD} +app_update ${DESKTOP_ARMA_ID} +workshop_download_item ${DESKTOP_ARMA_ID} ${MOD_ID} +quit
echo ---Creating Symbolic link for ${MOD_NAME}----
ln -s  /serverdata/serverfiles/steamapps/workshop/${MOD_ID} ${FORCE_INSTALL_DIR}/${MOD_NAME}

DESKTOP_ARMA_ID="107410"
MOD_ID="497660133"
MOD_NAME="@CUP Weapons"
${STEAMCMD_DIR}/steamcmd +login ${USERNAME} ${PASSWRD} +app_update ${DESKTOP_ARMA_ID} +workshop_download_item ${DESKTOP_ARMA_ID} ${MOD_ID} +quit
echo ---Creating Symbolic link for ${MOD_NAME}----
ln -s  /serverdata/serverfiles/steamapps/workshop/${MOD_ID} ${FORCE_INSTALL_DIR}/${MOD_NAME}

DESKTOP_ARMA_ID="107410"
MOD_ID="497661914"
MOD_NAME="@CUP Units"
${STEAMCMD_DIR}/steamcmd \
+login ${USERNAME} ${PASSWRD} \
+app_update ${DESKTOP_ARMA_ID} \
+workshop_download_item ${DESKTOP_ARMA_ID} ${MOD_ID} validate \
+quit
echo ---Creating Symbolic link for ${MOD_NAME}----
ln -s  /serverdata/serverfiles/steamapps/workshop/${MOD_ID} ${FORCE_INSTALL_DIR}/${MOD_NAME}