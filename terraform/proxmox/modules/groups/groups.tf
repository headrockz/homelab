resource "proxmox_virtual_environment_group" "api_users" {
  comment  = "API Users Group"
  group_id = "api-users"
  acl {
    path      = local.acl_path
    propagate = true
    role_id   = data.proxmox_virtual_environment_role.operations_role.role_id
  }
}
