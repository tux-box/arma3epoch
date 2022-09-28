#!/bin/bash
if [ ! -f ${STEAMCMD_DIR}/steamcmd ]; then
    echo "SteamCMD not found!"
	echo steam steam/question select "I AGREE" | sudo debconf-set-selections
	echo steam steam/license note '' | sudo debconf-set-selections
	sudo DEBIAN_FRONTEND=noninteractive apt-get install steamcmd -y
fi

echo "---Update SteamCMD---"
if [ "${USERNAME}" == "" ]; then
    ${STEAMCMD_DIR}/steamcmd \
    +login anonymous \
    +quit
else
    ${STEAMCMD_DIR}/steamcmd  \
    +login ${USERNAME} ${PASSWRD} \
    +quit
fi
