resource "proxmox_virtual_environment_acme_account" "cloudflare-dns" {
  name      = "cloudflare-dns"
  contact   = ""
  directory = "https://acme-v02.api.letsencrypt.org/directory"
  tos       = "https://letsencrypt.org/documents/LE-SA-v1.5-February-24-2025.pdf"
}

resource "proxmox_virtual_environment_acme_dns_plugin" "cloudflare-dns" {
  plugin           = "cloudflare-dns"
  api              = "cf"
  validation_delay = 0
  data = {
    CF_Email = var.cloudflare_email
    CF_Token = var.cloudflare_api_token
  }
}
