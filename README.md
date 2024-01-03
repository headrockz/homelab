# Asafe's Homelab

## Hardware

- Mini PC generico
    - Processador N100 16gb ram e 512gb ssd
- Nano Pi R5C
    - 4gb ram 32gb emmc
- Raspberry Pi 4 4gb ram

## Software

- Mini PC - [Proxmox](https://www.proxmox.com/en/)
- Nano Pi R5C - [DietPi](https://dietpi.com/)
- Raspberry Pi 4 - [OpenWrt](https://openwrt.org/)

### Proxmox - Mini PC

- LXC 1 e 2 - debian (1cpu 512mb)
    - pihole
- LXC 3 - debian (1cpu 1gb)
	- casa os
	- nginx proxy manager
	- portainer
	- uptime
	- grafana
	- cloudflared
	- n8n
	- rundeck
    - github runner
- VM 1 - OpenWrt (1cpu 1gb)
	 - tailscale
- VM 2 - Ubuntu (4cpu 8gb)
    - docker
    - pyenv
    - airflow

### DietPi - Nano Pi

- jellyfin
- transmission
- pihole

### OpenWrt - Raspberry Pi

- travel route
