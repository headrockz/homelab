resource "authentik_provider_proxy" "tempo" {
  name               = "Tempo"
  external_host      = "https://tempo.${var.domain}"
  mode               = "forward_single"
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
}

resource "authentik_application" "tempo" {
  name              = "Tempo"
  slug              = "tempo"
  group             = "Monitoring"
  protocol_provider = authentik_provider_proxy.tempo.id
  meta_launch_url   = "https://tempo.${var.domain}/"
  meta_icon         = "application-icons/tempo.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "tempo" {
  target = authentik_application.tempo.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}

resource "authentik_policy_binding" "tempo_prometheus_user" {
  target = authentik_application.tempo.uuid
  user   = var.authentik_prometheus_user_id
  order  = 0
}
