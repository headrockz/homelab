# Asafe's Homelab

## Arquitetura do Homelab

![Diagrama do Homelab](/assets/homelab.png)

## Hardware e Software

- Mini PC Falcon - [Open Media Vault](https://www.openmediavault.org/)
	-  Processador N100
	- 16gb ram
	- 512gb nvme (root)
	- 2x 2tb hd (Raid 1 - md)
- Mini PC Homeone - [Proxmox](https://www.proxmox.com/en)
	- Processador I7 12650H
	- 64gb ram
	- 1tb ssd (root)
	- 2tb ssd (sata)
- Nano Pi Tie - [Diet Pi]([DietPi - Lightweight justice for your SBC!](https://dietpi.com/))
	- Processador RK3566
	- 4gb ram
	- 32 emmc (root)
	- 512gb (usb)

## Falcon

| Nome   | Tipo | ID  | Sistema | CPU | Ram  | Disco | Serviço(s)                                                                                                                                                                                                            |
| ------ | ---- | --- | ------- | --- | ---- | ----- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Falcon | Host | 1   | OMV     | 4   | 16gb | 512gb | Samba<br>NFS<br>Syncthing<br>Resilio Sync<br>Duplacati<br>File Browser<br>Tailscale<br>Cloudflared<br>Nginx Proxy Manager<br>Portainer<br>Uptime Kuma<br>Grafana<br>Zigbee2mqtt<br>Mqtt<br>Node Red<br>Home Assistant |

## Homeone

| Nome     | Tipo | ID  | Sistema | CPU | Ram   | Disco | Serviço(s)                                          |
| -------- | ---- | --- | ------- | --- | ----- | ----- | --------------------------------------------------- |
| Homeone  | Host | 1   | Proxmox | 16  | 64gb  | 1tb   | Proxmox                                             |
| Pihole   | LXC  | 101 | Debian  | 1   | 512mb | 5gb   | Pihole                                              |
| Pihole2  | LXC  | 102 | Debian  | 1   | 512mb | 5gb   | Pihole                                              |
| Dbs      | LXC  | 103 | Debian  | 4   | 8gb   | 100gb | PostgreSQL<br>InfluxDB<br>MySQL<br>MongoDB<br>Redis |
| Dev      | VM   | 201 | Ubuntu  | 8   | 32gb  | 250gb | Airflow<br>Kestra<br>                        |

## Tie

| Nome | Tipo | ID  | Sistema | CPU | Ram | Disco | Serviço(s) |
| ---- | ---- | --- | ------- | --- | --- | ----- | ---------- |
| Tie  | Host | 1   | OMV     | 4   | 4gb | 512gb | Pihole<br>Tailscale<br>     |
