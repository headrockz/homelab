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
