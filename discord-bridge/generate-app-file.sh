#!/bin/bash

source .env
MATRIX_FOLDER="../matrix/mx-conf"

# generate app service file
docker run -v ./matrix-appservice-discord:/data \
halfshot/matrix-appservice-discord:latest node build/src/discordas.js -r \
-u "http://discord.bridge.$DOMAIN" -c /data/config.yml -f /data/discord-registration.yaml

if [ -d "$MATRIX_FOLDER" ]; then
  cp ./matrix-appservice-discord/discord-registration.yaml $MATRIX_FOLDER
fi

yq -i -y '.app_service_config_files += ["/mx-conf/discord-registration.yaml"]' $MATRIX_FOLDER/homeserver.yaml
