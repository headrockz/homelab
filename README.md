# Asafe's Homelab

[LinkedIn Post](https://www.linkedin.com/pulse/meu-homelab-asafe-felipe-wb3if/?trackingId=2GMQnhG8Smeis%2FGN5bT7RQ%3D%3D)

Cada computador recebe o nome de uma nave do Star Wars, sendo eles:

- Falcon, um mini pc com processador n100 da intel, 16gb de ram, dois SSDs de 512gb e dois HDs de 2tb.
- Xwing, outro mini pc com processador n100, 16gb de ram e um SSD de 512gb

## Software

> Os dois mini pcs rodam o [Proxmox](https://www.proxmox.com/en) (um sistema de virtualização) como sistema operacional.

O Falcon fica destinado a executar aplicações mais "produtivas" como meu DNS, VPN e meu NAS, ele estão sendo executo as seguintes VMs e LXCs.
- LXC 1 e 2 - Debian (1cpu 512mb de ram), onde executo o Pihole
- LXC 3 - Debian (2cpu 6gb de ram), onde executo o My Speed Test, Portainer, Cloudflared, Nginx Proxy Manager, Uptime Kuma e o Grafana, também meus bancos de dados (PostgreSQL, MySQL, InfluxDB, MongoDB e Redis).
- VM 1 - OpenWrt (1cpu 1gb de ram), onde executo o tailscale
- VM 2 - Open Media Vault (2cpu 8gb de ram), é o meu NAS, onde executo o Samba e o NFS, também tenho alguns containers rodando (Syncthing, Duplicati e Resilio Sync).

Também dentro do Falcon executo a aplicação Casa OS, é uma interface web para gerenciar aplicações docker fornecidas pela "App Store" deles, mas também é possível adicionar links externos.

Já o Xwing fica responsável por ser meu laboratório, tenho algumas VMs de teste como do True NAS, outra Open Media Vault, essas duas VMs essas não ficam sempre ligadas, além delas, tenho uma VM com Ubuntu Server que é meu ambiente de desenvolvimento, e tenho outras 3 VMs também com Ubuntu que rodam um cluster Kubernetes com o k3s.

## Serviços

### Databases

- PostgreSQL
- InfluxDB
- MySQL
- MongoDB
- Redis

### Monitoring

- Grafana
- My Speed Test
- Portainer
- Uptime

### Network

- Cloudflared
- Nginx Proxy Manager
- Pihole
- Tailscale

### Shares

- Duplacati
- NFS
- Samba
- Resilio Sync
- Syncthing
