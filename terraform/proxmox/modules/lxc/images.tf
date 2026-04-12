resource "proxmox_virtual_environment_download_file" "debian_12_standard_12_2_1_amd64_lxc_img" {
  content_type = "vztmpl"
  datastore_id = "local"
  node_name    = var.proxmox_node_name
  url          = "http://download.proxmox.com/images/system/debian-12-standard_12.2-1_amd64.tar.zst"
}

resource "proxmox_virtual_environment_download_file" "debian_13_standard_13_1_2_amd64_lxc_img" {
  content_type = "vztmpl"
  datastore_id = "local"
  node_name    = var.proxmox_node_name
  url          = "http://download.proxmox.com/images/system/debian-13-standard_13.1-2_amd64.tar.zst"
}

resource "proxmox_virtual_environment_download_file" "ubuntu_24_04_standard_24_04_2_amd64_lxc_img" {
  content_type = "vztmpl"
  datastore_id = "local"
  node_name    = var.proxmox_node_name
  url          = "http://download.proxmox.com/images/system/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
}

resource "proxmox_virtual_environment_download_file" "alpine_3_22_default_amd64_lxc_img" {
  content_type = "vztmpl"
  datastore_id = "local"
  node_name    = var.proxmox_node_name
  url          = "http://download.proxmox.com/images/system/alpine-3.22-default_20250617_amd64.tar.xz"
}
