resource "authentik_provider_proxy" "loki" {
  name               = "Loki"
  external_host      = "https://loki.${var.domain}"
  mode               = "forward_single"
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
}

resource "authentik_application" "loki" {
  name              = "Loki"
  slug              = "loki"
  group             = "Monitoring"
  protocol_provider = authentik_provider_proxy.loki.id
  meta_launch_url   = "https://loki.${var.domain}/"
  meta_icon         = "application-icons/loki.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "loki" {
  target = authentik_application.loki.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
