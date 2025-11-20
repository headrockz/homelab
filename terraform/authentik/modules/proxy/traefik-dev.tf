resource "authentik_provider_proxy" "traefik-dev" {
  name               = "Traefik - Dev"
  external_host      = "https://traefik.dev.${var.domain}"
  mode               = "forward_single"
  authorization_flow = data.authentik_flow.default-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-invalidation-flow.id
}

resource "authentik_application" "traefik-dev" {
  name              = "Traefik - Dev"
  slug              = "traefik-dev"
  group             = "Traefik"
  protocol_provider = authentik_provider_proxy.traefik-dev.id
  meta_launch_url   = "https://traefik.dev.${var.domain}/"
  meta_icon         = "/media/public/application-icons/traefik.png"
  open_in_new_tab   = true
}
