resource "authentik_service_connection_docker" "local" {
  name  = "Local Docker connection"
  local = true
  url   = "/var/run/docker.sock"
}

resource "authentik_service_connection_docker" "tie" {
  name               = "Tie Docker connection"
  local              = false
  url                = local.tie_url
  tls_verification   = data.authentik_certificate_key_pair.homelab-ca.id
  tls_authentication = data.authentik_certificate_key_pair.homelab-client.id
}
