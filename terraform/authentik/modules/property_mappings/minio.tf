resource "authentik_property_mapping_provider_scope" "minio" {
  name        = "MinIO Scope Mapping"
  scope_name  = "minio"
  description = "Maps MinIO specific properties"
  expression  = local.minio_property
}
