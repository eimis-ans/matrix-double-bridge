echo "Generating discord-registration.yaml file...."
docker run -it --rm `
    -v "${PWD}\config\:/config/" `
    matrixdotorg/matrix-appservice-slack:latest `
    -r -c /config/config.yaml -u "http://slack-bridge:5858" -f /config/slack-registration.yaml

echo "Copying discord-registration.yaml file to Synapse folder"
Copy-Item -Path "${PWD}\config\slack-registration.yaml" `
          -Destination "${PWD}\..\matrix\mx-conf"

echo "Registring discord-registration.yaml in Synapse configuration file"
yq_windows_amd64.exe -i '.app_service_config_files += [\"/mx-conf/slack-registration.yaml\"]' "${PWD}\..\matrix\mx-conf\homeserver.yaml"