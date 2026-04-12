resource "authentik_property_mapping_provider_scope" "nextexplorer" {
  name        = "nextExplorer Scope Mapping"
  scope_name  = "nextexplorer"
  description = "Maps nextExplorer admin group based on Authentik membership"
  expression  = local.nextexplorer_property
}
