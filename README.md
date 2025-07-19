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

### Option 1: Pull from Docker Hub (Recommended)
```bash
# Create environment file
echo "MINECRAFT_PORT=25565" > .env
echo "JAVA_VERSION=21" >> .env  
echo "MINECRAFT_JAR_URL=https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.4.0/forge-1.20.1-47.4.0-installer.jar" >> .env

# Run the server
docker run -d \\
  --name minecraft-server \\
  -p 25565:25565 \\
  -v minecraft-data:/minecraft/forge-server \\
  --env-file .env \\
  theboshy/minecraft-server:latest
```

### Option 2: Build from Source
```bash
# Clone and build
git clone https://github.com/yourusername/minecraft-forge-docker
cd minecraft-forge-docker
cp .env.example .env  # Edit with your settings
docker-compose up -d
```

## 🎮 Server Management

### Customizing Your Server
All server data is stored in the `minecraft-data` Docker volume. To customize:

1. **Stop the server**
   ```bash
   docker stop minecraft-server
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
   docker start minecraft-server
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
docker logs -f minecraft-server

# Stop/Start/Restart
docker stop minecraft-server
docker start minecraft-server
docker restart minecraft-server

# Backup server data
docker run --rm -v minecraft-data:/data -v $(pwd):/backup alpine tar czf /backup/minecraft-backup.tar.gz -C /data .

# Remove server (keeps data in volume)
docker rm minecraft-server
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
