#!/usr/bin/env bash


source ~/projects/homelab/scripts/.env

sudo rsync -r --exclude={'.venv','venv','logs','games','proxmox'} --delete $PATH_DOCKER $PATH_DEST
rsync -r --exclude={'.venv','venv','logs','games','proxmox'} --delete $PATH_DEST_FULL $PATH_BACKUP
