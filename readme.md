# Matrix bridge test bench

> The goal of this repo is improve skills about Matrix and Matrix bridges

With the deployment of a Synapse instance with it's element client and 2 bridges : slack and discord.

## Docs

## Prerequisites

- a server with docker and docker-compose installed
- traefik running and configured with a domain name

## Installations

### Set variables

```bash
./setup-variables.sh
```

### Setup matrix

Follow the instructions there : [Matrix](matrix/readme.md)

### Setup discord bridge

Follow the instructions there : [discord-bridge](discord-bridge/readme.md)

### Setup Slack bridge

Follow the instructions there : [slack-bridge](slack-bridge/readme.md)

#### Slack bridge admin room

Go to matrix and create a private unencrypted room for slack bot admin. get the room ID and fill SLACK_BRIDGE_ADMIN_ROOM in root `.env` var. then run

```bash
./setup-variable.sh
```

## Conclusions

- The bridge can create users and act for the behalf of then : send messages etc...
  ->  So it should be possible to do this :
- Bridges have to be able to read messages specially for bots to answer commands so it doesn't work if the rooms are encrypted ⚠️