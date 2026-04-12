#!/usr/bin/env bash


source ~/projects/homelab/scripts/.env

CONTAINER_NAME="cloudflared"

start_container() {
  if [ -z "$(docker ps -a -q -f name="$CONTAINER_NAME")" ]; then
    echo "Iniciando o container $CONTAINER_NAME..."
    docker run -d --network server-backend --name cloudflared cloudflare/cloudflared:latest tunnel --no-autoupdate run --token $CLOUDFLARE_TOKEN
  else
    echo "O container $CONTAINER_NAME já está em execução."
  fi
}


stop_container() {
  if ! [ -z "$(docker ps -a -q -f name="$CONTAINER_NAME")" ]; then
    echo "Parando o container $CONTAINER_NAME..."
    docker stop "$CONTAINER_NAME" && docker rm -f "$CONTAINER_NAME"
  else
    echo "O container $CONTAINER_NAME não está em execução."
  fi
}

if ping -c 1 -W 1 "$IP" &> /dev/null; then
  echo "IP acessível: $IP"
  stop_container
else
  echo "IP inacessível: $IP"
  start_container
fi
