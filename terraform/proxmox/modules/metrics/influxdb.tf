resource "proxmox_virtual_environment_metrics_server" "influxdb" {
  name                = "influxdb"
  server              = var.influxdb_host
  port                = 8086
  type                = "influxdb"
  influx_db_proto     = "https"
  influx_organization = "homelab"
  influx_bucket       = "proxmox"
  influx_verify       = false
  influx_token        = var.influxdb_token
}
