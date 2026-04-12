output "kv_dev_minio_endpoint" {
  description = "Kestra KV MinIO Endpoint in dev namespace"
  value       = kestra_kv.minio_endpoint.key
}

output "kv_dev_openrouter_api" {
  description = "Kestra KV OpenRouter API in dev namespace"
  value       = kestra_kv.openrouter_api_dev.key
}
output "kv_prd_local_nas" {
  description = "Kestra KV Local NAS in prd namespace"
  value       = kestra_kv.local_nas.key
}

output "kv_prd_pihole_sync" {
  description = "Kestra KV PiHole Sync in prd namespace"
  value       = kestra_kv.pihole_sync.key
}

output "kv_prd_openrouter_api" {
  description = "Kestra KV OpenRouter API in prd namespace"
  value       = kestra_kv.openrouter_api.key
}
