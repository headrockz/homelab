resource "authentik_group" "nextexplorer-admins" {
  name  = "nextexplorer-admins"
  users = [data.authentik_user.akadmin.id]
}
