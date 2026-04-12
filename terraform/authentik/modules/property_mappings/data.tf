data "authentik_property_mapping_provider_scope" "oauth_profile" {
  scope_name = "profile"
}

data "authentik_property_mapping_provider_scope" "oauth_email" {
  scope_name = "email"
}

data "authentik_property_mapping_provider_scope" "oauth_openid" {
  scope_name = "openid"
}

data "authentik_property_mapping_provider_scope" "oauth_offline_access" {
  scope_name = "offline_access"
}

data "authentik_property_mapping_provider_scope" "proxy_outpost" {
  scope_name = "ak_proxy"
}

data "authentik_property_mapping_provider_scope" "airflow" {
  scope_name = "airflow"
}

data "authentik_property_mapping_provider_rac" "ssh" {
  name = "authentik default RAC Mapping: SSH Default settings"
}
