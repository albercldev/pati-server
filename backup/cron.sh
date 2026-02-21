#!/bin/sh

cd /var/docker/cobblemon-conquest
docker compose up --no-start --build backup
docker compose start backup