variable "minio_endpoint" {
  description = "MinIO endpoint URL"
  type        = string
}

variable "local_nas" {
  description = "Local NAS configuration"
  type        = string
}

variable "pihole_sync" {
  description = "PiHole synchronization configuration"
  type        = string
}

variable "openrouter_api" {
  description = "OpenRouter API key"
  type        = string
  default     = ""
}
