resource "authentik_provider_proxy" "traefik-destroyer" {
  name               = "Traefik - Destroyer"
  external_host      = "https://traefik.destroyer.${var.domain}"
  mode               = "forward_single"
  authorization_flow = data.authentik_flow.default-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-invalidation-flow.id
}

resource "authentik_application" "traefik-destroyer" {
  name              = "Traefik - Destroyer"
  slug              = "traefik-destroyer"
  group             = "Traefik"
  protocol_provider = authentik_provider_proxy.traefik-destroyer.id
  meta_launch_url   = "https://traefik.destroyer.${var.domain}/"
  meta_icon         = "/media/public/application-icons/traefik.png"
  open_in_new_tab   = true
}
