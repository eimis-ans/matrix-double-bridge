# Slack bridge configuration

> <https://github.com/matrix-org/matrix-appservice-slack>

## Prerequisites

matrix installation has been made

## Configure the bridge

```bash
chmod +x init.sh && ./init.sh
```

then start the Synapse stack and for it to be healthy
```bash
cd ../matrix && docker-compose up -d
```
then start the Salck-brige stack
```bash
cd ../slack-bridge && docker-compose up -d
```

### Configure Slack application

Create a Slack application, instruction here : <https://matrix-appservice-slack.readthedocs.io/en/latest/link_channels/>

You should get a token for your slack bot.
