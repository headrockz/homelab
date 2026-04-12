resource "authentik_property_mapping_notification" "headers-telegram" {
  name       = "headers-telegram"
  expression = <<-EOT
    return {
      "Content-Type": "application/json"
    }
  EOT
}

resource "authentik_property_mapping_notification" "body-telegram" {
  name       = "body-telegram"
  expression = <<-EOT
return {
  "chat_id": "${local.telegram_chat_id}",
  "text": f"""🚨 AUTHENTIK ALERT! 🚨

{request.context}"""
}
  EOT
}

resource "authentik_event_transport" "default-telegram-transport" {
  name                    = "default-telegram-transport"
  mode                    = "webhook"
  send_once               = true
  webhook_url             = local.webhook_url
  email_subject_prefix    = "authentik Notification: "
  webhook_mapping_body    = authentik_property_mapping_notification.body-telegram.id
  webhook_mapping_headers = authentik_property_mapping_notification.headers-telegram.id
}
