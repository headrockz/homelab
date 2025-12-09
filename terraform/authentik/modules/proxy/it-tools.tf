resource "authentik_provider_proxy" "it-tools" {
  name               = "It Tools"
  external_host      = "https://it-tools.${var.domain}"
  mode               = "forward_single"
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
}

resource "authentik_application" "it-tools" {
  name              = "It Tools"
  slug              = "it-tools"
  group             = ""
  protocol_provider = authentik_provider_proxy.it-tools.id
  meta_launch_url   = "https://it-tools.${var.domain}/"
  meta_icon         = "/media/public/application-icons/it-tools.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "it-tools" {
  target = authentik_application.it-tools.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
