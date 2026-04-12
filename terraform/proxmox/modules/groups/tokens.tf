resource "proxmox_virtual_environment_user_token" "homepage_token" {
  comment = "Homepage Access Token"
  #   expiration_date = "2033-01-01T22:00:00Z"
  privileges_separation = false
  token_name            = "homepage"
  user_id               = resource.proxmox_virtual_environment_user.homarr_user.user_id
}
