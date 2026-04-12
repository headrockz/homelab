output "default_authorization_flow" {
  description = "Default Authorization Flow ID"
  value       = data.authentik_flow.default-authorization-flow.id
}

output "default_invalidation_flow" {
  description = "Default Invalidation Flow ID"
  value       = data.authentik_flow.default-invalidation-flow.id
}

output "default_self_singned" {
  description = "Default Self Singned Certificate ID"
  value       = data.authentik_certificate_key_pair.self_singned.id
}
