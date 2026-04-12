variable "domain" {
  description = "Personal domain"
  type        = string
  sensitive   = true
}

variable "username" {
  description = "Authentik username"
  type        = string
  sensitive   = true
}

variable "akadmin" {
  description = "Authentik akadmin username"
  type        = string
  sensitive   = true
}
