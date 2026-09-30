resource "random_password" "bookorbit" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "bookorbit" {
  name               = "Bookorbit"
  client_id          = resource.random_password.bookorbit.result
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
  signing_key        = var.default_self_singned
  property_mappings = [
    var.oauth_profile_id,
    var.oauth_openid_id,
    var.oauth_email_id,
    var.airflow_property_mapping_id
  ]
  allowed_redirect_uris = [
    {
      matching_mode = "regex",
      url           = "https://bookorbit.${var.domain}/oauth2-callback",
    }
  ]
}

resource "authentik_application" "bookorbit" {
  name              = "Bookorbit"
  slug              = "bookorbit"
  group             = "Media"
  protocol_provider = authentik_provider_oauth2.bookorbit.id
  meta_launch_url   = "https://bookorbit.${var.domain}/"
  meta_icon         = "application-icons/bookorbit.png"
  meta_description  = "Bookorbit is a platform to manage and read your book collection."
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "bookorbit" {
  target = authentik_application.bookorbit.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
