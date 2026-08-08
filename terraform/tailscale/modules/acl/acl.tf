
resource "tailscale_acl" "as_hujson" {
  acl = file("${path.module}/acl.secrets.hujson")
}
