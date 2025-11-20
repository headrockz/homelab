module "modules_oauth2" {
  source = "./modules/oauth2"
  domain = var.domain
}

module "modules_proxy" {
  source = "./modules/proxy"
  domain = var.domain
}
