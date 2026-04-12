# Ansible Homelab

## Overview

This repository contains Ansible scripts for managing a homelab infrastructure, including Docker installation and Traefik deployment. Check this [post](https://asafelp.dev/posts/come%C3%A7ando-com-ansible/)

## Structure

```txt
ansible/
├── docker/                 # Docker management scripts
│   ├── docker-api-enable.yaml  # Enable Docker API
│   ├── docker-clean.yaml       # Clean Docker resources
│   └── docker-install.yaml     # Install Docker
├── inventory/              # Host definitions
│   ├── hosts.ini           # Simple inventory file
│   └── inventory.yaml      # YAML-format inventory
└── traefik/                # Traefik deployment
    ├── docker-deploy-traefik.yaml  # Deploy Traefik
    └── docker-stop-traefik.yaml    # Stop Traefik
```

## Inventory Structure

### Configuration (`hosts.ini`)

The `hosts.ini` file defines the servers and their grouping for Ansible management:

```ini
# Individual servers
[server-lxc-1]
192.168.x.x

[server-lxc-2]
192.168.x.x

# Groups by type
[kube]
192.168.x.x
192.168.x.x
192.168.x.x
[kube:vars]
ansible_user=username

# Remote/external servers
[remote]
x.x.x.x
[remote:vars]
ansible_user=username

# Group of LXC containers
[lxc]
server-lxc-1
server-lxc-2
[lxc:vars]
ansible_user=username
```

### Configuration (`ansible.cfg`)

The `ansible.cfg` file in the project root configures Ansible's default behavior:

```ini
[defaults]
inventory = ansible/inventory/hosts.ini
ansible_python_interpreter=/usr/bin/python3
host_key_checking = false
```

#### Key Settings

- **Default inventory**: Uses `ansible/inventory/hosts.ini` as the default inventory, allowing you to run commands without specifying `-i`
- **Python 3**: Forces the use of Python 3 on all managed hosts
- **No SSH key checking**: Disables host key verification (`host_key_checking = false`), making deployment easier in lab environments

## Usage Examples

With this configuration file in the project root, you can run Ansible commands in a simplified way:

```bash
# You can pass additional variables as needed
ansible-playbook ansible/traefik/docker-deploy-traefik.yaml -e "hosts=lxc"
```

**Note**: Disabling SSH key checking is convenient for lab environments but not recommended for production environments for security reasons.

## Usage with Playbooks

When running playbooks, target specific host groups:

```bash
# Target all LXC containers
ansible-playbook playbook.yaml -e "hosts=lxc"

# Target specific host
ansible-playbook playbook.yaml -e "hosts=server-lxc-1"
ansible-playbook playbook.yaml -e "hosts=server-lxc-2"
```
