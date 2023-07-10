#!/bin/bash

source .env
MATRIX_FOLDER="../matrix/mx-conf"

docker run -v ./config/:/config/ matrixdotorg/matrix-appservice-slack:latest \ 
-r -c /config/config.yaml -u "https://slack-bridge.$DOMAIN" -f /config/slack-registration.yaml

if [ -d "$MATRIX_FOLDER" ]; then
  cp ./matrix-appservice-discord/slack-registration.yaml $MATRIX_FOLDER
fi

yq -i -y '.app_service_config_files += ["/mx-conf/slack-registration.yaml"]' $MATRIX_FOLDER/homeserver.yaml
