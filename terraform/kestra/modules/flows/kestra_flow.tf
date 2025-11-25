resource "kestra_flow" "example" {
  namespace = "dev"
  flow_id   = "ollama_flow"
  #   content = file("${path.module}/flows/ollama_flow.yaml")
  content = <<EOT
id: ollama_flow
namespace: dev

inputs:
  - id: prompt
    type: STRING
    defaults: oi tudo bem?

tasks:
  # - id: ollama_cli
  #   type: io.kestra.plugin.ai.completion.ChatCompletion
  #   provider:
  #     type: io.kestra.plugin.ai.provider.Ollama
  #     modelName: gemma3:1b
  #     endpoint: http://<ip>:11434
  #   messages:
  #     - type: SYSTEM
  #       content: You are a helpful assistant, answer concisely, avoid overly casual language or unnecessary verbosity. answer in portuguese
  #     - type: USER
  #       content: "{{inputs.prompt}}"
  - id: openrouter_cli
    type: io.kestra.plugin.ai.completion.ChatCompletion
    provider:
      type: io.kestra.plugin.ai.provider.OpenAI
      modelName: openai/gpt-oss-20b:free
      baseUrl: "{{ kv('${var.kv_dev_openrouter_api}') }}"
      apiKey: "{{ secret('OPENROUTER_API_KEY') }}"
    messages:
      - type: SYSTEM
        content: You are a helpful assistant, answer concisely, avoid overly casual language or unnecessary verbosity. answer in portuguese
      - type: USER
        content: "{{inputs.prompt}}"
EOT
}
