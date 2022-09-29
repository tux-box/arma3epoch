#!/bin/bash
#downloads the epoch server files
git clone https://github.com/EpochModTeam/Epoch.git /tmp/epoch_serv_src
/bin/bash /scripts/makeLowerCase.sh /tmp/epoch_serv_src
cp -r /tmp/epoch_serv_src/server_install_pack/ ${SERVER_DIR}
