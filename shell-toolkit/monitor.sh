#!/bin/bash

# monitor.sh - Updated by fix-a  and fix-b branches manually

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/config.env"

#source ./config.env

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOGFILE"
}

check_disk() {
  disk_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
  if [ "$disk_usage" -gt "$DISK_THRESHOLD" ]; then
    log "WARNING: Disk usage ${disk_usage}% exceeds threshold ${DISK_THRESHOLD}%"
  else
    log "OK: Disk usage ${disk_usage}%"
  fi
}

check_services() {
  for service in $SERVICES; do
    if systemctl is-active --quiet "$service" 2>/dev/null; then
      log "$service: running"
    else
      log "$service: NOT running"
    fi
  done
}

check_disk
check_services
