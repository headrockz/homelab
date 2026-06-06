resource "authentik_provider_proxy" "traefik-falcon" {
  name               = "Traefik - Falcon"
  external_host      = "https://traefik.falcon.${var.domain}"
  mode               = "forward_single"
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
}

resource "authentik_application" "traefik-falcon" {
  name              = "Traefik - Falcon"
  slug              = "traefik-falcon"
  group             = "Traefik"
  protocol_provider = authentik_provider_proxy.traefik-falcon.id
  meta_launch_url   = "https://traefik.falcon.${var.domain}/"
  meta_icon         = "application-icons/traefik.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "traefik-falcon" {
  target = authentik_application.traefik-falcon.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}

resource "authentik_policy_binding" "traefik-falcon_prometheus_user" {
  target = authentik_application.traefik-falcon.uuid
  user   = var.authentik_prometheus_user_id
  order  = 0
}
