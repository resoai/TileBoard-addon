#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: TileBoard
# Configures TileBoard
# ==============================================================================

CONFIG_FOLDER=$(bashio::config 'configFolder')
DEST_FOLDER=/var/www/tileboard/
CUSTOM_CSS_PATH="$DEST_FOLDER/styles/custom.css"
CONFIG_PATH="$DEST_FOLDER/config.js"

bashio::log.info 'Symlink user configuration files to the server folder'

python3 /etc/tileboard/symlink-config.py "/config/$CONFIG_FOLDER" "$DEST_FOLDER"

if ! bashio::fs.file_exists "$CUSTOM_CSS_PATH"; then
    touch "$CUSTOM_CSS_PATH"
fi

if ! bashio::fs.file_exists "$CONFIG_PATH"; then
    bashio::log.info "Config file not found. Setting up an example config."
    cp "$DEST_FOLDER/config.example.js" "$CONFIG_PATH"
fi
