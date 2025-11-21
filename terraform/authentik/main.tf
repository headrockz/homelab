module "authentik_config" {
  source = "./modules/authentik_config"
}

module "modules_oauth2" {
  source = "./modules/oauth2"
  domain = var.domain

  oauth_profile_id            = module.authentik_config.oauth_profile_id
  airflow_property_mapping_id = module.authentik_config.airflow_property_mapping_id
  default_authorization_flow  = module.authentik_config.default_authorization_flow
  default_invalidation_flow   = module.authentik_config.default_invalidation_flow
  default_self_singned        = module.authentik_config.default_self_singned
}

module "modules_proxy" {
  source = "./modules/proxy"
  domain = var.domain

  default_authorization_flow = module.authentik_config.default_authorization_flow
  default_invalidation_flow  = module.authentik_config.default_invalidation_flow
  default_self_singned       = module.authentik_config.default_self_singned
}
