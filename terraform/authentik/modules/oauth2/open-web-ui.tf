resource "random_password" "open-web-ui" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "open-web-ui" {
  name               = "Open WebUI"
  client_id          = resource.random_password.open-web-ui.result
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
  signing_key        = var.default_self_singned
  property_mappings = [
    var.oauth_profile_id,
    var.oauth_openid_id,
    var.oauth_email_id,
    var.openwebui_property_mapping_id
  ]
  allowed_redirect_uris = [
    {
      matching_mode = "regex",
      url           = "https://openwebui.${var.domain}/auth/login",
    },
    {
      matching_mode = "regex",
      url           = "https://openwebui.${var.domain}/oauth/oidc/callback",
    }
  ]
}

resource "authentik_application" "open-web-ui" {
  name              = "Open WebUI"
  slug              = "open-web-ui"
  group             = "AI"
  protocol_provider = authentik_provider_oauth2.open-web-ui.id
  meta_launch_url   = "https://openwebui.${var.domain}/"
  meta_icon         = "https://authentik.${var.domain}/media/public/application-icons/open-webui.png"
  open_in_new_tab   = true
}
