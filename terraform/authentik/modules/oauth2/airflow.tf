resource "random_password" "airflow" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "airflow" {
  name               = "Airflow"
  client_id          = resource.random_password.airflow.result
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
      url           = "http://airflow.destroyer.${var.domain}/oauth-authorized/authentik",
    }
  ]
}

resource "authentik_application" "airflow" {
  name              = "Airflow"
  slug              = "airflow"
  group             = "Data Engineering"
  protocol_provider = authentik_provider_oauth2.airflow.id
  meta_launch_url   = "https://airflow.destroyer.${var.domain}/"
  meta_icon         = "application-icons/airflow.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "airflow" {
  target = authentik_application.airflow.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
