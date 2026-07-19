resource "authentik_provider_proxy" "alloy" {
  name               = "Alloy"
  external_host      = "https://alloy.tie.${var.domain}"
  mode               = "forward_single"
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
}

resource "authentik_application" "alloy" {
  name              = "Alloy"
  slug              = "alloy"
  group             = "Monitoring"
  protocol_provider = authentik_provider_proxy.alloy.id
  meta_launch_url   = "https://alloy.tie.${var.domain}/"
  meta_icon         = "application-icons/alloy.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "alloy" {
  target = authentik_application.alloy.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}

resource "authentik_policy_binding" "alloy_prometheus_user" {
  target = authentik_application.alloy.uuid
  user   = var.authentik_prometheus_user_id
  order  = 0
}
