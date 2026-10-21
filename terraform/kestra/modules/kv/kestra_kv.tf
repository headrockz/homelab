resource "kestra_kv" "minio_endpoint" {
  namespace   = "dev"
  type        = "STRING"
  key         = "MINIO_ENDPOINT"
  description = "MinIO endpoint"
  value       = var.minio_endpoint
}

resource "kestra_kv" "local_nas" {
  namespace   = "prd"
  type        = "JSON"
  key         = "LOCAL_NAS"
  description = "Local NAS configuration"
  value       = var.local_nas
}

resource "kestra_kv" "openrouter_api" {
  namespace   = "prd"
  type        = "STRING"
  key         = "OPENROUTER_API"
  description = "OpenRouter API key"
  value       = var.openrouter_api
}

resource "kestra_kv" "openrouter_api_dev" {
  namespace   = "dev"
  type        = "STRING"
  key         = "OPENROUTER_API"
  description = "OpenRouter API key for development"
  value       = var.openrouter_api
}

resource "kestra_kv" "pihole_sync" {
  namespace   = "prd"
  type        = "JSON"
  key         = "PIHOLE_SYNC"
  description = "PiHole synchronization configuration"
  value       = var.pihole_sync
}

resource "kestra_kv" "grafana_url" {
  namespace   = "prd"
  type        = "STRING"
  key         = "GRAFANA_URL"
  description = "Grafana URL"
  value       = var.grafana_url
}

resource "kestra_kv" "kestra_url" {
  namespace   = "system"
  type        = "STRING"
  key         = "KESTRA_URL"
  description = "Kestra URL"
  value       = var.kestra_url
}

resource "kestra_kv" "backup_paths" {
  namespace   = "prd"
  type        = "JSON"
  key         = "BACKUP_PATHS"
  description = "Backup paths configuration"
  value       = var.backup_paths
}
