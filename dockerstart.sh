#!/usr/bin/env bash
# ----------------------------------------------------------------- #
################### Criando os volumes do docker ####################
# Portainer
docker volume create portainer_data

# Pihole
docker volume create pihole_app
docker volume create dns_config

# Postgres
docker volume create pg_data


####################### Criando os containers #######################
# Portainer
docker run -d \
	-p 9000:9000 \
	--name portainer \
	--hostname weedle \
	--restart=always \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v portainer_data:/data \
	portainer/portainer-ce
-H unix:///var/run/docker.sock

#################### Criando os docker composes ####################
# Duplicati
docker compose -f ./docker_composes/duplicati-compose.yaml up -d
docker compose -f ./docker_composes/pihole-compose.yaml up -d
docker compose -f ./docker_composes/postgres-compose.yaml up -d
docker compose -f ./docker_composes/resilio-compose.yaml up -d
