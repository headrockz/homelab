resource "random_password" "pihole" {
  length           = 12
  override_special = "_%@"
  special          = true
}

resource "proxmox_virtual_environment_container" "pihole" {
  node_name     = var.proxmox_node_name
  vm_id         = 101
  description   = "PiHole DNS Server"
  tags          = ["net", "prd", "dns"]
  unprivileged  = true
  start_on_boot = true
  started       = true

  operating_system {
    template_file_id = proxmox_virtual_environment_download_file.debian_13_standard_13_1_2_amd64_lxc_img.id
    type             = "debian"
  }

  cpu {
    cores = 1
  }

  memory {
    dedicated = 512
    swap      = 512
  }

  disk {
    datastore_id = "local"
    size         = 5
  }

  features {
    nesting = true
  }

  console {
    enabled = true
    type    = "tty"
  }

  startup {
    down_delay = -1
    order      = 1
    up_delay   = -1
  }

  network_interface {
    name   = "eth1"
    bridge = "intern"
  }

  network_interface {
    name   = "eth0"
    bridge = "vmbr0"
  }

  initialization {
    hostname = "pihole"

    ip_config {
      ipv4 {
        address = local.pihole_config.intern_ip
        # gateway = local.pihole_config.intern_gw
      }
    }
    ip_config {
      ipv4 {
        address = local.pihole_config.vmbr0_ip
        gateway = local.pihole_config.vmbr0_gw
      }
    }

    # DNS configuration
    # dns {
    #   servers = var.dns
    # }

    # SSH keys
    user_account {
      keys     = local.pihole_config.public_keys
      password = random_password.pihole.result
    }
  }
}
