resource "proxmox_virtual_environment_user" "homarr_user" {
  user_id = "homarr-user@pam"
  groups  = [proxmox_virtual_environment_group.api_users.group_id]
  comment = "Homarr User"
}
