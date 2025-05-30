#!/usr/bin/env bash


BROKER="${MQTT_HOST}"      # Replace with your broker address
PORT=1883                  # MQTT broker port
USERNAME="${MQTT_USER}"    # Replace with your MQTT username
PASSWORD="${MQTT_PASS}"    # Replace with your MQTT password

TOPIC="$1"                 # First argument: Topic
MESSAGE="$2"               # Second argument: Message

# Check if arguments were provided
if [ -z "$TOPIC" ] || [ -z "$MESSAGE" ]; then
    echo "Usage: $0 <topic> <message>"
    exit 1
fi

# Publish the message via MQTT with authentication
mosquitto_pub -h "$BROKER" -p "$PORT" -u "$USERNAME" -P "$PASSWORD" -t "$TOPIC" -m "$MESSAGE"

# Check if the publication was successful
if [ $? -eq 0 ]; then
    echo "Message sent to '$TOPIC': $MESSAGE"
else
    echo "Error sending the message."
fi
