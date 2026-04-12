resource "authentik_provider_proxy" "prometheus" {
  name               = "Prometheus"
  external_host      = "https://prometheus.${var.domain}"
  mode               = "forward_single"
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
}

resource "authentik_application" "prometheus" {
  name              = "Prometheus"
  slug              = "prometheus"
  group             = "Monitoring"
  protocol_provider = authentik_provider_proxy.prometheus.id
  meta_launch_url   = "https://prometheus.${var.domain}/"
  meta_icon         = "application-icons/prometheus.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "prometheus" {
  target = authentik_application.prometheus.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}

resource "authentik_policy_binding" "prometheus_prometheus_user" {
  target = authentik_application.prometheus.uuid
  user   = var.authentik_prometheus_user_id
  order  = 0
}
