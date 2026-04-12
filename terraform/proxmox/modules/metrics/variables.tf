variable "proxmox_node_name" {
  description = "Proxmox Node Name"
  type        = string
  sensitive   = false
  default     = "homeone"
}

variable "influxdb_host" {
  description = "InfluxDB Host"
  type        = string
  sensitive   = true
}

variable "influxdb_token" {
  description = "InfluxDB Token"
  type        = string
  sensitive   = true
}
