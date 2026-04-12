resource "random_password" "kube1" {
  length           = 12
  override_special = "_%@"
  special          = true
}

resource "proxmox_virtual_environment_vm" "kube1" {
  name        = "kube1"
  description = "Kubernetes Node 1"
  tags        = ["dev", "kube"]

  node_name = var.proxmox_node_name
  vm_id     = 211
  on_boot   = false
  started   = false

  clone {
    datastore_id = "local"
    node_name    = var.proxmox_node_name
    vm_id        = 9000
    full         = true
  }

  agent {
    enabled = true
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = false

  startup {
    order      = "10"
    up_delay   = "60"
    down_delay = "60"
  }

  cpu {
    cores = 4
    type  = "host"
    units = 1024
  }

  memory {
    dedicated = 4096
  }

  disk {
    datastore_id = "local"
    size         = 50
    interface    = "scsi0"
    backup       = false
    ssd          = false
  }

  initialization {
    datastore_id = "local"

    ip_config {
      ipv4 {
        address = local.kube1_config.vmbr0_ip
        gateway = local.kube1_config.vmbr0_gw
      }
    }

    user_account {
      keys     = local.public_keys
      password = resource.random_password.kube1.result
      username = "charizard"
    }

  }

  network_device {
    bridge = "vmbr0"
  }

  #   operating_system {
  #     type = "l26"
  #   }

  #   tpm_state {
  #     version = "v2.0"
  #   }

  #   serial_device {}
  #   vga {}

  #   virtiofs {
  #     mapping = "data_share"
  #     cache = "always"
  #     direct_io = true
  #   }
}
