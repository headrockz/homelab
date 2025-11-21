variable "proxmox_node_name" {
  description = "Proxmox Node Name"
  sensitive   = false
  default     = "homeone"
}

variable "cloudflare_email" {
  description = "Cloudflare API email"
  sensitive   = true
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  sensitive   = true
}

variable "dns" {
  description = "DNS Servers"
  sensitive   = true
}

variable "influxdb_host" {
  description = "InfluxDB Host"
  sensitive   = true
}

variable "influxdb_token" {
  description = "InfluxDB Token"
  sensitive   = true
}
