FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

LABEL authors="theboshy"

WORKDIR /minecraft

ARG JAVA_VERSION=17

RUN apt-get update && apt-get install -y \
    openjdk-${JAVA_VERSION}-jdk \
    wget \
    && rm -rf /var/lib/apt/lists/*

ARG MINECRAFT_JAR_URL
RUN wget -O server-installer.jar ${MINECRAFT_JAR_URL}

RUN mkdir -p /minecraft/forge-server

RUN java -jar server-installer.jar --installServer ./forge-server

WORKDIR /minecraft/forge-server

COPY server_src/ .

RUN echo "eula=true" > eula.txt

ARG MINECRAFT_PORT
EXPOSE ${MINECRAFT_PORT}

RUN chmod +x run.sh

CMD [ "./run.sh" ]
