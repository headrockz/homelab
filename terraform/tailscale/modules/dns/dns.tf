resource "tailscale_dns_preferences" "magic_dns" {
  magic_dns = true
}

resource "tailscale_dns_nameservers" "custom_nameservers" {
  nameservers = local.ips
}
