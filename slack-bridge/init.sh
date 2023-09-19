#!/bin/bash

# sourced variables are automatically exported and usable with envsubst
set -a
source ../.env
set +a

# Initialize slack-bridge configuration
echo "Generating config files for slack-bridge ..."
envsubst <"slack-bridge-config/config.tmpl" >slack-bridge-config/config.yaml
docker run -v ./slack-bridge-config/:/config/ matrixdotorg/matrix-appservice-slack:latest \
-r -c /config/config.yaml -u "https://slack-bridge.$DOMAIN" -f /config/slack-registration.yaml
cp ./slack-bridge-config/slack-registration.yaml ../matrix/mx-conf/
yq -i '.app_service_config_files += ["/mx-conf/slack-registration.yaml"]' ../matrix/mx-conf/homeserver.yaml
chown -R 991:991 ../matrix/mx-conf
echo "Done."

# Replace placeholders in docker-compose file (because of the $%§#! extra_hosts)
echo "Replacing placeholders in docker-compose ..."
envsubst <"docker-compose.tmpl" > docker-compose.yml
echo "Done."
