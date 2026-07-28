#!/bin/bash
# monitor.sh - Stage 4: arguments, logging, error handling

set -e   # exit immediately if any command fails
LOGFILE="monitor.log"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOGFILE"
}

usage() {
  echo "Usage: $0 [-d] [-m] [-s]"
  echo "  -d  check disk only"
  echo "  -m  check memory only"
  echo "  -s  check services only"
  exit 1
}

check_disk() {
  disk_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
  log "Disk usage: ${disk_usage}%"
}

check_memory() {
  mem_usage=$(free | grep Mem | awk '{printf "%.1f", ($3/$2) * 100.0}')
  log "Memory usage: ${mem_usage}%"
}

check_services() {
  for service in ssh cron docker; do
    if systemctl is-active --quiet "$service" 2>/dev/null; then
      log "$service: running"
    else
      log "$service: NOT running"
    fi
  done
}

if [ $# -eq 0 ]; then
  check_disk
  check_memory
  check_services
else
  while getopts "dms" opt; do
    case $opt in
      d) check_disk ;;
      m) check_memory ;;
      s) check_services ;;
      *) usage ;;
    esac
  done
fi
