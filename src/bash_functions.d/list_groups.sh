#!/bin/bash

# Check if a group name is provided
if [ $# -eq 0 ]; then
    echo "No group name provided. Listing all groups and their members."
    echo "--------------------------------------------"

    # List all groups and their members
    for group in $(dscl . -list /Groups); do
        echo "Group: $group"
        dscl . -read /Groups/$group GroupMembership 2>/dev/null | grep GroupMembership || echo "  No members"
        echo "--------------------------------------------"
    done
else
    group_name=$1
    echo "Listing members of group: $group_name"
    echo "--------------------------------------------"
    dscl . -read /Groups/$group_name GroupMembership 2>/dev/null | grep GroupMembership || echo "No such group or no members"
fi