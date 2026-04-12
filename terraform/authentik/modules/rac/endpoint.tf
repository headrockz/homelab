resource "authentik_rac_endpoint" "omv" {
  name                = "OMV"
  protocol            = "ssh"
  host                = local.omv_ip
  protocol_provider   = authentik_provider_rac.ssh.id
  maximum_connections = 3
  property_mappings = [
    var.default_ssh_property_mapping_id
  ]
  settings = jsonencode({
    private-key = <<-EOT
        ${local.ssh_key}
    EOT
    username    = "${local.omv_user}"
  })
}

resource "authentik_rac_endpoint" "proxmox" {
  name                = "Proxmox"
  protocol            = "ssh"
  host                = local.proxmox_ip
  protocol_provider   = authentik_provider_rac.ssh.id
  maximum_connections = 3
  property_mappings = [
    var.default_ssh_property_mapping_id
  ]
  settings = jsonencode({
    private-key = <<-EOT
        ${local.ssh_key}
    EOT
    username    = "${local.proxmox_user}"
  })
}

resource "authentik_rac_endpoint" "db" {
  name                = "DB"
  protocol            = "ssh"
  host                = local.db_ip
  protocol_provider   = authentik_provider_rac.ssh.id
  maximum_connections = 3
  property_mappings = [
    var.default_ssh_property_mapping_id
  ]
  settings = jsonencode({
    private-key = <<-EOT
        ${local.ssh_key}
    EOT
    username    = "${local.db_user}"
  })
}

resource "authentik_rac_endpoint" "destroyer" {
  name                = "Destroyer"
  protocol            = "ssh"
  host                = local.destroyer_ip
  protocol_provider   = authentik_provider_rac.ssh.id
  maximum_connections = 3
  property_mappings = [
    var.default_ssh_property_mapping_id
  ]
  settings = jsonencode({
    private-key = <<-EOT
        ${local.ssh_key}
    EOT
    username    = "${local.destroyer_user}"
  })
}

resource "authentik_rac_endpoint" "dev" {
  name                = "Dev"
  protocol            = "ssh"
  host                = local.dev_ip
  protocol_provider   = authentik_provider_rac.ssh.id
  maximum_connections = 3
  property_mappings = [
    var.default_ssh_property_mapping_id
  ]
  settings = jsonencode({
    private-key = <<-EOT
        ${local.ssh_key}
    EOT
    username    = "${local.dev_user}"
  })
}
