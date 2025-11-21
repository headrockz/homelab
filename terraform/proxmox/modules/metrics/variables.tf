variable "proxmox_node_name" {
  description = "Proxmox Node Name"
  sensitive   = false
  default     = "homeone"
}

variable "influxdb_host" {
  description = "InfluxDB Host"
  sensitive   = true
}

variable "influxdb_token" {
  description = "InfluxDB Token"
  sensitive   = true
}
