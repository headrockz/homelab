module "acme" {
  source = "./modules/acme"

  proxmox_node_name    = var.proxmox_node_name
  cloudflare_email     = var.cloudflare_email
  cloudflare_api_token = var.cloudflare_api_token
}

module "dns" {
  source = "./modules/dns"

  proxmox_node_name = var.proxmox_node_name
  dns               = var.dns
}

module "metrics" {
  source = "./modules/metrics"

  proxmox_node_name = var.proxmox_node_name
  influxdb_host     = var.influxdb_host
  influxdb_token    = var.influxdb_token
}

module "groups" {
  source = "./modules/groups"

  proxmox_node_name = var.proxmox_node_name
}

module "sdn" {
  source = "./modules/sdn"

  proxmox_node_name = var.proxmox_node_name
  dns               = var.dns
}

module "lxc" {
  source = "./modules/lxc"

  proxmox_node_name = var.proxmox_node_name
  dns               = var.dns
}

module "kube" {
  source = "./modules/kube"

  proxmox_node_name = var.proxmox_node_name
  dns               = var.dns
}
