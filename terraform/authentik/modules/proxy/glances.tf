resource "authentik_provider_proxy" "glances" {
  name               = "Glances"
  external_host      = "https://glances.tie.${var.domain}"
  mode               = "forward_single"
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
}

resource "authentik_application" "glances" {
  name              = "Glances"
  slug              = "glances"
  group             = "Monitoring"
  protocol_provider = authentik_provider_proxy.glances.id
  meta_launch_url   = "https://glances.tie.${var.domain}/"
  meta_icon         = "https://authentik.${var.domain}//media/public/application-icons/glances.svg"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "glances" {
  target = authentik_application.glances.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}

resource "authentik_policy_binding" "glances_prometheus_user" {
  target = authentik_application.glances.uuid
  user   = var.authentik_prometheus_user_id
  order  = 0
}
