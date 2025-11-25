module "kv" {
  source = "./modules/kv"

  minio_endpoint = var.minio_endpoint
  openrouter_api = var.openrouter_api
  local_nas      = var.local_nas
  pihole_sync    = var.pihole_sync
}

module "flows" {
  source = "./modules/flows"

  kv_dev_openrouter_api = module.kv.kv_dev_openrouter_api
}
