#!/bin/bash

set -e

users=$(ps aux | tail -n +2 | awk '{print $1}' | sort | uniq)

for user in $users; do
    ps_output=$(ps aux | grep "^$user")
    len=$(echo "$ps_output" | wc -l | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
    echo "$user ($len)"
    echo "$ps_output" | awk '{print "  " $11}' | sort | uniq
    echo
done