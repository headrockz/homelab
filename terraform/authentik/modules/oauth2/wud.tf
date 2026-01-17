resource "random_password" "wud" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "wud" {
  name               = "What's Up Docker"
  client_id          = resource.random_password.wud.result
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
      url           = "https://wud.falcon.${var.domain}/auth/oidc/authentik/cb",
    },
    {
      matching_mode = "regex",
      url           = "https://wud.tie.${var.domain}/auth/oidc/authentik/cb",
    },
    {
      matching_mode = "regex",
      url           = "http://wud:3000/auth/oidc/authentik/cb",
    }
  ]
}

resource "authentik_application" "wud" {
  name              = "What's Up Docker"
  slug              = "wud"
  group             = "Monitoring"
  protocol_provider = authentik_provider_oauth2.wud.id
  meta_launch_url   = "https://wud.falcon.${var.domain}/"
  meta_icon         = "https://authentik.${var.domain}/media/public/application-icons/whats-up-docker.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "wud" {
  target = authentik_application.wud.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}

resource "authentik_policy_binding" "wud_prometheus_user" {
  target = authentik_application.wud.uuid
  user   = var.authentik_prometheus_user_id
  order  = 0
}
