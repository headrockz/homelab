# Gemini CLI Instructional Context - Asafe's Homelab

This project is a comprehensive Homelab automation and orchestration repository, managing infrastructure across multiple physical nodes and virtualization platforms.

## Project Overview

**Asafe's Homelab** is designed to provide a resilient, automated, and self-hosted environment for media, development, monitoring, and identity management.

### Key Technologies
- **Infrastructure as Code (IaC):** Terraform (Proxmox, Authentik)
- **Configuration Management:** Ansible
- **Container Orchestration:** Docker Compose
- **Networking & Security:** Traefik (Reverse Proxy), Cloudflare (DNS/SSL), Authentik (IdP), Tailscale (VPN)
- **Virtualization:** Proxmox (LXCs and VMs), OpenMediaVault (Falcon), DietPi (Tie)
- **Monitoring Stack:** Grafana, Loki, Prometheus, Telegraf, Glances

### Core Architecture (Main Nodes)
1.  **Falcon (OMV):** Main storage and service node (Mini PC N100).
2.  **Homeone (Proxmox):** Virtualization powerhouse (Mini PC i7). Host for LXCs (dbs, pihole) and VMs.
3.  **Tie (DietPi):** Lightweight edge node (Nano Pi RK3566).

---

## Directory Structure

- `ansible/`: Contains playbooks for Docker installation, system updates, and Traefik deployment.
    - `inventory/`: Host definitions (usually `hosts.ini` and `inventory.yaml`).
- `docker-compose/`: Subdirectories for each service (e.g., `traefik`, `authentik`, `media`, `databases`).
- `terraform/`: Managed infrastructure.
    - `proxmox/`: VM/LXC creation, networking, and metrics on Proxmox.
    - `authentik/`: Identity provider configuration (OAuth2, Proxy, Groups).
    - `kestra/`: Workflow orchestration configuration.
- `scripts/`: Operational shell scripts for backups, environment setup, and docker management.
- `.ansible/`: Local Ansible collections and roles.

---

## Operational Guide

### 1. Preparing a New Node (Ansible)
Use Ansible to install Docker and basic system tools:
```bash
ansible-playbook ansible/docker/docker-install.yaml -e "hosts=<host_group>"
ansible-playbook ansible/system/update-upgrade.yaml -e "hosts=<host_group>"
```

### 2. Infrastructure Deployment (Terraform)
Navigate to the desired module in `terraform/` and apply:
```bash
cd terraform/proxmox
tofu init
tofu apply
```
*(Note: Project uses Opentofu/Terraform interchangeably; check `scripts/post-install.sh` for preference.)*

### 3. Service Orchestration (Docker Compose)
Each service is managed individually within `docker-compose/`:
```bash
cd docker-compose/traefik
docker compose up -d
```
Most services depend on a pre-existing `server-backend` external network.

### 4. Local Development Environment
The project uses `poetry` for python-based linting and pre-commit hooks:
```bash
poetry install
poetry shell
```

---

## Conventions & Standards

- **Service Isolation:** Each Docker service resides in its own directory within `docker-compose/`.
- **Reverse Proxy:** All web services should be routed through Traefik using labels.
- **Authentication:** Prioritize Authentik integration (OIDC or Proxy) for all dashboards.
- **Variable Management:**
    - Use `.env` files for Docker Compose secrets.
    - Use `*.tfvars` or `*.secrets.tf` for Terraform sensitive data.
    - These files are globally ignored by Git.
- **Ansible Inventory:** Target hosts are grouped by type (e.g., `lxc`, `kube`, `remote`) in `ansible/inventory/hosts.ini`.

---

## Maintenance Scripts
- `scripts/backup-docker.sh`: Automated backup for container data.
- `scripts/post-install.sh`: Idempotent script to setup a Linux dev machine with all necessary tools (Docker, Kubectl, Opentofu, etc.).
