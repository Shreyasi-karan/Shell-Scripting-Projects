#!/bin/bash
# utils.sh - reusable helpers

trim_percent() {
  echo "${1//%/}"
}

ask_threshold() {
  read -p "Enter disk usage alert threshold (default 80): " input
  echo "${input:-80}"
}

read_services_file() {
  while read -r line; do
    echo "Configured service: $line"
  done < "$1"
}

run_and_check() {
  "$@"
  if [ $? -ne 0 ]; then
    echo "Command failed: $*"
    return 1
  fi
}

cleanup() {
  echo "Cleaning up temp files..."
  rm -f /tmp/monitor_tmp_*
}
trap cleanup EXIT
