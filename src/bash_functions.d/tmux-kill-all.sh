#!/bin/sh

# tmux-kill-all.sh - Kill all active tmux sessions with proper feedback
#
# Usage: ./tmux-kill-all.sh
#

# Set error handling
set -e
set -o pipefail

# Function to display error message and exit
function error_exit {
    echo "Error: $1" >&2
    exit 1
}

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    error_exit "tmux is not installed"
fi

# Check if there are any tmux sessions
if ! tmux list-sessions &> /dev/null; then
    echo "No tmux sessions found."
    exit 0
fi

# Get a list of all session names
sessions=$(tmux list-sessions -F "#{session_name}" 2>/dev/null || echo "")

if [[ -z "$sessions" ]]; then
    echo "No tmux sessions found."
    exit 0
fi

# Counter for sessions killed
killed_count=0

# Kill each session
echo "Killing tmux sessions..."
echo "------------------------"

for session in $sessions; do
    echo -n "Killing session: $session ... "
    if tmux kill-session -t "$session" 2>/dev/null; then
        echo "OK"
        ((killed_count++))
    else
        echo "Failed"
    fi
done

echo "------------------------"
echo "Summary: Killed $killed_count tmux session(s)"

# Make script executable with proper permissions
chmod +x "$0"

exit 0

