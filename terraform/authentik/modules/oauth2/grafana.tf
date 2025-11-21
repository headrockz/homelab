resource "random_password" "grafana" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "grafana" {
  name               = "Grafana"
  client_id          = resource.random_password.grafana.result
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
      url           = "https://grafana.${var.domain}/login/generic_oauth",
    }
  ]
}

resource "authentik_application" "grafana" {
  name              = "Grafana"
  slug              = "grafana"
  group             = "Monitoring"
  protocol_provider = authentik_provider_oauth2.grafana.id
  meta_launch_url   = "https://grafana.${var.domain}/"
  meta_icon         = "/media/public/application-icons/grafana.png"
  open_in_new_tab   = true
}
