# Asafe's Homelab

## Network

| NAME | SUBNET | ID |
|--------|--------|----|
| SERVER | 192.168.1.0/28  | 1 |
|  MAIN  | 192.168.2.0/24  | 2 |
| CAMERA | 192.168.3.0/28  | 3 |
| GUEST  | 192.168.10.0/25 | 10 |

## Software

- Mini PC - [Proxmox](https://www.proxmox.com/en)
- Nas - [Open media Vault](https://www.openmediavault.org/)
- Nano Pi R5C - [DietPi](https://dietpi.com/)

### Falcon - Mini PC

- LXC 1 e 2 - Debian (1cpu 512mb)
  - pihole
- LXC  - Debian (2cpu 4gb)
  - nginx proxy manager
  - portainer
  - uptime
  - cloudflared
  - Syncthing
  - Resilio Sync
  - Duplacati
 - VM 1 - OpenWrt (1cpu 1gb)
  - tailscale
- VM 2 - Open Media Vault (4cpu 8gb)
  - Samba
  - NFS

### Tie - Nano Pi

- casa os
- jellyfin
- transmission
- pihole
- postgres
- influxdb
- grafana
- mongodb
- mysql

### Xwing - Mini PC

- VM 1 - Ubuntu (4cpu 8gb)
  - docker
  - pyenv
  - airflow
- VM 2,3,4 - Ubuntu (2cpu 2gb)
  - Kubernetes
