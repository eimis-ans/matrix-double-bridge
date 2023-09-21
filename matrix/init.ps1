docker run -it --rm `
    -v "${PWD}\mx-data:/data" `
    -v "${PWD}\mx-conf:/mx-conf" `
    -e SYNAPSE_SERVER_NAME=localhost `
    -e SYNAPSE_CONFIG_PATH=/mx-conf/homeserver.yaml `
    -e SYNAPSE_REPORT_STATS=yes `
    matrixdotorg/synapse:v1.83.0 generate