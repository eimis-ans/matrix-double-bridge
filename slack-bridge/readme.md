# Slack bridge

> <https://github.com/matrix-org/matrix-appservice-slack>

## Prerequisites

`../setup-variable.sh` has been run

- Go to element and create a private unencrypted room for slack bot admin. get the room ID and fill SLACK_BRIDGE_ADMIN_ROOM in root `.env` var. then run `./setup-variable.sh`

## Install bridge

```bash
chmod +x generate-app-file.sh && ./generate-app-file.sh
```

then

```bash
docker-compose up -d
```

### Configure Slack application

Create a Slack application, instruction here : <https://matrix-appservice-slack.readthedocs.io/en/latest/link_channels/>

You should get a token for your slack bot.

Then restart synapse `cd ../matrix && docker-compose down && docker-compose up -d`

On element:

- invite slack bot `@slackbot:matrix.local` to your slack admin room
- invite the slack bot to the room you want to bridge and get its room id
- link a slack channel : in the slack admin room, write the command

  `link --channel_id $CHANNEL_ID --room $ROOM_ID:matrix.local --slack_bot_token $TOKEN`

On Slack:

- Also don't forget to invite the slack bot to the slack channel
