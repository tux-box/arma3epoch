#list of files to change.
# sc/basic-example.cfg
# sc/server-example.cfg
# battleye
# @epochhive/epochah.hpp
# @epochhive/epochconfig.hpp
# @epochhive/epochserver.ini

mv ${FORCE_INSTALL_DIR}/sc/basic-example.cfg ${FORCE_INSTALL_DIR}/sc/basic.cfg
mv ${FORCE_INSTALL_DIR}/sc/server-example.cfg ${FORCE_INSTALL_DIR}/sc/server.cfg
sed "s|EpochMod.com (0.5|1.68) ID02 YourHost|${SERVER_NAME}|g" ${FORCE_INSTALL_DIR}/sc/server.cfg
sed 's|password         	= "";|password         	= "${SERVER_PASSWRD}";|g' ${FORCE_INSTALL_DIR}/sc/server.cfg
sed 's|CHANGE_THIS_PASSWORD!|"${ADMIN_PASSWRD}"|g' ${FORCE_INSTALL_DIR}/sc/server.cfg
sed "s|adminMenu_Owner[] = {};|adminMenu_Owner[] = {${ADMIN_ARRAY}};|g" ${FORCE_INSTALL_DIR}/@epochhive/epochah.hpp
sed "2s|127.0.0.1|${REDIS_IP}|" ${FORCE_INSTALL_DIR}/@epochhive/epochserver.ini