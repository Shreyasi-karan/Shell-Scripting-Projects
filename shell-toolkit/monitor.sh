#!/bin/bash
# monitor.sh - Stage 3: functions and loops

check_disk() {
  disk_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
  if [ "$disk_usage" -gt 80 ]; then
    echo "WARNING: Disk usage high at ${disk_usage}%"
  else
    echo "OK: Disk usage at ${disk_usage}%"
  fi
}

check_memory() {
  mem_usage=$(free | grep Mem | awk '{print ($3/$2) * 100.0}')
  echo "Memory usage: ${mem_usage}%"
}

check_services() {
  services=("ssh" "cron" "docker")
  for service in "${services[@]}"; do
    if systemctl is-active --quiet "$service"; then
      echo "$service: running"
    else
      echo "$service: NOT running"
    fi
  done
}

echo "=== System Report: $(date) ==="
check_disk
check_memory
check_services
