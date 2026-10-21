module "kv" {
  source = "./modules/kv"

  minio_endpoint = var.minio_endpoint
  openrouter_api = var.openrouter_api
  local_nas      = var.local_nas
  pihole_sync    = var.pihole_sync
  grafana_url    = var.grafana_url
  kestra_url     = var.kestra_url
  backup_paths   = var.backup_paths
}

module "flows" {
  source = "./modules/flows"

  kv_dev_openrouter_api = module.kv.kv_dev_openrouter_api
}
