resource "random_password" "nextexplorer" {
  length  = 40
  special = false
}

resource "random_password" "kestra" {
  length  = 40
  special = false
}
