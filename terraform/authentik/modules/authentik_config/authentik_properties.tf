data "authentik_property_mapping_provider_scope" "oauth_profile" {
  scope_name = "profile"
}

data "authentik_property_mapping_provider_scope" "oauth_email" {
  scope_name = "email"
}

data "authentik_property_mapping_provider_scope" "oauth_openid" {
  scope_name = "openid"
}

data "authentik_property_mapping_provider_scope" "airflow" {
  scope_name = "airflow"
}

resource "authentik_property_mapping_provider_scope" "minio" {
  name        = "MinIO Scope Mapping"
  scope_name  = "minio"
  description = "Maps MinIO specific properties"
  expression  = <<EOF
if ak_is_group_member(request.user, name="MinIO Admin"):
  return {
    "policy": "consoleAdmin",
}
else:
    return {
      "policy": "readonly"
  }
EOF
}
