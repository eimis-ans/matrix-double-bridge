#!/bin/bash
docker run -it --rm \
    -v "$(pwd)/synapse:/data" \
    -e SYNAPSE_SERVER_NAME=$DOMAIN \
    -e SYNAPSE_REPORT_STATS=yes \
    matrixdotorg/synapse:v1.83.0 generate