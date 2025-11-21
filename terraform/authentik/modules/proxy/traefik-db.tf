resource "authentik_provider_proxy" "traefik-db" {
  name               = "Traefik - DB"
  external_host      = "https://traefik.db.${var.domain}"
  mode               = "forward_single"
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
}

resource "authentik_application" "traefik-db" {
  name              = "Traefik - DB"
  slug              = "traefik-db"
  group             = "Traefik"
  protocol_provider = authentik_provider_proxy.traefik-db.id
  meta_launch_url   = "https://traefik.db.${var.domain}/"
  meta_icon         = "/media/public/application-icons/traefik.png"
  open_in_new_tab   = true
}
