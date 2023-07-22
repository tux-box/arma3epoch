#!/bin/bash

ARMAAPPID=107410

RCONPASSWORD=${RCONPASSWORD:-changemen0w}

#no longer needed?
#USERNAME=${USERNAME:-anonymous}
#PASSWRD=${PASSWRD:-}

#:: Epoch Workshop IDs: Experimental = 455221958 Normal = 421839251
mods[421839251]='@epoch'
servermods[1642000412]='@epochhive'

# build mod list
MODLIST=""
ARMASERVERMODS=""
for i in "${!servermods[@]}"
do
   MODLIST+="+workshop_download_item $ARMAAPPID $i "
   ARMASERVERMODS+="${servermods[$i]};"
done
ARMAMODS=""
for i in "${!mods[@]}"
do
   MODLIST+="+workshop_download_item $ARMAAPPID $i "
   ARMAMODS+="${mods[$i]};"
done

# install arma 3
/serverdata/steamcmd/steamcmd.sh +login $USERNAME $PASSWRD +force_install_dir /serverdata/serverfiles "+app_update 233780" $MODLIST validate +quit

# move into arma3 folder
cd $SERVER_DIR
# try to support 64 bit...
FILE=arma3server_x64
ARCH="_x64"
if [ ! -f "$FILE" ]; then
   FILE=arma3server
   ARCH=""
fi

#link common folders
ln -s $SERVER_DIR"/mpmissions"  $SERVER_DIR"/MPMissions"
ln -s $SERVER_DIR"/keys"  $SERVER_DIR"/Keys"

# perform install of mods
for i in "${!mods[@]}"
do
	MODFILE="/serverdata/serverfiles/steamapps/workshop/content/107410/$i"
	if [ -d "$MODFILE" ]; then
		# convert to mod to lowercase
		cd $MODFILE
		ls | while read upName; do loName=`echo "${upName}" | tr '[:upper:]' '[:lower:]'`; mv "$upName" "$loName"; done
   		# install client mods
		ln -s $MODFILE $SERVER_DIR"/"${mods[$i]}
		# copy latest key to server
		cp -a -v $SERVER_DIR"/"${mods[$i]}"/keys/." $SERVER_DIR"/keys"
	else
	   echo "ERROR: Mod files not found for $i"
	fi
done


for i in "${!servermods[@]}"
do
	MODFILE="/serverdata/serverfiles/steamapps/workshop/content/107410/$i"
	if [ -d "$MODFILE" ]; then
		# convert to mod to lowercase
		cd $MODFILE
		ls | while read upName; do loName=`echo "${upName}" | tr '[:upper:]' '[:lower:]'`; mv "$upName" "$loName"; done
		#install server mods
		ln -s $MODFILE $SERVER_DIR"/"${servermods[$i]}
   		#special extra install for 558243173
        if [ "$i" -eq "601772725" ] || [ "$i" -eq "558243173" ]; then
   			cp $SERVER_DIR"/"${servermods[$i]}"/epochah-example.hpp" $SERVER_DIR"/"${servermods[$i]}"/epochah.hpp"
			cp $SERVER_DIR"/"${servermods[$i]}"/epochconfig-example.hpp" $SERVER_DIR"/"${servermods[$i]}"/epochconfig.hpp"
			cp $SERVER_DIR"/"${servermods[$i]}"/epochserver-example.ini" $SERVER_DIR"/"${servermods[$i]}"/epochserver.ini"
			#sed -i "s@Password = foobared@Password = $REDISAUTHPASS@g" $SERVER_DIR"/${servermods[$i]}/EpochServer.ini"
			#:: copy config profile and battleye files to live
			# mkdir -p $SERVER_DIR"/sc"
			cp -a -v $SERVER_DIR"/"${servermods[$i]}"/sc/." $SERVER_DIR"/sc"
			cp $SERVER_DIR"/sc/server-example.cfg" $SERVER_DIR"/sc/server.cfg"
			cp $SERVER_DIR"/sc/basic-example.cfg" $SERVER_DIR"/sc/basic.cfg"
			cp $SERVER_DIR"/sc/battleye/example-beserver"$ARCH".cfg" $SERVER_DIR"/sc/battleye/beserver"$ARCH".cfg"

			# setup rcon 
			# RConPassword changemen0w
			sed -i "s@RConPassword changemen0w@RConPassword $RCONPASSWORD@g" $SERVER_DIR"/sc/battleye/beserver"$ARCH".cfg"
			sed -i "s@Password = changeme@Password = $RCONPASSWORD@g" $SERVER_DIR"/"${servermods[$i]}"/epochserver.ini"

			#:: update mission files
			#mkdir -p $SERVER_DIR"/mpmissions"
			cp -a -v $SERVER_DIR"/"${servermods[$i]}"/mpmissions/." $SERVER_DIR"/mpmissions"
   		fi
	else
	   echo "ERROR: Mod files not found for $i"
	fi
done

eval ${PRESCRIPT}

# move back into arma3 folder
#cd $SERVER_DIR
#if [ -f "$FILE" ]; then
#   ./$FILE -port=2302 -profiles=/sc -mod="$ARMAMODS" -serverMod="$ARMASERVERMODS" -config="/arma3/sc/server.cfg" -cfg="/arma3/sc/basic.cfg" -name=SC -world=empty -autoinit
#else
#   echo "Cannot find $FILE"
#fi
