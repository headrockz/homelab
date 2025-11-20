resource "authentik_provider_proxy" "glances" {
  name               = "Glances"
  external_host      = "https://glances.tie.${var.domain}"
  mode               = "forward_single"
  authorization_flow = data.authentik_flow.default-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-invalidation-flow.id
}

resource "authentik_application" "glances" {
  name              = "Glances"
  slug              = "glances"
  group             = "Monitoring"
  protocol_provider = authentik_provider_proxy.glances.id
  meta_launch_url   = "https://glances.tie.${var.domain}/"
  meta_icon         = "/media/public/application-icons/glances.svg"
  open_in_new_tab   = true
}
