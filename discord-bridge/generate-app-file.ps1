echo "Generating discord-registration.yaml file...."
docker run -it --rm `
    -v "${PWD}\matrix-appservice-discord:/data" `
    halfshot/matrix-appservice-discord:latest `
    node build/src/discordas.js -r -u "http://discord-bridge:9005" -c /data/config.yml -f /data/discord-registration.yaml

echo "Copying discord-registration.yaml file to Synapse folder"
Copy-Item -Path "${PWD}\matrix-appservice-discord\discord-registration.yaml" `
          -Destination "${PWD}\..\matrix\mx-conf"

echo "Registring discord-registration.yaml in Synapse configuration file"
yq_windows_amd64.exe -i '.app_service_config_files += [\"/mx-conf/discord-registration.yaml\"]' "${PWD}\..\matrix\mx-conf\homeserver.yaml"