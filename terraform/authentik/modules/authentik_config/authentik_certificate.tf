data "authentik_certificate_key_pair" "self_singned" {
  name = "authentik Self-signed Certificate"
}

data "authentik_certificate_key_pair" "homelab-ca" {
  name = "homelab-ca"
}

data "authentik_certificate_key_pair" "homelab-client" {
  name = "homelab-client"
}
