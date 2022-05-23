#!/usr/bin/env bash
curl -fsSL https://code-server.dev/install.sh | sh

# Now visit http://127.0.0.1:8080. Your password is in ~/.config/code-server/config.yaml

sudo systemctl stop code-server@$USER

# echo "[Unit]
# Description=code-server
# After=network.target

# [Service]
# User=pi
# Group=pi

# WorkingDirectory=/home/pi
# Environment=\"PATH=/usr/bin\"
# ExecStart=/home/pi/.yarn/bin/code-server

# [Install]
# WantedBy=multi-user.target" > sudo /etc/systemd/system/code-server.service


echo "bind-addr: 0.0.0.0:8080
auth: none
password: password
cert: false" > ~/.config/code-server/config.yaml
# cert: true
# cert-host: code.local" > ~/.config/code-server/config.yaml


sudo systemctl restart code-server@$USER
sudo systemctl enable --now code-server@$USER
