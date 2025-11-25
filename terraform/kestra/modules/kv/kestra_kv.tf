resource "kestra_kv" "minio_endpoint" {
  namespace = "dev"
  type      = "STRING"
  key       = "MINIO_ENDPOINT"
  value     = var.minio_endpoint
}

resource "kestra_kv" "local_nas" {
  namespace = "prd"
  type      = "JSON"
  key       = "LOCAL_NAS"
  value     = var.local_nas
}

resource "kestra_kv" "openrouter_api" {
  namespace = "prd"
  type      = "STRING"
  key       = "OPENROUTER_API"
  value     = var.openrouter_api
}

resource "kestra_kv" "openrouter_api_dev" {
  namespace = "dev"
  type      = "STRING"
  key       = "OPENROUTER_API"
  value     = var.openrouter_api
}

resource "kestra_kv" "pihole_sync" {
  namespace = "prd"
  type      = "JSON"
  key       = "PIHOLE_SYNC"
  value     = var.pihole_sync
}
