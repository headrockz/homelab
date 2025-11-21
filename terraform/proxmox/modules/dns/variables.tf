variable "proxmox_node_name" {
  description = "Proxmox Node Name"
  sensitive   = false
  default     = "homeone"
}

variable "dns" {
  description = "DNS Servers"
  sensitive   = true
}
