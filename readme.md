# Matrix bridge test bench

> The goal of this repo is improve skills about Matrix and Matrix bridges

With the deployment of a Synapse instance with it's Element client and 2 bridges : Slack and Discord.

## Prerequisites

- a server with docker and docker-compose installed
- traefik running and configured with a domain name
- [yq](https://github.com/kislyuk/yq) package installed

## Installations

### Set variables

- Run `cp .env_template .env`
- Run `chmod +x setup-variables.sh`
- Set variables then run `./setup-variables.sh`
  (this script can be run each time a line is filled in .env file)

### Setup matrix

Follow the instructions there : [Matrix](matrix/readme.md)

### Setup discord bridge

Follow the instructions there : [discord-bridge](discord-bridge/readme.md)

Then restart synapse `cd matrix && docker-compose down && docker-compose up -d`

Go to element.YOUR-DOMAIN, login and

- create an unencrypted private room
- invite @_discord_bot:matrix.YOUR-DOMAIN in it
- enter the following command `!discord bridge ServerID ChannelID` ServerID and ChannelID being part of the url of your discord channel
- chat 🎉

### Setup Slack bridge

#### Slack bridge admin room

- Go to element and create a private unencrypted room for slack bot admin. get the room ID and fill SLACK_BRIDGE_ADMIN_ROOM in root `.env` var. then run `./setup-variable.sh`

### Setup bridge app

Follow the instructions there : [slack-bridge](slack-bridge/readme.md)

Then restart synapse `cd matrix && docker-compose down && docker-compose up -d`

- invite slack bot `slackbot` to your slack admin room
- link a slack clannel 

   ```txt
   link --channel_id $CHANNEL_ID --room $ROOM_ID:matrix.{{ DOMAIN }} --slack_bot_token $TOKEN
   ```

## Setup a conversation between slack and discord

...
