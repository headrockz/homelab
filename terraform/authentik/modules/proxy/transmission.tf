resource "authentik_provider_proxy" "transmission" {
  name               = "Transmission"
  external_host      = "https://transmission.${var.domain}"
  mode               = "forward_single"
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
}

resource "authentik_application" "transmission" {
  name              = "Transmission"
  slug              = "transmission"
  group             = "Media"
  protocol_provider = authentik_provider_proxy.transmission.id
  meta_launch_url   = "https://transmission.${var.domain}/"
  meta_icon         = "application-icons/transmission.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "transmission" {
  target = authentik_application.transmission.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
