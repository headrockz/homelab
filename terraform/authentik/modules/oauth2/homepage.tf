resource "random_password" "homepage" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "homepage" {
  name               = "Homepage"
  client_id          = resource.random_password.homepage.result
  issuer_mode        = "global"
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
      url           = "https://homepage.${var.domain}/api/auth/callback/homepage-oidc",
    },
    {
      matching_mode = "regex",
      url           = "https://homepage.${var.domain}/auth/signin",
    }
  ]
}

resource "authentik_application" "homepage" {
  name              = "Homepage"
  slug              = "homepage"
  group             = ""
  protocol_provider = authentik_provider_oauth2.homepage.id
  meta_launch_url   = "https://homepage.${var.domain}/"
  meta_icon         = "application-icons/homepage.png"
  meta_description  = "Homepage is a self-hosted personal dashboard."
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "homepage" {
  target = authentik_application.homepage.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
