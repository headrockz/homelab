variable "proxmox_node_name" {
  description = "Proxmox Node Name"
  type        = string
  sensitive   = false
  default     = "homeone"
}

variable "acl_path" {
  description = "ACL path for the api-users group"
  type        = string
}

variable "acl_role" {
  description = "ACL role assigned to the api-users group"
  type        = string
}
