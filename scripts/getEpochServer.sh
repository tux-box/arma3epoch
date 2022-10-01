#!/bin/bash
#downloads the epoch server files
git clone https://github.com/EpochModTeam/Epoch.git /tmp/epoch_serv_src
/bin/bash /src/scripts/makeLowerCase.sh /tmp/epoch_serv_src
cp -r /tmp/epoch_serv_src/server_install_pack/* ${ARMA_DIR}