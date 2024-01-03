#!/usr/bin/env bash
# ----------------------------------------------------------------- #
################### Criando os volumes do docker ####################
# Portainer
docker volume create portainer_data

# Pihole
docker volume create pihole_app
docker volume create dns_config

# docker network  create  -d ipvlan \
#     --subnet=192.168.15.0/24 \
#     --gateway=192.168.15.1 \
#     -o parent=eth0.20 pihole_net

# Postgres
docker volume create pg_data

####################### Criando os containers #######################
# Portainer
docker run -d \
	-p 9000:9000 \
	-p 9443:9443 \
	-p 8000:8000 \
	--name portainer \
	--hostname falcon-portainer \
	--restart=always \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v portainer_data:/data \
	portainer/portainer-ce:latest \
	-H unix:///var/run/docker.sock \
	--http-enabled

docker run -d \
  	-p 9001:9001 \
	--name portainer_agent \
	--restart=always \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /var/lib/docker/volumes:/var/lib/docker/volumes \
	portainer/agent

#################### Criando os docker composes ####################
docker-compose -f duplicati/docker-compose.yaml up -d --force-recreate
docker-compose -f file-run/docker-compose.yaml up -d --force-recreate
docker-compose -f mongodb/docker-compose.yaml up -d --force-recreate
docker-compose -f monitoring/docker-compose.yaml up -d --force-recreate
docker-compose -f mysql/docker-compose.yaml up -d --force-recreate
docker-compose -f n8n/docker-compose.yaml up -d --force-recreate
docker-compose -f nginx-proxy-manager/docker-compose.yaml up -d --force-recreate
docker-compose -f pihole/docker-compose.yaml up -d --force-recreate
docker-compose -f postgres/docker-compose.yaml up -d --force-recreate
docker-compose -f resilio-sync/docker-compose.yaml up -d --force-recreate

