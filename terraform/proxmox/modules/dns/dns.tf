resource "proxmox_virtual_environment_dns" "dns_configuration" {
  domain    = "lan"
  node_name = var.proxmox_node_name

  servers = var.dns
}
