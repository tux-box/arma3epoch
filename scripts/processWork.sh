#!/bin/bash
#the primary work script that calls all other work to be done.

#install some tools to use.
apt-get update && apt-get install -y git curl nano

#Making sure all the files are uptodate
git clone https://github.com/tux-box/arma3epoch.git $DATA_DIR/src

#get the Arma 3 server files
source $DATA_DIR/scripts/getArma3server.sh

#get the epoch server files
source $DATA_DIR/scripts/getEpochServer.sh

#get the epoch client files AKA Epoch mod
source /script/getEpochClient.sh

### Personalize the server. 
source /script/personalizeFiles.sh

### Last items
echo "---Prepare Server---"
if [ ! -f ${DATA_DIR}/.steam/sdk32/steamclient.so ]; then
	if [ ! -d ${DATA_DIR}/.steam ]; then
    	mkdir ${DATA_DIR}/.steam
    fi
	if [ ! -d ${DATA_DIR}/.steam/sdk32 ]; then
    	mkdir ${DATA_DIR}/.steam/sdk32
    fi
    cp -R ${STEAMCMD_DIR}/linux32/* ${DATA_DIR}/.steam/sdk32/
fi
chmod -R ${DATA_PERM} ${DATA_DIR}
echo "---Server ready---"

### Start the server source ${ARMA_DIR}/epoch_linux_startscript.sh
sleep 1h