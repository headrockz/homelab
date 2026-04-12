resource "authentik_property_mapping_provider_scope" "grafana" {
  name        = "Grafana Role Mapping"
  scope_name  = "grafana"
  description = "Maps Authentik groups to Grafana roles"
  expression  = local.grafana_property
}
