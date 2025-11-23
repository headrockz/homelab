resource "authentik_token" "ollama" {
  identifier  = "ollama"
  user        = data.authentik_user.personal_user.id
  description = "Ollama API Token"
  expiring    = false
  intent      = "app_password"
}

resource "authentik_token" "homepage" {
  identifier  = "homepage"
  user        = data.authentik_user.personal_user.id
  description = "Homepage Integration"
  expiring    = false
  intent      = "api"
}

resource "authentik_token" "prometheus" {
  identifier  = "prometheus"
  user        = resource.authentik_user.prometheus.id
  description = "Prometheus Connection Token"
  expiring    = false
  intent      = "app_password"
}
