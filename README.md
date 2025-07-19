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

### Using `server_src/` - Configuration Overlay
The `server_src/` directory acts as a **configuration overlay** that customizes your server:

**How it works:**
- Docker automatically installs Forge and generates all necessary server files
- Any files you place in `server_src/` will **override** the auto-generated ones
- This allows you to customize mods, settings, and worlds without rebuilding the image

_[see the example](https://github.com/theboshy/Forgelet/tree/main/example/server_src)_

1. **Custom Mods**
    - Place your mod `.jar` files in `server_src/mods/`
    - They will replace/add to the default mod collection

2. **Custom World**
    - Place your world data in `server_src/world/`
    - Will override the auto-generated world

3. **Custom Server Settings**
    - Create/modify `server_src/server.properties` to override default settings
    - Changes apply immediately on container restart

4. **Custom JVM Settings**
    - Modify `server_src/user_jvm_args.txt` to override default Java settings
    - Current default configuration:
      ```
      -Xmx8G
      -Xms4G
      -XX:+UseG1GC
      ```

**💡 Pro Tip:** Start with an empty `server_src/` folder to get a vanilla Forge server, then add your customizations incrementally.

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
