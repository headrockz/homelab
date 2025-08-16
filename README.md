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
- Nano Pi Tie - [Diet Pi](https://dietpi.com/)
	- Processador RK3566
	- 4gb ram
	- 32 emmc (root)
	- 512gb (usb)

## Falcon

| Nome   | Tipo | ID  | Sistema | CPU | Ram  | Disco | Serviço(s)                                                                                                                                                                                                                                                       |
| ------ | ---- | --- | ------- | --- | ---- | ----- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Falcon | Host | 1   | OMV     | 4   | 16gb | 512gb | Samba<br>NFS<br>Pihole<br>Tailscale<br>Syncthing<br>File Browser<br>MinIO<br>Cloudflared<br>Nginx Proxy Manager<br>It Tools<br>Stirling PDF<br>Grafana<br>Loki<br>Prometheus<br>Statds Explorer<br>InfluxDB<br>Telegraf<br>Zigbee2mqtt<br>Mqtt<br>Home Assistant |

## Homeone

| Nome      | Tipo | ID  | Sistema | CPU | Ram   | Disco | Serviço(s)                                |
| --------- | ---- | --- | ------- | --- | ----- | ----- | ----------------------------------------- |
| Homeone   | Host | 1   | Proxmox | 16  | 64gb  | 1tb   | Proxmox                                   |
| Pihole    | LXC  | 101 | Debian  | 1   | 512mb | 5gb   | Pihole                                    |
| Pihole2   | LXC  | 102 | Debian  | 1   | 512mb | 5gb   | Pihole                                    |
| Dbs       | LXC  | 103 | Debian  | 4   | 8gb   | 100gb | PostgreSQL<br>MySQL<br>MongoDB<br>Redis   |
| Destroyer | LXC  | 104 | Debian  | 6   | 16gb  | 50gb  | Airflow<br>Kestra<br>Traefik<br>Syncthing |
| Dev       | VM   | 201 | Ubuntu  | 8   | 32gb  | 250gb | Python<br>Docker<br>Traefik               |

## Tie

| Nome | Tipo | ID  | Sistema | CPU | Ram | Disco | Serviço(s)                                                                            |
| ---- | ---- | --- | ------- | --- | --- | ----- | ------------------------------------------------------------------------------------- |
| Tie  | Host | 1   | OMV     | 4   | 4gb | 512gb | Pihole<br>Tailscale<br>Traefik<br>Uptime Kuma<br>Glances<br>Promtail<br>Node Exporter |
