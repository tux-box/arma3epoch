#!/bin/bash
#modified to work with ich777's arma 3 app / truecharts app.

ARMASVRPATH=$SERVER_DIR
ARMAAPPID=107410

RCONPASSWORD=${RCONPASSWORD:-changemen0w}

#I don't think I'll use this.
STEAM_USERNAME=$USERNAME
STEAM_PASSWORD=$PASSWRD

#:: Epoch Workshop IDs: Experimental = 455221958 Normal = 421839251
mods[421839251]='@epoch'
servermods[601772725]='@epochhive'

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

# move into arma3 folder
cd $ARMASVRPATH
# try to support 64 bit...
FILE=arma3server_x64
ARCH="_x64"
if [ ! -f "$FILE" ]; then
   FILE=arma3server
   ARCH=""
fi

#link common folders
ln -s $ARMASVRPATH"/mpmissions"  $ARMASVRPATH"/MPMissions"
ln -s $ARMASVRPATH"/keys"  $ARMASVRPATH"/Keys"

# perform install of mods
for i in "${!mods[@]}"
do
	MODFILE="/serverdata/Steam/steamapps/workshop/content/107410/$i"
	if [ -d "$MODFILE" ]; then
		# convert to mod to lowercase
		cd $MODFILE
		ls | while read upName; do loName=`echo "${upName}" | tr '[:upper:]' '[:lower:]'`; mv "$upName" "$loName"; done
   		# install client mods
		ln -s $MODFILE $ARMASVRPATH"/"${mods[$i]}
		# copy latest key to server
		cp -a -v $ARMASVRPATH"/"${mods[$i]}"/keys/." $ARMASVRPATH"/keys"
	else
	   echo "ERROR: Mod files not found for $i"
	fi
done


for i in "${!servermods[@]}"
do
	MODFILE="/serverdata/Steam/steamapps/workshop/content/107410/$i"
	if [ -d "$MODFILE" ]; then
		# convert to mod to lowercase
		cd $MODFILE
		ls | while read upName; do loName=`echo "${upName}" | tr '[:upper:]' '[:lower:]'`; mv "$upName" "$loName"; done
		#install server mods
		ln -s $MODFILE $ARMASVRPATH"/"${servermods[$i]}
   		#special extra install for 558243173
        if [ "$i" -eq "601772725" ] || [ "$i" -eq "558243173" ]; then
   			cp $ARMASVRPATH"/"${servermods[$i]}"/epochah-example.hpp" $ARMASVRPATH"/"${servermods[$i]}"/epochah.hpp"
			cp $ARMASVRPATH"/"${servermods[$i]}"/epochconfig-example.hpp" $ARMASVRPATH"/"${servermods[$i]}"/epochconfig.hpp"
			cp $ARMASVRPATH"/"${servermods[$i]}"/epochserver-example.ini" $ARMASVRPATH"/"${servermods[$i]}"/epochserver.ini"
			#sed -i "s@Password = foobared@Password = $REDISAUTHPASS@g" $ARMASVRPATH"/${servermods[$i]}/epochserver.ini"
			#:: copy config profile and battleye files to live
			# mkdir -p $ARMASVRPATH"/sc"
			cp -a -v $ARMASVRPATH"/"${servermods[$i]}"/sc/." $ARMASVRPATH"/sc"
			cp $ARMASVRPATH"/sc/server-example.cfg" $ARMASVRPATH"/sc/server.cfg"
			cp $ARMASVRPATH"/sc/basic-example.cfg" $ARMASVRPATH"/sc/basic.cfg"
			cp $ARMASVRPATH"/sc/battleye/example-beserver"$ARCH".cfg" $ARMASVRPATH"/sc/battleye/beserver"$ARCH".cfg"

			# setup rcon 
			# RConPassword changemen0w
			sed -i "s@RConPassword changemen0w@RConPassword $RCONPASSWORD@g" $ARMASVRPATH"/sc/battleye/beserver"$ARCH".cfg"
			sed -i "s@Password = changeme@Password = $RCONPASSWORD@g" $ARMASVRPATH"/"${servermods[$i]}"/epochserver.ini"

			#:: update mission files
			#mkdir -p $ARMASVRPATH"/mpmissions"
			cp -a -v $ARMASVRPATH"/"${servermods[$i]}"/mpmissions/." $ARMASVRPATH"/mpmissions"
   		fi
	else
	   echo "ERROR: Mod files not found for $i"
	fi
done

eval ${PRESCRIPT}

# move back into arma3 folder
cd $ARMASVRPATH
if [ -f "$FILE" ]; then
   ./$FILE -port=2302 -profiles=/sc -mod="$ARMAMODS" -serverMod="$ARMASERVERMODS" -config="/serverdata/serverfiles/sc/server.cfg" -cfg="/serverdata/serverfiles/sc/basic.cfg" -name=SC -world=empty -autoinit
else
   echo "Cannot find $FILE"
fi