resource "authentik_provider_oauth2" "kestra" {
  name               = "Kestra"
  client_id          = resource.random_password.kestra.result
  authorization_flow = data.authentik_flow.default-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-invalidation-flow.id
  signing_key        = data.authentik_certificate_key_pair.self-singned.id
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
  meta_icon         = "/media/public/application-icons/kestra.png"
  open_in_new_tab   = true

}
