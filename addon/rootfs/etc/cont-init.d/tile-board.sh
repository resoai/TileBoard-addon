#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: TileBoard
# Configures TileBoard
# ==============================================================================

CONFIG_FOLDER=$(bashio::config 'configFolder')
DEST_FOLDER=/var/www/tileboard/

bashio::log.info 'Symlink user configuration files to served folder'

python3 /etc/tileboard/symlink-config.py "/config/$CONFIG_FOLDER" "$DEST_FOLDER"

CUSTOM_CSS_PATH="$DEST_FOLDER/styles/custom.css"
if [ ! -f "$CUSTOM_CSS_PATH" ]; then
    touch "$CUSTOM_CSS_PATH"
fi
