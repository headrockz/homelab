resource "random_password" "nextexplorer" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "nextexplorer" {
  name               = "Next Explorer"
  client_id          = resource.random_password.nextexplorer.result
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
      url           = "https://file.${var.domain}/callback",
    }
  ]
}

resource "authentik_application" "nextexplorer" {
  name              = "Next Explorer"
  slug              = "nextexplorer"
  protocol_provider = authentik_provider_oauth2.nextexplorer.id
  meta_launch_url   = "https://file.${var.domain}/"
  meta_icon         = "https://authentik.${var.domain}/media/public/application-icons/files.png"
  open_in_new_tab   = true
}
