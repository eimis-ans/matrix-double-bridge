# Discord bridge

> Bridge doc : <https://github.com/matrix-org/matrix-appservice-discord>

## Setup discord

Instructions here : <https://github.com/matrix-org/matrix-appservice-discord>

### Get invite url

Go to <https://discord.com/api/oauth2/authorize?client_id=${CLIENT_IT}&scope=bot&permissions=607250432> and accept the bot

## Create registration file

```bash
./generate-app-file.sh
```

## ⚠️ Caveat

At the time of writing, it doesn't work properly with `latest` image, but it does with `develop`
