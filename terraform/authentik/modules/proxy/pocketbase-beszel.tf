resource "authentik_provider_proxy" "pocketbase-beszel" {
  name               = "PocketBase-Beszel"
  external_host      = "https://beszel.tie.${var.domain}"
  mode               = "forward_single"
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
}

resource "authentik_application" "pocketbase-beszel" {
  name              = "PocketBase-Beszel"
  slug              = "pocketbase-beszel"
  group             = "Monitoring"
  protocol_provider = authentik_provider_proxy.pocketbase-beszel.id
  meta_launch_url   = "https://beszel.tie.${var.domain}/_/"
  meta_icon         = "application-icons/pocketbase.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "pocketbase-beszel" {
  target = authentik_application.pocketbase-beszel.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
