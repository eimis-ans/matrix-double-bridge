# Matrix bridge test bench

The goal of this repo is to improve skills about Matrix and Matrix bridges
with the deployment of a Synapse instance with its Element client and 2 bridges : Slack and Discord.

## Prerequisites

### local machine
To run this project you will need on your local machine : 
- docker and docker-compose installed
- admin rights to run docker
- [yq](https://github.com/kislyuk/yq) package installed

### Slack
a Slack workspace and account are also required with the ability to create a Slack application, instruction here : <https://matrix-appservice-slack.readthedocs.io/en/latest/link_channels/>

### Discord

## Installations

### Set variables

- Run `cp .env_template .env`
- Fill .env file with corresponding values
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

Bridge used : https://github.com/matrix-org/matrix-appservice-slack

- Go to element and create a private unencrypted room for slack bot admin. get the room ID and fill SLACK_BRIDGE_ADMIN_ROOM in root `.env` var. then run `./setup-variable.sh`

### Setup bridge app

Follow the instructions there : [slack-bridge](slack-bridge/readme.md)

Then restart synapse `cd matrix && docker-compose down && docker-compose up -d`

- invite slack bot `slackbot` to your slack admin room
- invite the slack bot to the room you want to bridge and get its room id
- link a slack channel : in the slack admin room, write the command

   `link --channel_id $CHANNEL_ID --room $ROOM_ID:matrix.{{ DOMAIN }} --slack_bot_token $TOKEN`

## 🗨️ Chat

- It's possible to link a room to both Slack and Discord.
- bridge listened rooms aren't encrypted although it is possible <https://matrix-appservice-slack.readthedocs.io/en/latest/bridge-encryption/>
- PM needs puppeting for the 3rd party app and, thus, a user token <https://matrix-appservice-slack.readthedocs.io/en/latest/puppeting/>
