# 📝 Discord Logs for [FiveM](https://fivem.net/) [![GitHub stars](https://img.shields.io/github/stars/PetrisGR/FiveM-DiscordLogs.svg)](https://github.com/PetrisGR/FiveM-DiscordLogs/stargazers) [![GitHub license](https://img.shields.io/github/license/PetrisGR/FiveM-DiscordLogs.svg)](https://github.com/PetrisGR/FiveM-DiscordLogs/blob/master/LICENSE)

## Description

Introducing "FiveM-DiscordLogs", your ultimate tool for effortless event logging on FiveM servers. With seamless integration with Discord, this script makes logging detailed events a breeze. From player interactions to script events, capture it all with ease and precision.

## Features

- Easily log your server events to Discord with many details.
- Capture every interaction and activity with ease, ensuring a comprehensive record.

## Pre-Installed Modules

- Custom Multiplayer/Singleplayer Log
- Custom No-player Log
- Basic Events (Player Join/Leave, Resource Start/Stop)
- txAdmin Events (Ban, Kick, Warn, Announcement, Shutdown)
- Player Aim Logs (Player Info, Weapon, Distance, Screenshot)
- Explosion (Full Detailed, Screenshot)

## Usage

1. Make sure you have the latest [screenshot-basic](https://github.com/citizenfx/screenshot-basic) installed in your server resources.
2. Make sure you have the latest [OX Library](https://github.com/overextended/ox_lib/releases/latest/download/ox_lib.zip) installed in your server resources.
3. Download the [latest version](https://github.com/PetrisGR/FiveM-DiscordLogs/releases/latest/download/petris-discordlogs.zip).
4. Drag & Drop the zip file into your `resources` folder.
5. Un-zip the folder of the script.
6. Start the script via your server.cfg by typing `ensure petris-discordlogs` in a new code line.  
7. Use the server-side log function via exports. (Scroll down to see how)
8. Enjoy having logs connected with your Discord server.

## Export Function

```lua
exports["petris-discordlogs"]:CreateLog({
    category = "txadmin", -- (* required)
    title = "txAdmin Logs", -- (* required)
    action = "Player Banned",
    color = "red",
    players = { -- Players Table (id, role)
        { id = 1, role = "Admin"},
        { id = 2, role = "Target"},
    },
    info = { -- Event Information (name, value)
        { name = "Reason", value = "troller" },
    },
    takeScreenshot = true,
    screenshotTargetId = 2
})
```

## Contributing

Contributions are welcome! Please submit a pull request if you have any ideas, suggestions, or improvements. For significant changes, please open an issue to discuss the proposed changes.

## Support

If you encounter any issues or have any questions or suggestions, please feel free to [open an issue](https://github.com/PetrisGR/FiveM-DiscordLogs/issues).
