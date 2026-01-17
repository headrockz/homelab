resource "random_password" "stirling-pdf" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "stirling-pdf" {
  name               = "Stirling PDF"
  client_id          = resource.random_password.stirling-pdf.result
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
      url           = "https://stirling-pdf.${var.domain}/login/oauth2/code/authentik",
    },
    {
      matching_mode = "regex",
      url           = "http://stirling-pdf:8080/login/oauth2/code/authentik",
    }
  ]
}

resource "authentik_application" "stirling-pdf" {
  name              = "Stirling PDF"
  slug              = "stirling-pdf"
  group             = ""
  protocol_provider = authentik_provider_oauth2.stirling-pdf.id
  meta_launch_url   = "https://stirling-pdf.${var.domain}/"
  meta_icon         = "https://authentik.${var.domain}/media/public/application-icons/stirling-pdf.png"
  open_in_new_tab   = true
}
