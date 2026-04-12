resource "authentik_property_mapping_provider_scope" "openwebui" {
  name        = "Open WebUI Scope Mapping"
  scope_name  = "openwebui"
  description = "Maps Open WebUI specific properties"
  expression  = local.openwebui_property
}
