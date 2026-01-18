resource "authentik_stage_identification" "authentik_stage_identification" {
  name                      = "default-authentication-identification"
  user_fields               = ["username", "email"]
  case_insensitive_matching = true
  password_stage            = data.authentik_stage.default-authentication-password.id
  passwordless_flow         = authentik_flow.authentication-passwordless-flow.uuid
}
