resource "random_password" "termix" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "termix" {
  name               = "Termix"
  client_id          = resource.random_password.termix.result
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
  signing_key        = var.default_self_singned
  grant_types        = ["authorization_code"]
  property_mappings = [
    var.oauth_profile_id,
    var.oauth_openid_id,
    var.oauth_email_id,
    var.airflow_property_mapping_id
  ]
  allowed_redirect_uris = [
    {
      matching_mode     = "regex",
      redirect_uri_type = "authorization",
      url               = "https://termix.falcon.${var.domain}/users/oidc/callback",
    }
  ]
}

resource "authentik_application" "termix" {
  name              = "Termix"
  slug              = "termix"
  group             = "Remote Access"
  protocol_provider = authentik_provider_oauth2.termix.id
  meta_launch_url   = "https://termix.falcon.${var.domain}/"
  meta_icon         = "application-icons/termix.png"
  meta_description  = "Termix is a platform to manage and read your terminal sessions."
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "termix" {
  target = authentik_application.termix.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
