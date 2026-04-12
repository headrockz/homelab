terraform {
  required_providers {
    kestra = {
      source  = "kestra-io/kestra"
      version = "1.0.1"
    }
  }
}

provider "kestra" {
  # url      = var.kestra_url
  # username = var.kestra_username
  # password = var.kestra_password

  # Enterprise
  # optional jwt token (EE)
  # jwt = var.kestra_jwt
  # optional tenant id (EE)
  # tenant_id = var.kestra_tenant_id
}
