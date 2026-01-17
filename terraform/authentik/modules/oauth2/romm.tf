resource "random_password" "romm" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "romm" {
  name               = "RomM"
  client_id          = resource.random_password.romm.result
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
      url           = "https://romm.${var.domain}/api/oauth/openid",
    }
  ]
}

resource "authentik_application" "romm" {
  name              = "RomM"
  slug              = "romm"
  group             = ""
  protocol_provider = authentik_provider_oauth2.romm.id
  meta_launch_url   = "https://romm.${var.domain}/"
  meta_icon         = "https://authentik.${var.domain}/media/public/application-icons/romm.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "romm" {
  target = authentik_application.romm.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
