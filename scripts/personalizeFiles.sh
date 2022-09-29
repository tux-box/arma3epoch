#!/bin/bash
# this file makes changes to the following files
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
