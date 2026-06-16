#!/usr/bin/env bash

set -u

if [ -f /etc/bashrc.d/mqtt.sh ]; then
    # shellcheck disable=SC1091
    source /etc/bashrc.d/mqtt.sh
fi

BROKER="${MQTT_HOST}"
PORT="${MQTT_PORT:-1883}"
USERNAME="${MQTT_USER}"
PASSWORD="${MQTT_PASS}"
SYSTEM_TOPIC="${1:-}"

containers_running="$(docker ps -q | wc -l | xargs)"
containers_stopped="$(docker ps -aq -f status=exited | wc -l | xargs)"
memory_usage_percent="$(free | awk '/Mem:/ {printf "%.0f", ($3/$2) * 100}')"
disk_usage_percent="$(df / | awk 'NR==2 {gsub("%", "", $5); print $5}')"
ssd_usage_percent="$(df /mnt/ssd | awk 'NR==2 {gsub("%", "", $5); print $5}')"
uptime_seconds="$(awk '{printf "%.0f", $1}' /proc/uptime)"
boot_time=$(($(date +%s) - uptime_seconds))
cpu_usage="$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')"
cpu_temp_raw="$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null || cat /sys/class/thermal/thermal_zone1/temp 2>/dev/null || echo 0)"
cpu_temp="$(awk "BEGIN {printf \"%.1f\", $cpu_temp_raw / 1000}")"
state="ON"


payload="$(printf '{"state":"%s","containers_running":%s,"containers_stopped":%s,"memory_usage_percent":%s,"disk_usage_percent":%s,"ssd_usage_percent":%s,"temperature":%s,"cpu_usage":%s,"boot_time":%s}' \
    "$state" \
    "$containers_running" \
    "$containers_stopped" \
    "$memory_usage_percent" \
    "$disk_usage_percent" \
    "$ssd_usage_percent" \
    "$cpu_temp" \
    "$cpu_usage" \
    "$boot_time")"

mosquitto_pub -h "$BROKER" -p "$PORT" -u "$USERNAME" -P "$PASSWORD" -t "$SYSTEM_TOPIC" -m "$payload"
system_status=$?

if [ "$system_status" -eq 0 ]; then
    echo "Mensagem enviada"
    exit 0
fi

echo "Erro ao enviar a mensagem."
exit 1
