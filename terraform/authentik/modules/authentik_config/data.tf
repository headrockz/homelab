data "authentik_flow" "default-authentication-flow" {
  slug = "default-authentication-flow"
}

data "authentik_flow" "default-invalidation-flow" {
  slug = "default-provider-invalidation-flow"
}

data "authentik_flow" "default-authorization-flow" {
  slug = "default-provider-authorization-implicit-consent"
}

data "authentik_stage" "default-authentication-password" {
  name = "default-authentication-password"
}

data "authentik_stage" "default-authentication-login" {
  name = "default-authentication-login"
}

data "authentik_stage" "default-authenticator-webauthn-setup" {
  name = "default-authenticator-webauthn-setup"
}
