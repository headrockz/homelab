resource "authentik_provider_oauth2" "nextexplorer" {
  name               = "NextExplorer"
  client_id          = resource.random_password.nextexplorer.result
  authorization_flow = data.authentik_flow.default-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-invalidation-flow.id
  signing_key        = data.authentik_certificate_key_pair.self-singned.id
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
  meta_icon         = "/media/public/application-icons/files.png"
  open_in_new_tab   = true

}
