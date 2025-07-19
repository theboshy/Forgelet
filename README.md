# Forgelet - Docker Minecraft Forge Server

A Docker-based solution for easily deploying and managing Minecraft Forge servers with persistent data and easy customization.

## Features
- 🐳 **Dockerized Minecraft Forge server** with automatic setup
- 🔄 **Dynamic server versions** via environment variables
- 💾 **Persistent data storage** with Docker volumes
- ⚙️ **Easy customization** - mods, worlds, settings
- 🚀 **Zero-configuration startup** - works out of the box
- 📦 **Production ready** - pull from Docker Hub

## Prerequisites
- Docker installed on your system
- Minimum 4GB of RAM (8GB recommended for modded servers)

## Quick Start

### Build from Source
```bash
# Clone and build
git clone https://github.com/theboshy/Forgelet
cd Forgelet
cp .env.example .env  # Edit with your settings
docker-compose up -d
```

## 🎮 Server Management

### Customizing Your Server
All server data is stored in the `minecraft-data` Docker volume. To customize:

1. **Stop the server**
   ```bash
   docker stop theboshy-mine-server
   ```

2. **Access and modify files directly in the volume:**
   ```bash
   # Add mods
   docker run --rm -v minecraft-data:/data -v $(pwd):/host alpine cp /host/your-mod.jar /data/mods/
   
   # Edit server properties
   docker run --rm -v minecraft-data:/data alpine vi /data/server.properties
   
   # Replace world data
   docker run --rm -v minecraft-data:/data -v $(pwd):/host alpine cp -r /host/your-world /data/world
   ```

3. **Start the server**
   ```bash
   docker start theboshy-mine-server
   ```

### What You Can Customize:
- **Mods** - Add `.jar` files to `mods/` folder
- **World Data** - Replace `world/` folder with your custom world
- **Server Settings** - Edit `server.properties` for server configuration
- **JVM Settings** - Modify `user_jvm_args.txt` for memory allocation
- **Any server files** - Configs, whitelists, banned-players.json, etc.

### Managing the Server
```bash
# View logs
docker logs -f theboshy-mine-server

# Stop/Start/Restart
docker stop theboshy-mine-server
docker start theboshy-mine-server
docker restart theboshy-mine-server

# Backup server data
docker run --rm -v minecraft-data:/data -v $(pwd):/backup alpine tar czf /backup/minecraft-backup.tar.gz -C /data .

# Remove server (keeps data in volume)
docker rm theboshy-mine-server
```

## 🔗 Useful Links
- [Docker Documentation](https://docs.docker.com/)
- [Forge Documentation](https://docs.minecraftforge.net/)
- [Minecraft Server Properties Wiki](https://minecraft.fandom.com/wiki/Server.properties)
- [CurseForge Mods](https://www.curseforge.com/minecraft/mc-mods)

## ⚠️ Important Notes
- **Always backup your world data** before major changes
- **Stop the server** before modifying files in the volume
- **Restart the server** after making configuration changes
- **Check mod compatibility** with your Forge version
- **Monitor resource usage** - modded servers need more RAM
