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
  meta_icon         = "/media/public/application-icons/prometheus.png"
  open_in_new_tab   = true
}
