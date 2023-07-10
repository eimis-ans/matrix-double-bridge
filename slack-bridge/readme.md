# Slack bridge

> <https://github.com/matrix-org/matrix-appservice-slack>

## Prerequisites

`../setup-variable.sh` has been run


## Install bridge

Run

```bash
./generate-app-file.sh
# then
docker-compose up -d
```

## Setup Slack

Instruction here : <https://matrix-appservice-slack.readthedocs.io/en/latest/link_channels/>

```txt
link --channel_id $CHANNEL_ID --room $ROOM_ID:matrix.{{ DOMAIN }} --slack_bot_token $TOKEN
```
