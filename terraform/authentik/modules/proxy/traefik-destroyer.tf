resource "authentik_provider_proxy" "traefik-destroyer" {
  name               = "Traefik - Destroyer"
  external_host      = "https://traefik.destroyer.${var.domain}"
  mode               = "forward_single"
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
}

resource "authentik_application" "traefik-destroyer" {
  name              = "Traefik - Destroyer"
  slug              = "traefik-destroyer"
  group             = "Traefik"
  protocol_provider = authentik_provider_proxy.traefik-destroyer.id
  meta_launch_url   = "https://traefik.destroyer.${var.domain}/"
  meta_icon         = "https://authentik.${var.domain}/media/public/application-icons/traefik.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "traefik-destroyer" {
  target = authentik_application.traefik-destroyer.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
