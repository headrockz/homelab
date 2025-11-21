resource "random_password" "minio" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "minio" {
  name               = "MinIO"
  client_id          = resource.random_password.minio.result
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
  signing_key        = var.default_self_singned
  property_mappings = [
    var.oauth_profile_id,
    var.oauth_openid_id,
    var.oauth_email_id,
    var.minio_property_mapping_id
  ]
  allowed_redirect_uris = [
    {
      matching_mode = "regex",
      url           = "https://minioui.destroyer.${var.domain}/oauth_callback",
    }
  ]
}

resource "authentik_application" "minio" {
  name              = "MinIO"
  slug              = "minio"
  group             = "Data Engineering"
  protocol_provider = authentik_provider_oauth2.minio.id
  meta_launch_url   = "https://minioui.destroyer.${var.domain}/"
  meta_icon         = "/media/public/application-icons/minio.png"
  open_in_new_tab   = true
}
