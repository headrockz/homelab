variable "domain" {
  description = "Personal domain"
  type        = string
  sensitive   = true
}

variable "oauth_profile_id" {
  description = "OAuth profile property mapping ID"
  type        = string
}

variable "oauth_email_id" {
  description = "OAuth email property mapping ID"
  type        = string
}

variable "oauth_openid_id" {
  description = "OAuth openid property mapping ID"
  type        = string
}

variable "oauth_offline_access_id" {
  description = "OAuth offline access property mapping ID"
  type        = string
}

variable "proxy_outpost_id" {
  description = "Proxy Outpost property mapping ID"
  type        = string
}

variable "airflow_property_mapping_id" {
  description = "Airflow property mapping ID"
  type        = string
}

variable "minio_property_mapping_id" {
  description = "MinIO property mapping ID"
  type        = string
}

variable "openwebui_property_mapping_id" {
  description = "Open WebUI property mapping ID"
  type        = string
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

variable "authentik_admin_group_id" {
  default = "Authentik Admins Group ID"
  type    = string
}
