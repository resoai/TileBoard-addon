#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: TileBoard
# Configures TileBoard
# ==============================================================================

CONFIG_FOLDER=$(bashio::config 'configFolder')

bashio::log.info 'Symlink files to dist folder'

for f in /config/$CONFIG_FOLDER/*;
do
    FILENAME=$(basename $f);
    if [ $FILENAME = 'custom.css' ]
    then
        rm /var/tileboard/styles/custom.css
        ln -s /config/$CONFIG_FOLDER/$FILENAME /var/www/tileboard/styles/custom.css
    else
        ln -s /config/$CONFIG_FOLDER/$FILENAME /var/www/tileboard/$FILENAME
    fi;
done;
