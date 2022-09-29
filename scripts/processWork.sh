#!/bin/bash
#the primary work script that calls all other work to be done.

source /script/installSteamApp.sh
source /script/getEpochServer.sh
source /script/getEpochClient.sh
source /script/personalizeFiles.sh
source ${SERVER_DIR}/epoch_linux_startscript.sh
