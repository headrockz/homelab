resource "authentik_provider_proxy" "traefik-tie" {
  name               = "Traefik - Tie"
  external_host      = "https://traefik.tie.${var.domain}"
  mode               = "forward_single"
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
}

resource "authentik_application" "traefik-tie" {
  name              = "Traefik - Tie"
  slug              = "traefik-tie"
  group             = "Traefik"
  protocol_provider = authentik_provider_proxy.traefik-tie.id
  meta_launch_url   = "https://traefik.tie.${var.domain}/"
  meta_icon         = "/media/public/application-icons/traefik.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "traefik-tie" {
  target = authentik_application.traefik-tie.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
