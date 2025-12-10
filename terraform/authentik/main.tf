module "authentik_config" {
  source = "./modules/authentik_config"
}

module "groups" {
  source   = "./modules/groups"
  akadmin  = var.akadmin
  username = var.username
}

module "modules_oauth2" {
  source = "./modules/oauth2"
  domain = var.domain

  oauth_profile_id        = module.authentik_config.oauth_profile_id
  oauth_email_id          = module.authentik_config.oauth_email_id
  oauth_openid_id         = module.authentik_config.oauth_openid_id
  oauth_offline_access_id = module.authentik_config.oauth_offline_access_id
  proxy_outpost_id        = module.authentik_config.proxy_outpost_id

  airflow_property_mapping_id   = module.authentik_config.airflow_property_mapping_id
  minio_property_mapping_id     = module.authentik_config.minio_property_mapping_id
  openwebui_property_mapping_id = module.authentik_config.openwebui_property_mapping_id

  default_authorization_flow = module.authentik_config.default_authorization_flow
  default_invalidation_flow  = module.authentik_config.default_invalidation_flow
  default_self_singned       = module.authentik_config.default_self_singned

  authentik_admin_group_id     = module.groups.authentik_admin_group
  authentik_prometheus_user_id = module.groups.authentik_prometheus_user
}

module "modules_proxy" {
  source = "./modules/proxy"
  domain = var.domain

  default_authorization_flow = module.authentik_config.default_authorization_flow
  default_invalidation_flow  = module.authentik_config.default_invalidation_flow
  default_self_singned       = module.authentik_config.default_self_singned

  authentik_admin_group_id     = module.groups.authentik_admin_group
  authentik_prometheus_user_id = module.groups.authentik_prometheus_user
}
