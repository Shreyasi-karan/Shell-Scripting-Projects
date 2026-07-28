#!/bin/bash
# monitor.sh - Stage 2: add conditionals

name="Shreyasi"
echo "Hello, $name. Running system check..."
echo "Current date: $(date)"

disk_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ "$disk_usage" -gt 80 ]; then
  echo "WARNING: Disk usage is high at ${disk_usage}%"
elif [ "$disk_usage" -gt 50 ]; then
  echo "NOTICE: Disk usage is moderate at ${disk_usage}%"
else
  echo "OK: Disk usage is healthy at ${disk_usage}%"
fi
