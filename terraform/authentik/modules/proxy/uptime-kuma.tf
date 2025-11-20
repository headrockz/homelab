resource "authentik_provider_proxy" "uptime-kuma" {
  name               = "Uptime Kuma"
  external_host      = "https://uptime.${var.domain}"
  mode               = "forward_single"
  authorization_flow = data.authentik_flow.default-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-invalidation-flow.id
  skip_path_regex    = <<-EOT
            ^/status/.*
            ^/assets/.*
            ^/api/push/.*
            ^/api/badge/.*
            ^/api/status-page/.*
            ^/icon.svg
            ^/upload/.*
        EOT
}

resource "authentik_application" "uptime-kuma" {
  name              = "Uptime Kuma"
  slug              = "uptime-kuma"
  group             = "Monitoring"
  protocol_provider = authentik_provider_proxy.uptime-kuma.id
  meta_launch_url   = "https://uptime.${var.domain}/"
  meta_icon         = "/media/public/application-icons/uptime-kuma.png"
  open_in_new_tab   = true
}
