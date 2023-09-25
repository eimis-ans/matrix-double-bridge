# Discord bridge

> Bridge doc : <https://github.com/matrix-org/matrix-appservice-discord>

## Setup discord

Instructions here : <https://github.com/matrix-org/matrix-appservice-discord#setting-up-discord>

### Get invite url

Go to <https://discord.com/api/oauth2/authorize?client_id=${CLIENT_IT}&scope=bot&permissions=607250432> and accept the bot

## Bridge setup

At this point you should be able :
- to fill `DISCORD_BOT_TOKEN` and `DISCORD_CLIENT_ID` in the root `.env` file then run `../setup-variable.sh`
- OR change manually the `DISCORD_BOT_TOKEN` and `DISCORD_CLIENT_ID` values in matrix-appservice-discord/config.yaml

## Create registration file
- Linux :
    ```bash
    chmod +x generate-app-file.sh && ./generate-app-file.sh
    ```
- Windows :
    ```powershell
    .\generate-app-file.ps1
    ```

Then restart synapse `cd ../matrix && docker-compose down && docker-compose up -d`

Start Discord bridge `cd ../discord-bridge && docker-compose up -d`

Go to element <http://localhost:8083>, login and

- create an unencrypted private room
- invite @_discord_bot:matrix.local in it
- enter the following command `!discord bridge ServerID ChannelID` ServerID and ChannelID being part of the url of your discord channel
- you will have to approve the establishment of the link by entering the command `!matrix approve` in the discord channel
- chat 🎉



## ⚠️ Caveat

At the time of writing, it doesn't work properly with `latest` image, but it does with `develop`
