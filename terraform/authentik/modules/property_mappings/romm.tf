resource "authentik_property_mapping_provider_scope" "romm" {
  name        = "Romm Scope Mapping"
  scope_name  = "romm"
  description = "Maps Romm specific properties"
  expression  = local.romm_property
}
