resource "random_password" "rustfs" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "rustfs" {
  name               = "RustFS"
  client_id          = resource.random_password.rustfs.result
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
  signing_key        = var.default_self_singned
  property_mappings = [
    var.oauth_profile_id,
    var.oauth_openid_id,
    var.oauth_email_id,
    var.rustfs_property_mapping_id
  ]
  allowed_redirect_uris = [
    {
      matching_mode = "regex",
      url           = "https://rustfs-ui.destroyer.${var.domain}/rustfs/admin/v3/oidc/callback/default",
    }
  ]
}

resource "authentik_application" "rustfs" {
  name              = "RustFS"
  slug              = "rustfs"
  group             = "Data Engineering"
  protocol_provider = authentik_provider_oauth2.rustfs.id
  meta_launch_url   = "https://rustfs-ui.destroyer.${var.domain}/"
  meta_icon         = "application-icons/rustfs.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "rustfs" {
  target = authentik_application.rustfs.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
