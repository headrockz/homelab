module "acme" {
  source = "./modules/acme"

  cloudflare_email     = var.cloudflare_email
  cloudflare_api_token = var.cloudflare_api_token
}

module "dns" {
  source = "./modules/dns"

  dns = var.dns
}

module "metrics" {
  source = "./modules/metrics"

  influxdb_host  = var.influxdb_host
  influxdb_token = var.influxdb_token
}
