FROM tuxbox1/steamcmd:latest
#sets up and installs a steam dedicated server

MAINTAINER tux-box <nathan.flow@gmail.com>

###From steamcmd/steamcmd container
#ENV HOME=/root #steamCMD env 
#ENV USER=root #steamCMD env

### Default container
ENV DATA_DIR="/serverdata"

### Filesystem 
ENV UMASK=000
ENV UID=99
ENV GID=100
ENV USER="steam"
ENV DATA_PERM=770

### Networking
ENV PORT=27015

###SteamCMD info
### Creds
ENV USERNAME=""
ENV PASSWRD=""
### SteamCMD configuration
ENV STEAMCMD_DIR="/usr/games"
ENV FORCE_INSTALL_DIR=${DATA_DIR}/serverfiles
ENV APP_UPDATE="template"
ENV WORKSHOP_DOWNLOAD_ITEM="template"
ENV VALIDATE="true"

###For personalization
ENV SERVER_NAME=DockerEpoch
ENV SERVER_PASSWRD=Docker
ENV ADMIN_PASSWRD=EpochDocker
ENV ADMIN_ARRAY={"76561197991069479","Mr.120"}
ENV REDIS_IP=127.0.0.1

###For epoch_linux_startscript.sh
ENV NAME=SC
ENV DELDAYS=7
ENV OTHERPARAMS="-maxMem=2047 -nosound -exthreads=1 -noCB -autoinit -loadMissionToMemory"
ENV MODS=@epoch
ENV SERVERMODS=@epochhive

WORKDIR /

RUN apt-get clean && apt-get autoremove && \
rm -rf /var/lib/apt/lists/* && \
mkdir  $DATA_DIR && \
mkdir $FORCE_INSTALL_DIR && \
chown -R $USER $DATA_DIR && \
rm -r -f $DATA_DIR/src && \
git clone https://github.com/tux-box/arma3epoch.git $DATA_DIR/src && \
chmod -R 770 $DATA_DIR/src/scripts && \
ulimit -n 2048

#Server Start
ENTRYPOINT ["/bin/bash $DATA_DIR/src/scripts/processWork.sh"]