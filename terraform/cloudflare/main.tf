data "cloudflare_zones" "main" {
  name = var.cloudflare_zone_name
}

output "zone_id" {
  value = data.cloudflare_zones.main.result[0].name
}
