#!/usr/bin/env bash

# Instalação das dependencias
sudo apt install udisks2 libglib2.0-bin network-manager dbus -y

# Instalação do OS Agent
wget https://github.com/home-assistant/os-agent/releases/download/1.2.2/os-agent_1.2.2_linux_x86_64.deb &&
sudo dpkg -i /os-agent_1.2.2_linux_x86_64.deb

# Instalação do Home Assistant Supervised
wget https://github.com/home-assistant/supervised-installer/releases/latest/download/homeassistant-supervised.deb &&  
sudo dpkg -i homeassistant-supervised.deb
