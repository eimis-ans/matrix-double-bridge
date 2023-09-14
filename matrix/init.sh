#!/bin/bash

# sourced variables are automatically exported and usable with envsubst
set -a
source ../.env
set +a

# Initialize matrix configuration
docker run -it --rm \
    -v "matrix_matrix-data:/data" \
    -v "./mx-conf:/mx-conf" \
    -e SYNAPSE_SERVER_NAME=matrix.$DOMAIN \
    -e SYNAPSE_CONFIG_PATH=/mx-conf/homeserver.yaml \
    -e SYNAPSE_REPORT_STATS=yes \
    matrixdotorg/synapse:v1.83.0 generate
echo "Done."

# Initialize Element configuration
echo "Generating element-config.json config for element ..."
envsubst <"element-config.tmpl" >element-config.json
echo "Done."

# Initialize slack-bridge configuration
echo "Generating config files for slack-bridge ..."
envsubst <"slack-bridge-config/config.tmpl" >slack-bridge-config/config.yaml
docker run -v ./slack-bridge-config/:/config/ matrixdotorg/matrix-appservice-slack:latest \
-r -c /config/config.yaml -u "https://slack-bridge.$DOMAIN" -f /config/slack-registration.yaml
cp ./slack-bridge-config/slack-registration.yaml ./mx-conf/
yq -i '.app_service_config_files += ["/mx-conf/slack-registration.yaml"]' ./mx-conf/homeserver.yaml
echo "Done."


