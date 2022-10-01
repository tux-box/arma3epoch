FROM tuxbox1/steamcmd:latest
#sets up and installs a steam dedicated server

MAINTAINER tux-box <nathan.flow@gmail.com>

###From steamcmd/steamcmd container
#ENV HOME=/root #steamCMD env 
#ENV USER=root #steamCMD env

### Default container
ENV DATA_DIR="/serverdata"
ENV STEAMCMD_DIR="/usr/games"
ENV ARMA_DIR="${DATA_DIR}/serverfiles"
ENV GAME_ID="template"
ENV GAME_NAME="template"
ENV GAME_PARAMS="template"
ENV PORT=27015
ENV VALIDATE=""
ENV UMASK=000
ENV UID=99
ENV GID=100
ENV USERNAME=""
ENV PASSWRD=""
ENV USER="steam"
ENV DATA_PERM=770

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

RUN mkdir $ARMA_DIR && \
    apt-get clean && apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* &&\
    chown -R $USER $DATA_DIR && \
    ulimit -n 2048

RUN git clone https://github.com/tux-box/arma3epoch.git /src
RUN chmod -R 770 /src/scripts

#Server Start
ENTRYPOINT ["/src/scripts/processWork.sh"]