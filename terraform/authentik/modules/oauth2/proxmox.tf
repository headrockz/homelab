resource "random_password" "proxmox" {
  length  = 40
  special = false
}

resource "authentik_provider_oauth2" "proxmox" {
  name               = "Proxmox"
  client_id          = resource.random_password.proxmox.result
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
  signing_key        = var.default_self_singned
  property_mappings = [
    var.oauth_profile_id,
    var.oauth_openid_id,
    var.oauth_email_id
  ]
  allowed_redirect_uris = [
    {
      matching_mode = "regex",
      url           = "https://homeone.${var.domain}:8006",
    }
  ]
}

resource "authentik_application" "proxmox" {
  name              = "Proxmox"
  slug              = "proxmox"
  group             = ""
  protocol_provider = authentik_provider_oauth2.proxmox.id
  meta_launch_url   = "https://homeone.${var.domain}:8006/"
  meta_icon         = "/media/public/application-icons/proxmox.png"
  open_in_new_tab   = true
}
