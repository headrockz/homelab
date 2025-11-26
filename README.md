# Asafe's Homelab

## Hardware e Software

- Mini PC - Falcon - [Open Media Vault](https://www.openmediavault.org/)
	-  CPU N100
	- 16gb ram
	- 512gb nvme (root)
	- 2x 2tb hd (Raid 1 - md)
- Mini PC - Homeone - [Proxmox](https://www.proxmox.com/en)
	- CPU I7 12650H
	- 64gb ram
	- 1tb ssd (root)
	- 2tb ssd (sata)
- Nano Pi - Tie - [Diet Pi](https://dietpi.com)
	- CPU RK3566
	- 4gb ram
	- 32 emmc (root)
	- 512gb (usb)

## Falcon

| Name   | Type | ID  | System | CPU | Ram  | Disk  | Service                                                                                                                                                                                                                                                                  |
| ------ | ---- | --- | ------ | --- | ---- | ----- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Falcon | Host | 1   | OMV    | 4   | 16gb | 512gb | Samba<br>NFS<br>Pihole<br>Tailscale<br>Authentik<br>Cloudflared<br>Traefik<br>Open WebUI<br>Whats Up Docker<br>Zigbee2mqtt<br>Mqtt<br>Home Assistant<br>Syncthing<br>Homepage<br>It Tools<br>Stirling PDF<br>RomM<br>Next Explorer<br>Immich<br>Jellyfin<br>Transmission |

## Homeone

| Name      | Type | ID  | System  | CPU | Ram   | Disk  | Service                                                        |
| --------- | ---- | --- | ------- | --- | ----- | ----- | -------------------------------------------------------------- |
| Homeone   | Host | 1   | Proxmox | 16  | 64gb  | 1tb   | Proxmox                                                        |
| Pihole    | LXC  | 101 | Debian  | 1   | 512mb | 5gb   | Pihole                                                         |
| Pihole2   | LXC  | 102 | Debian  | 1   | 512mb | 5gb   | Pihole                                                         |
| Dbs       | LXC  | 103 | Debian  | 4   | 8gb   | 50gb  | Traefik<br>PostgreSQL<br>MySQL<br>MongoDB<br>Redis<br>InfluxDB |
| Destroyer | LXC  | 104 | Debian  | 6   | 16gb  | 50gb  | Traefik<br>Airflow<br>Kestra <br>MinIO<br>Syncthing            |
| Xwing     | LXC  | 105 | Debian  | 2   | 4gb   | 50gb  | Traefik<br>Grafana<br>Loki<br>Prometheus<br>Statds Explorer    |
| Dev       | VM   | 201 | Ubuntu  | 8   | 32gb  | 250gb | Python<br>Traefik                                              |

## Tie

| Name | Type | ID  | System | CPU | Ram | Disk  | Service                                                                                 |
| ---- | ---- | --- | ------ | --- | --- | ----- | --------------------------------------------------------------------------------------- |
| Tie  | Host | 1   | DietPi | 4   | 4gb | 512gb | Pihole<br>Tailscale<br>Traefik<br>Uptime Kuma<br>Glances<br>Telegraf<br>Whats up Docker |
