#!/bin/bash
# Basic tests for monitor.sh functions

source ../utils.sh

test_count=0
pass_count=0

assert_equals() {
  test_count=$((test_count+1))
  if [ "$1" == "$2" ]; then
    pass_count=$((pass_count+1))
    echo "PASS: $3"
  else
    echo "FAIL: $3 (expected '$1', got '$2')"
  fi
}

result=$(trim_percent "85%")
assert_equals "85" "$result" "trim_percent removes % sign"

echo "Passed $pass_count/$test_count tests"
