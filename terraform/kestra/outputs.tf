output "created_kv_resources" {
  description = "List of key-value resources created in Kestra"
  value = {
    minio_endpoint = {
      namespace = "dev"
      key       = "MINIO_ENDPOINT"
    }
    local_nas = {
      namespace = "prd"
      key       = "LOCAL_NAS"
    }
    pihole_sync = {
      namespace = "prd"
      key       = "PIHOLE_SYNC"
    }
    openrouter_api = {
      namespace = "prd"
      key       = "OPENROUTER_API"
    }
  }
}
