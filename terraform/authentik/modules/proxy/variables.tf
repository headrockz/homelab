variable "domain" {
  description = "Personal domain"
  type        = string
  sensitive   = true
}

variable "default_invalidation_flow" {
  description = "Default Invalidation Flow ID"
  type        = string
  default     = "default-provider-invalidation-flow"
}
variable "default_authorization_flow" {
  description = "Default Authorization Flow ID"
  type        = string
  default     = "default-provider-authorization-flow"
}

variable "default_self_singned" {
  description = "Default Self Singned Certificate ID"
  type        = string
  default     = "authentik Self-signed Certificate"
}
