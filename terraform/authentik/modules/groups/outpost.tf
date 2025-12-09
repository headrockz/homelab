output "authentik_admin_group" {
  description = "Authentik Admin Group ID"
  value       = data.authentik_group.admins.id
}
