# Discord bridge

> Bridge doc : <https://github.com/matrix-org/matrix-appservice-discord>

## Setup discord

Instructions here : <https://github.com/matrix-org/matrix-appservice-discord#setting-up-discord>

### Get invite url

Go to <https://discord.com/api/oauth2/authorize?client_id=${CLIENT_IT}&scope=bot&permissions=607250432> and accept the bot

## Bridge setup

At this point you should be able to fill `DISCORD_BOT_TOKEN` and `DISCORD_CLIENT_ID` in the root `.env` file then run `../setup-variable.sh`

## Create registration file

```bash
chmod +x generate-app-file.sh && ./generate-app-file.sh
```

then

```bash
docker-compose up -d
```

## ⚠️ Caveat

At the time of writing, it doesn't work properly with `latest` image, but it does with `develop`
