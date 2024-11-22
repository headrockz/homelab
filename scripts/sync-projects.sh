#!/usr/bin/env bash


source ~/projects/homelab/scripts/.env

rsync -r --exclude={'.venv','venv','logs'} --delete $PATH_PROJECTS $PATH_DEST
