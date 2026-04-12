output "oauth_profile_id" {
  value = data.authentik_property_mapping_provider_scope.oauth_profile.id
}

output "oauth_openid_id" {
  value = data.authentik_property_mapping_provider_scope.oauth_openid.id
}

output "oauth_email_id" {
  value = data.authentik_property_mapping_provider_scope.oauth_email.id
}

output "oauth_offline_access_id" {
  value = data.authentik_property_mapping_provider_scope.oauth_offline_access.id
}

output "proxy_outpost_id" {
  value = data.authentik_property_mapping_provider_scope.proxy_outpost.id
}

output "airflow_property_mapping_id" {
  value = data.authentik_property_mapping_provider_scope.airflow.id
}

output "default_ssh_property_mapping_id" {
  value = data.authentik_property_mapping_provider_rac.ssh.id
}

output "minio_property_mapping_id" {
  value = authentik_property_mapping_provider_scope.minio.id
}

output "openwebui_property_mapping_id" {
  value = authentik_property_mapping_provider_scope.openwebui.id
}

output "grafana_property_mapping_id" {
  value = authentik_property_mapping_provider_scope.grafana.id
}

output "romm_property_mapping_id" {
  value = authentik_property_mapping_provider_scope.romm.id
}

output "nextexplorer_property_mapping_id" {
  value = authentik_property_mapping_provider_scope.nextexplorer.id
}
