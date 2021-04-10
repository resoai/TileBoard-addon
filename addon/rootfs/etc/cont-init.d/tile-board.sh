#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: TileBoard
# Configures TileBoard
# ==============================================================================

CONFIG_FOLDER=$(bashio::config 'configFolder')

bashio::log.info 'Symlink user configuration files to served folder'

python3 /etc/tileboard/symlink-config.py "/config/$CONFIG_FOLDER" "/var/www/tileboard/"
