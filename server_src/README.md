# Server Configuration Overlay

This directory acts as a **configuration overlay** for your Minecraft Forge server.

## How it works:
1. **Docker automatically installs Forge** and generates all necessary server files
2. **Files in this directory override** the auto-generated ones
3. **No image rebuilding needed** - changes take effect on container restart

## What you can customize:
- **Mods** - Place `.jar` files in `mods/` to add custom mods
- **World data** - Place your world in `world/` to use a custom world
- **Server settings** - Create `server.properties` to override default settings
- **JVM settings** - Modify `user_jvm_args.txt` for custom Java arguments
- **Any other server files** - Configs, whitelists, banned-players.json, etc.

## Getting started:
- **Empty folder = Vanilla Forge server** with default settings
- **Add files gradually** to customize your server
- **All changes persist** thanks to Docker volumes

## Important Notes:
- **This directory is git-ignored** (except for this README)
- **Backup your world data regularly** - it contains player progress
- **Test mod compatibility** before adding many mods at once
- **Check logs** if the server fails to start after adding files

## Example structure:
```
server_src/
├── README.md              (this file)
├── server.properties      (custom server settings)
├── user_jvm_args.txt     (custom JVM memory settings)
├── mods/                 (custom mods folder)
│   ├── JEI-1.20.1.jar
│   └── JourneyMap-1.20.1.jar
└── world/                (custom world - optional)
    ├── level.dat
    └── region/
```
