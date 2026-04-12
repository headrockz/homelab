#!/usr/bin/env bash

CONTAINERS_ID=$(docker container ls -a | awk '{if (NR>1) print $1}')
IMAGES_ID=$(docker images | awk '{if (NR>1) print $3}')
VOLUMES_ID=$(docker volume ls | awk '{if (NR>1) print $2}')

for cont_id in ${CONTAINERS_ID}; do
	echo "container id - ${cont_id}"
	docker container kill ${cont_id}
	docker container rm ${cont_id} --force
done

docker container ls -a

for img_id in ${IMAGES_ID}; do
	echo "images id - ${img_id}"
	docker rmi ${img_id} --force
done

docker images

for vol_id in ${VOLUMES_ID}; do
	echo "vol id - ${vol_id}"
	docker volume rm ${vol_id}
done

docker volume ls
