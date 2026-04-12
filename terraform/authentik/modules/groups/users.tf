data "authentik_user" "akadmin" {
  username = var.akadmin
}

data "authentik_user" "personal_user" {
  username = var.username
}

resource "authentik_user" "prometheus" {
  username = "prometheus"
  name     = "prometheus"
  path     = "goauthentik.io/service-accounts"
  type     = "service_account"
}
