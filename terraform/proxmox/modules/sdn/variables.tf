variable "proxmox_node_name" {
  description = "Proxmox Node Name"
  type        = string
  sensitive   = false
  default     = "homeone"
}

variable "dns" {
  description = "DNS Servers"
  type        = list(string)
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
