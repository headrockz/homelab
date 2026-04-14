resource "authentik_property_mapping_provider_scope" "rustfs" {
  name        = "RustFS Scope Mapping"
  scope_name  = "rustfs"
  description = "Maps RustFS specific properties"
  expression  = local.rustfs_property
}
