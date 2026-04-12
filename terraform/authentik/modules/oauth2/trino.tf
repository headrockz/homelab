resource "random_password" "trino" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "trino" {
  name               = "Trino"
  client_id          = resource.random_password.trino.result
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
  signing_key        = var.default_self_singned
  logout_uri         = "https://trino.db.${var.domain}/ui/logout/logout.html"
  sub_mode           = "user_username"
  property_mappings = [
    var.oauth_profile_id,
    var.oauth_openid_id,
    var.oauth_email_id
  ]
  allowed_redirect_uris = [
    {
      matching_mode = "regex",
      url           = "https://trino.db.${var.domain}/oauth2/callback",
    },
    {
      matching_mode = "regex",
      url           = "https://192.168.0.14:8443/oauth2/callback",
    }
  ]
}

resource "authentik_application" "trino" {
  name              = "Trino"
  slug              = "trino"
  group             = "Data Engineering"
  protocol_provider = authentik_provider_oauth2.trino.id
  meta_launch_url   = "https://trino.db.${var.domain}/"
  meta_icon         = "application-icons/trino.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "trino" {
  target = authentik_application.trino.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
