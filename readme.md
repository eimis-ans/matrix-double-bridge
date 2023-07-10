# Matrix bridge test bench

> The goal of this repo is improve skills about Matrix and Matrix bridges

With the deployment of a Synapse instance with it's element client and 2 bridges : slack and discord.

## Docs

## Prerequisites

- a server with docker and docker-compose installed
- traefik running and configured with a domain name

## Installations

Run

```bash
./setup-variables.sh
```

Follow these:

- [Matrix](matrix/readme.md)
- [Slack-bridge](slack-bridge/readme.md)
- [discord-bridge](discord-bridge/readme.md)

## Conclusions

- The bridge can create users and act for the behalf of then : send messages etc...
  ->  So it should be possible to do this :
- Bridges have to be able to read messages specially for bots to answer commands so it doesn't work if the rooms are encrypted ⚠️