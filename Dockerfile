# ----------------------------------
# Pterodactyl Core Dockerfile
# Based on Parkers Egg
# ----------------------------------
FROM        node:8-alpine

LABEL       author="Nicholas S" maintainer="ptero.eggs@eramsorgr.pw"

RUN         && apt-get install ffmpeg
            && apk add --no-cache --update libc6-compat \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
