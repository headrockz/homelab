resource "authentik_provider_proxy" "ollama" {
  name               = "Ollama"
  external_host      = "https://ollama.dev.${var.domain}"
  mode               = "forward_single"
  authorization_flow = data.authentik_flow.default-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-invalidation-flow.id
}

resource "authentik_application" "ollama" {
  name              = "Ollama"
  slug              = "ollama"
  group             = "AI"
  protocol_provider = authentik_provider_proxy.ollama.id
  meta_launch_url   = "https://ollama.dev.${var.domain}/"
  meta_icon         = "/media/public/application-icons/ollama-dark.png"
  open_in_new_tab   = true
}
