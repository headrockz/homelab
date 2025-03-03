#!/usr/bin/env bash


# Configurações
BROKER="${MQTT_HOST}"  # Substitua pelo endereço do seu broker
PORT=1883                  # Porta do broker MQTT
USERNAME="${MQTT_USER}"    # Substitua pelo usuário MQTT
PASSWORD="${MQTT_PASS}"      # Substitua pela senha MQTT

TOPIC="$1"                  # Primeiro argumento: Tópico
MESSAGE="$2"                # Segundo argumento: Mensagem

# Verifica se os argumentos foram passados
if [ -z "$TOPIC" ] || [ -z "$MESSAGE" ]; then
    echo "Uso: $0 <tópico> <mensagem>"
    exit 1
fi

# Publica a mensagem via MQTT com autenticação
mosquitto_pub -h "$BROKER" -p "$PORT" -u "$USERNAME" -P "$PASSWORD" -t "$TOPIC" -m "$MESSAGE"

# Verifica se a publicação foi bem-sucedida
if [ $? -eq 0 ]; then
    echo "Mensagem enviada para '$TOPIC': $MESSAGE"
else
    echo "Erro ao enviar a mensagem."
fi
