resource "random_password" "immich" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "immich" {
  name               = "Immich"
  client_id          = resource.random_password.immich.result
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
  signing_key        = var.default_self_singned
  property_mappings = [
    var.oauth_profile_id,
    var.oauth_openid_id,
    var.oauth_email_id
  ]
  allowed_redirect_uris = [
    {
      matching_mode = "regex",
      url           = "https://immich.falcon.${var.domain}/auth/login",
    },
    {
      matching_mode = "regex",
      url           = "https://immich.falcon.${var.domain}/user-settings",
    },
    {
      matching_mode = "regex",
      url           = "app.immich:///oauth-callback",
    }
  ]
}

resource "authentik_application" "immich" {
  name              = "Immich"
  slug              = "immich"
  group             = ""
  protocol_provider = authentik_provider_oauth2.immich.id
  meta_launch_url   = "https://immich.falcon.${var.domain}/"
  meta_icon         = "application-icons/immich.png"
  open_in_new_tab   = true
}
