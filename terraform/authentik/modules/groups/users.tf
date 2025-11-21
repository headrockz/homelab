data "authentik_user" "akadmin" {
  username = var.akadmin
}

data "authentik_user" "personal_user" {
  username = var.username
}
