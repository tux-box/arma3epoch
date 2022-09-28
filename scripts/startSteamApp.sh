#!/bin/bash
#starts the steam app
echo "---Start Server---"
cd ${SERVER_DIR}
${SERVER_DIR}/srcds_run -game ${GAME_NAME} ${GAME_PARAMS} -console +port ${GAME_PORT}
