output "oauth_profile_id" {
  description = "OAuth profile property mapping ID"
  value       = data.authentik_property_mapping_provider_scope.oauth_profile.id
}

output "oauth_openid_id" {
  description = "OAuth openid property mapping ID"
  value       = data.authentik_property_mapping_provider_scope.oauth_openid.id
}

output "oauth_email_id" {
  description = "OAuth email property mapping ID"
  value       = data.authentik_property_mapping_provider_scope.oauth_email.id
}

output "oauth_offline_access_id" {
  description = "OAuth offline access property mapping ID"
  value       = data.authentik_property_mapping_provider_scope.oauth_offline_access.id
}

output "proxy_outpost_id" {
  description = "Proxy Outpost property mapping ID"
  value       = data.authentik_property_mapping_provider_scope.proxy_outpost.id
}

output "airflow_property_mapping_id" {
  description = "Airflow property mapping ID"
  value       = data.authentik_property_mapping_provider_scope.airflow.id
}

output "minio_property_mapping_id" {
  description = "MinIO property mapping ID"
  value       = authentik_property_mapping_provider_scope.minio.id
}

output "openwebui_property_mapping_id" {
  description = "Open WebUI property mapping ID"
  value       = authentik_property_mapping_provider_scope.openwebui.id
}

output "default_authorization_flow" {
  description = "Default Authorization Flow ID"
  value       = data.authentik_flow.default-authorization-flow.id
}

output "default_invalidation_flow" {
  description = "Default Invalidation Flow ID"
  value       = data.authentik_flow.default-invalidation-flow.id
}

output "default_self_singned" {
  description = "Default Self Singned Certificate ID"
  value       = data.authentik_certificate_key_pair.self_singned.id
}
