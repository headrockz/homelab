variable "minio_endpoint" {
  description = "MinIO endpoint URL"
  type        = string
  default     = ""
}

variable "local_nas" {
  description = "Local NAS configuration"
  type        = string
  default     = ""
}

variable "pihole_sync" {
  description = "PiHole synchronization configuration"
  type        = string
  default     = ""
}

variable "openrouter_api" {
  description = "OpenRouter API key"
  type        = string
  default     = ""
}

variable "grafana_url" {
  description = "Grafana URL"
  type        = string
  default     = ""
}

variable "kestra_url" {
  description = "Kestra URL"
  type        = string
  default     = ""
}

variable "backup_paths" {
  description = "Backup paths configuration"
  type        = string
}
