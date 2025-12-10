output "authentik_admin_group" {
  description = "Authentik Admin Group ID"
  value       = data.authentik_group.admins.id
}


output "authentik_prometheus_user" {
  description = "Authentik Prometheus Service Account User ID"
  value       = resource.authentik_user.prometheus.id

}
