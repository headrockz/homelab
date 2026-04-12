resource "authentik_provider_proxy" "ollama" {
  name               = "Ollama"
  external_host      = "https://ollama.dev.${var.domain}"
  mode               = "forward_single"
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
}

resource "authentik_application" "ollama" {
  name              = "Ollama"
  slug              = "ollama"
  group             = "AI"
  protocol_provider = authentik_provider_proxy.ollama.id
  meta_launch_url   = "https://ollama.dev.${var.domain}/"
  meta_icon         = "application-icons/ollama-dark.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "ollama" {
  target = authentik_application.ollama.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
