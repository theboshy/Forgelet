# Forgelet - Docker Minecraft with Forge Server

A Docker-based solution for easily deploying and managing 
Minecraft Forge servers with preconfigured settings and mods.

## Features
- Dockerized Minecraft Forge server
- Pre-configuration support
- Mod management system
- Custom world deployment
- JVM arguments optimization
- Easy server properties configuration

## Prerequisites
- Docker installed on your system
- Git (for cloning the repository)
- Minimum 4GB of RAM (8GB recommended)

## Quick Start

### 1. Clone the Repository
```bash
  git clone [https://github.com/yourusername/docker-minecraft-forge](https://github.com/yourusername/docker-minecraft-forge) cd docker-minecraft-forge
```

### 2. Configure Environment
Create a `.env` file in the root directory:
```env
 MINECRAFT_PORT=25565 
 JAVA_VERSION=17 
 MINECRAFT_JAR_URL=<forge-installer-url>
```

### 3. Build & Run

## Build the image
```bash
  docker-compose build
```
## Run the container
```bash
  docker-compose up
```

## ⚙️ Server Configuration

### Using `server_src/`
The `server_src/` directory contains all server configurations that will be copied to the final server:
_[see the example](https://github.com/theboshy/Forgelet/tree/main/example/server_src)_
1. **Mods Installation**
    - Place mod files in `server_src/mods/`
    - All .jar files will be automatically installed

2. **World Configuration**
    - Place your world data in `server_src/world/`
    - Include all dimension folders if needed

3. **Server Properties**
    - Modify `server_src/server.properties` for server settings
    - Changes will be reflected on server startup

4. **JVM Configuration**
    - Edit `server_src/user_jvm_args.txt` for Java settings
    - Default configuration:
      ```
      -Xmx8G
      -Xms4G
      -XX:+UseG1GC
      ```

## 🔗 Useful Links
- [Docker Documentation](https://docs.docker.com/)
- [Forge Documentation](https://docs.minecraftforge.net/)
- [Minecraft Server Properties Wiki](https://minecraft.fandom.com/wiki/Server.properties)
- [CurseForge](https://www.curseforge.com/minecraft/mc-mods)

## ⚠️ Important Notes
- Always backup your world data before updates
- Ensure mod compatibility with your Forge version
- Check hardware requirements for your mod pack
- Monitor server performance after configuration changes
