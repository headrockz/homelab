variable "proxmox_node_name" {
  description = "Proxmox Node Name"
  type        = string
  sensitive   = false
  default     = "homeone"
}

variable "cloudflare_email" {
  description = "Cloudflare API email"
  type        = string
  sensitive   = true
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "dns" {
  description = "DNS Servers"
  type        = list(string)
  sensitive   = true
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

variable "intern_cidr" {
  description = "CIDR block for the intern SDN subnet"
  type        = string
}

variable "intern_gw" {
  description = "Gateway IP for the intern SDN subnet"
  type        = string
}

variable "acl_path" {
  description = "ACL path for the api-users group"
  type        = string
}

variable "acl_role" {
  description = "ACL role assigned to the api-users group"
  type        = string
}
