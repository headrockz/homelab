resource "random_password" "beszel" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "beszel" {
  name               = "Beszel"
  client_id          = resource.random_password.beszel.result
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
      url           = "https://beszel.${var.domain}/api/oauth2-redirect",
    },
    {
      matching_mode = "regex",
      url           = "https://beszel.tie.${var.domain}/api/oauth2-redirect",
    }
  ]
}

resource "authentik_application" "beszel" {
  name              = "Beszel"
  slug              = "beszel"
  group             = "Monitoring"
  protocol_provider = authentik_provider_oauth2.beszel.id
  meta_launch_url   = "https://beszel.${var.domain}/"
  meta_icon         = "application-icons/beszel.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "beszel" {
  target = authentik_application.beszel.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
