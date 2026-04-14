resource "random_password" "destroyer" {
  length           = 12
  override_special = "_%@"
  special          = true
}

resource "proxmox_virtual_environment_container" "destroyer" {
  node_name     = var.proxmox_node_name
  vm_id         = 104
  description   = "Destroyer"
  tags          = ["srv"]
  unprivileged  = true
  start_on_boot = true
  started       = true

  operating_system {
    template_file_id = proxmox_virtual_environment_download_file.debian_13_standard_13_1_2_amd64_lxc_img.id
    type             = "debian"
  }

  cpu {
    cores = 6
  }

  memory {
    dedicated = 16384
    swap      = 512
  }

  disk {
    datastore_id = "local"
    size         = 50
  }

  mount_point {
    volume = local.destroyer_config.proxmox_mp
    path   = local.destroyer_config.lxc_path
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
    order      = 2
    up_delay   = -1
  }

  network_interface {
    name   = "eth0"
    bridge = "intern"
  }

  network_interface {
    name   = "eth1"
    bridge = "vmbr0"
  }

  initialization {
    hostname = "destroyer"

    ip_config {
      ipv4 {
        address = local.destroyer_config.intern_ip
        gateway = local.destroyer_config.intern_gw
      }
      ipv6 {
        address = "manual"
      }
    }

    ip_config {
      ipv4 {
        address = local.destroyer_config.vmbr0_ip
      }
      ipv6 {
        address = ""
      }
    }

    user_account {
      keys     = local.destroyer_config.public_keys
      password = random_password.destroyer.result
    }
  }
}
