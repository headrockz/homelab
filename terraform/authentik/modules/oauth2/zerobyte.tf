resource "random_password" "zerobyte" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "zerobyte" {
  name               = "Zerobyte"
  client_id          = resource.random_password.zerobyte.result
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
  signing_key        = var.default_self_singned
  sub_mode           = "hashed_user_id"
  property_mappings = [
    var.oauth_profile_id,
    var.oauth_openid_id,
    var.oauth_email_id
  ]
  allowed_redirect_uris = [
    {
      matching_mode = "regex",
      url           = "https://zerobyte.falcon.${var.domain}/",
    },
    {
      matching_mode = "strict",
      url           = "https://zerobyte.falcon.${var.domain}/api/auth/sso/callback/authentik",
    }
  ]
}

resource "authentik_application" "zerobyte" {
  name              = "Zerobyte"
  slug              = "zerobyte"
  group             = ""
  protocol_provider = authentik_provider_oauth2.zerobyte.id
  meta_launch_url   = "https://zerobyte.falcon.${var.domain}"
  meta_icon         = "application-icons/zerobyte.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "zerobyte" {
  target = authentik_application.zerobyte.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
