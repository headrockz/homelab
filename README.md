# Asafe's Homelab

## Hardware

- Mini PC generico
  - Processador N100 16gb ram e 512gb ssd
- Nano Pi R5C
  - 4gb ram 32gb emmc
- Raspberry Pi 4
  - 4gb ram

## Network

| NAME | SUBNET | ID |  
|--------|--------|----|
| SERVER | 192.168.1.0/28  | 1 |
|  MAIN  | 192.168.2.0/24  | 2 |
| CAMERA |  192.168.30/28  | 3 |
| GUEST  | 192.168.10.0/25 | 10 |

## Software

- Mini PC - [Proxmox](https://www.proxmox.com/en/)
- Nano Pi R5C - [DietPi](https://dietpi.com/)
- Raspberry Pi 4 - [OpenWrt](https://openwrt.org/)

### Proxmox - Mini PC

- LXC 1 e 2 - Debian (1cpu 512mb)
  - pihole
- LXC 3 - Debian (1cpu 1gb)
  - nginx proxy manager
  - portainer
  - uptime
  - grafana
  - cloudflared
- VM 1 - OpenWrt (1cpu 1gb)
- tailscale
- VM 2 - Ubuntu (4cpu 8gb)
  - docker
  - pyenv
  - airflow

### DietPi - Nano Pi

- casaos
- jellyfin
- transmission
- pihole

### OpenWrt - Raspberry Pi

- travel route
