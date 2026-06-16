#!/bin/bash


source /etc/bashrc.d/mqtt.sh

BROKER=$MQTT_HOST
USERNAME=$MQTT_USER
PASSWORD=$MQTT_PASS
TOPIC="${1:-}"


UPDATES=$(apt list --upgradable 2>/dev/null | grep -v "Listing..." | wc -l)

if [ "$UPDATES" -eq 0 ]; then
    STATUS="Updated"
else
    STATUS="Updates Available"
fi

# Publica a mensagem via MQTT com autenticação
mosquitto_pub -h $BROKER -t "$TOPIC" -u $USERNAME -P $PASSWORD -m "{\"state\": \"$STATUS\"}"

# Verifica se a publicação foi bem-sucedida
if [ $? -eq 0 ]; then
    echo "Mensagem enviada"
else
    echo "Erro ao enviar a mensagem."
fi
