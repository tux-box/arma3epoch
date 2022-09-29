#!/bin/bash
#the primary work script that calls all other work to be done.

### Get the Epoch Server Files source /script/getEpochServer.sh
git clone https://github.com/EpochModTeam/Epoch.git /tmp/epoch_serv_src
/bin/bash /scripts/makeLowerCase.sh /tmp/epoch_serv_src
cp -r /tmp/epoch_serv_src/server_install_pack/* ${ARMA_DIR}

### Get the Epoch Client Files, aka Epoch Mod source /script/getEpochClient.sh
#TO DO make this array compatable 
appID="107410"
modID="421839251"
modName="@epoch"
${STEAMCMD_DIR}/steamcmd \
+force_install_dir ${ARMA_DIR} \
+login ${USERNAME} ${PASSWRD} \
+workshop_download_item ${GAME_ID} ${modID} \
+quit

mv  ${ARMA_DIR}/${modID} ${ARMA_DIR}/${modName}

### Personalize the server. source /script/personalizeFiles.sh
#list of files to change.
# sc/basic-example.cfg
# sc/server-example.cfg
# battleye
# @epochhive/epochah.hpp
# @epochhive/epochconfig.hpp
# @epochhive/epochserver.ini

mv ${ARMA_DIR}/sc/basic-example.cfg ${ARMA_DIR}/sc/basic.cfg
mv ${ARMA_DIR}/sc/server-example.cfg ${ARMA_DIR}/sc/server.cfg
sed "s|EpochMod.com (0.5|1.68) ID02 YourHost|${SERVER_NAME}|" ${ARMA_DIR}/sc/server.cfg
sed 's|password         	= "";|password         	= "${SERVER_PASSWRD}";|' ${ARMA_DIR}/sc/server.cfg
sed 's|CHANGE_THIS_PASSWORD!|"${ADMIN_PASSWRD}"|' ${ARMA_DIR}/sc/server.cfg
sed "s|adminMenu_Owner[] = {};|adminMenu_Owner[] = {${ADMIN_ARRAY}};|" ${ARMA_DIR}/@epochhive/epochah.hpp
sed "2s|127.0.0.1|${REDIS_IP}|" ${ARMA_DIR}/@epochhive/epochserver.ini

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