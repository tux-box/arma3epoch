#!/bin/bash
#the primary work script that calls all other work to be done.
if [ ! -d ${DATA_DIR} ]; then
   mkdir ${DATA_DIR}
   chown -R $USER $DATA_DIR
fi
if [ ! -d ${FORCE_INSTALL_DIR} ]; then
	mkdir $FORCE_INSTALL_DIR
fi


#get the Arma 3 server files
source /src/scripts/getArma3server.sh

#get the epoch client files AKA Epoch mod
source /src/scripts/getEpochClient.sh

#get the epoch server files
source /src/scripts/getEpochServer.sh

### Personalize the server. 
#source /src/scripts/personalizeFiles.sh

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

### Start the server source ${FORCE_INSTALL_DIR}/epoch_linux_startscript.sh
sleep 30m