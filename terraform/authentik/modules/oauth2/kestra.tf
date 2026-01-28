resource "random_password" "kestra" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "kestra" {
  name               = "Kestra"
  client_id          = resource.random_password.kestra.result
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
      url           = "https://kestra.destroyer.${var.domain}/oauth/callback/authentik",
    }
  ]
}

resource "authentik_application" "kestra" {
  name              = "Kestra - Deactivated"
  slug              = "kestra"
  group             = "Data Engineering"
  protocol_provider = authentik_provider_oauth2.kestra.id
  meta_launch_url   = "https://kestra.destroyer.${var.domain}/"
  meta_icon         = "application-icons/kestra.png"
  open_in_new_tab   = true
}


resource "authentik_policy_binding" "kestra" {
  target = authentik_application.kestra.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
