module "authentik_config" {
  source = "./modules/authentik_config"
}

module "modules_oauth2" {
  source = "./modules/oauth2"
  domain = var.domain

  # default properties
  oauth_profile_id            = module.authentik_config.oauth_profile_id
  oauth_email_id              = module.authentik_config.oauth_email_id
  oauth_openid_id             = module.authentik_config.oauth_openid_id
  oauth_offline_access_id     = module.authentik_config.oauth_offline_access_id
  proxy_outpost_id            = module.authentik_config.proxy_outpost_id
  # My properties
  airflow_property_mapping_id = module.authentik_config.airflow_property_mapping_id
  minio_property_mapping_id   = module.authentik_config.minio_property_mapping_id
  # default flows and certs
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
