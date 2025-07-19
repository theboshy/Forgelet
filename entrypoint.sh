#!/bin/bash

echo "Starting Minecraft Forge Server..."

# Install Forge server if not already done
if [ ! -f "run.sh" ]; then
    echo "Installing Forge server..."
    java -jar /minecraft/server-installer.jar --installServer /minecraft/forge-server
    echo "eula=true" > eula.txt
    echo "Forge server installation completed."
fi

# Ensure run.sh is executable
if [ -f "run.sh" ]; then
    chmod +x run.sh
    echo "Starting Minecraft server..."
    ./run.sh
else
    echo "ERROR: run.sh not found! Server installation may have failed."
    exit 1
fi
