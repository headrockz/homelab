output "oauth_profile_id" {
  description = "OAuth profile property mapping ID"
  value       = data.authentik_property_mapping_provider_scope.oauth_profile.id
}

output "airflow_property_mapping_id" {
  description = "Airflow property mapping ID"
  value       = data.authentik_property_mapping_provider_scope.airflow.id
}

output "minio_property_mapping_id" {
  description = "MinIO property mapping ID"
  value       = authentik_property_mapping_provider_scope.minio.id
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
