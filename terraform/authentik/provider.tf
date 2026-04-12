terraform {
  required_providers {
    authentik = {
      source  = "goauthentik/authentik"
      version = "2025.12.0"
    }
  }
}

provider "authentik" {

  # Optionally set insecure to ignore TLS Certificates
  # insecure = true
  # Optionally add extra headers
  # headers {
  #   X-my-header = "foo"
  # }
}
