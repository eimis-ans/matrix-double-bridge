# Matrix bridge test bench

> The goal of this repo is improve skills about Matrix and Matrix bridges

With the deployment of a Synapse instance with it's Element client and 2 bridges : Slack and Discord.

## Prerequisites

- a server with docker and docker-compose installed
- traefik running and configured with a domain name
- [yq](https://github.com/kislyuk/yq) package installed

## Installations

edit `/etc/hosts` to add

```txt
127.0.0.1       matrix.local
127.0.0.1       slack.bridge.local
127.0.0.1       discord.bridge.local
```

### Set variables

- Run `cp .env_template .env`
- Run `chmod +x setup-variables.sh`
- Set variables then run `./setup-variables.sh`
  (this script can be run each time a line is filled in .env file)

### Setup matrix

Follow the instructions there : [Matrix](matrix/readme.md)

### Setup discord bridge

Follow the instructions there : [discord-bridge](discord-bridge/readme.md)

### Setup Slack bridge

Follow the instructions there : [slack-bridge](slack-bridge/readme.md)

## 🗨️ Chat

- It's possible to link a room to both Slack and Discord.
- bridge listened rooms aren't encrypted although it is possible <https://matrix-appservice-slack.readthedocs.io/en/latest/bridge-encryption/>
- PM needs puppeting for the 3rd party app and, thus, a user token <https://matrix-appservice-slack.readthedocs.io/en/latest/puppeting/>
