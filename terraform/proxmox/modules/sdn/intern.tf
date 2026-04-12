resource "proxmox_virtual_environment_sdn_zone_simple" "intern" {
  id    = "intern"
  nodes = [var.proxmox_node_name]

  # Optional attributes
  #   dns         = "1.1.1.1"
  #   dns_zone    = "example.com"
  ipam = "pve"
  #   reverse_dns = "1.1.1.1"
}

resource "proxmox_virtual_environment_sdn_vnet" "intern" {
  id   = "intern"
  zone = proxmox_virtual_environment_sdn_zone_simple.intern.id
  #   alias         = "Intern VNet"
  isolate_ports = false
  vlan_aware    = false

  depends_on = [
    proxmox_virtual_environment_sdn_applier.finalizer
  ]
}

# Basic Subnet
resource "proxmox_virtual_environment_sdn_subnet" "intern" {
  cidr    = local.intern_cidr
  vnet    = proxmox_virtual_environment_sdn_vnet.intern.id
  snat    = true
  gateway = local.intern_gw

  depends_on = [
    proxmox_virtual_environment_sdn_applier.finalizer
  ]
}

# SDN Applier for all resources
resource "proxmox_virtual_environment_sdn_applier" "intern_applier" {
  depends_on = [
    proxmox_virtual_environment_sdn_zone_simple.intern,
    proxmox_virtual_environment_sdn_vnet.intern,
    proxmox_virtual_environment_sdn_subnet.intern
  ]
}

resource "proxmox_virtual_environment_sdn_applier" "finalizer" {
}
