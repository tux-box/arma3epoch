#!/bin/bash
#downloads the epoch server files
git clone https://github.com/EpochModTeam/Epoch.git /tmp/epoch_serv_src
#make the files all lower case for uniformity.
/bin/bash /src/scripts/makeLowerCase.sh /tmp/epoch_serv_src
cp -r /tmp/epoch_serv_src/server_install_pack/* ${FORCE_INSTALL_DIR}
rm -r -f /tmp/epoch_serv_src