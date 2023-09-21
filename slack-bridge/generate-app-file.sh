#!/bin/bash

source .env
MATRIX_FOLDER="../matrix/mx-conf"

docker run -v ./config/:/config/ matrixdotorg/matrix-appservice-slack:latest \
-r -c /config/config.yaml -u "http://slack-bridge:5858" -f /config/slack-registration.yaml

if [ -d "$MATRIX_FOLDER" ]; then
  cp ./config/slack-registration.yaml $MATRIX_FOLDER
fi

yq -i '.app_service_config_files += ["/mx-conf/slack-registration.yaml"]' $MATRIX_FOLDER/homeserver.yaml
