resource "authentik_flow" "authentication-passwordless-flow" {
  name        = "Authentication Passwordless Flow"
  title       = "Authentication Passwordless Flow"
  slug        = "authentication-passwordless-flow"
  designation = "authentication"
}

resource "authentik_stage_authenticator_validate" "authentication-passwordless-stage" {
  name                       = "authentication-passwordless-stage"
  device_classes             = ["webauthn"]
  webauthn_user_verification = "required"
  not_configured_action      = "configure"
  configuration_stages = [
    data.authentik_stage.default-authenticator-webauthn-setup.id
  ]
}

resource "authentik_flow_stage_binding" "authentication-passwordless-stage" {
  target = authentik_flow.authentication-passwordless-flow.uuid
  stage  = authentik_stage_authenticator_validate.authentication-passwordless-stage.id
  order  = 10
}

resource "authentik_flow_stage_binding" "authentication-passwordless-login" {
  target = authentik_flow.authentication-passwordless-flow.uuid
  stage  = data.authentik_stage.default-authentication-login.id
  order  = 20
}
