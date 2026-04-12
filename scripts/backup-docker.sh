#!/usr/bin/env bash


DATE_FORMAT=$(date "+%Y-%m-%d")
BACKUP_PATH="/drive/backup/docker"
DOCKER_VOLUME_PATH="/var/lib/docker/volumes/"
FINAL_FILE="volumes_docker-$DATE_FORMAT.tar.gz"
LOG_FILE="/drive/backup/backup.log"


if tar -czpf "$BACKUP_PATH/$FINAL_FILE" $DOCKER_VOLUME_PATH; then
	echo "[$DATE_FORMAT] backup realizado.\n" >> $LOG_FILE
else
	echo "[$DATE_FORMAT] backup não realizado.\n" >> $LOG_FILE
fi

find $BACKUP_PATH -mtime +21 -delete
