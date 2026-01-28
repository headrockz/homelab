resource "authentik_provider_proxy" "zigbee2mqtt" {
  name               = "Zigbee 2 MQTT"
  external_host      = "https://zigbee.${var.domain}"
  mode               = "forward_single"
  authorization_flow = var.default_authorization_flow
  invalidation_flow  = var.default_invalidation_flow
}

resource "authentik_application" "zigbee2mqtt" {
  name              = "Zigbee 2 MQTT"
  slug              = "zigbee-2-mqtt"
  group             = "Smart Home"
  protocol_provider = authentik_provider_proxy.zigbee2mqtt.id
  meta_launch_url   = "https://zigbee.${var.domain}/"
  meta_icon         = "application-icons/zigbee2mqtt.png"
  open_in_new_tab   = true
}

resource "authentik_policy_binding" "zigbee2mqtt" {
  target = authentik_application.zigbee2mqtt.uuid
  group  = var.authentik_admin_group_id
  order  = 0
}
