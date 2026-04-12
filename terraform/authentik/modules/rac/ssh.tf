
resource "authentik_provider_rac" "ssh" {
  name               = "SSH Connection"
  authorization_flow = var.default_authorization_flow
  connection_expiry  = "minutes=30"
  property_mappings = [
    # var.ssh_connection_rac_id
  ]

}

resource "authentik_application" "ssh" {
  name              = "Remote Access Controller - SSH"
  slug              = "ssh"
  group             = "Remote Access"
  protocol_provider = authentik_provider_rac.ssh.id
  meta_icon         = "application-icons/guacamole.png"
  open_in_new_tab   = true
}
