# Slack bridge

> <https://github.com/matrix-org/matrix-appservice-slack>

## Prerequisites

`../setup-variable.sh` has been run

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
