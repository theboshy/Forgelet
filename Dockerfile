FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
LABEL authors="theboshy"

WORKDIR /minecraft

ARG JAVA_VERSION
RUN apt-get update && apt-get install -y \
    openjdk-${JAVA_VERSION}-jdk \
    wget \
    && rm -rf /var/lib/apt/lists/*

ARG MINECRAFT_JAR_URL
RUN wget -O server-installer.jar ${MINECRAFT_JAR_URL}

WORKDIR /minecraft/forge-server

ARG MINECRAFT_PORT
EXPOSE ${MINECRAFT_PORT}

# startup script that handles installation + server start
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]