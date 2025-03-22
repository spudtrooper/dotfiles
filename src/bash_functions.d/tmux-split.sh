#!/bin/bash

# Splits the screen N ways running the given commands
#
# Usage: ./tmux-split.sh command [...command]
#

set -e

dir=$(dirname "$0")

SESSION_NAME="tmux-split"

# Check if we're already in a tmux session
if [ -z "$TMUX" ]; then
    # Not in a tmux session, create a new one
    echo "Creating new tmux session: $SESSION_NAME"
    tmux new-session -d -s "$SESSION_NAME"
    CREATED_NEW_SESSION=true
else
    # Already in a tmux session, just create a new window
    echo "Already in tmux session, creating a new window"
    WINDOW_NAME="$SESSION_NAME-window"
    tmux new-window -n "$WINDOW_NAME"
    CREATED_NEW_SESSION=false
fi

# Get current window ID
WINDOW=$(tmux display-message -p '#I')

# Create first pane (Director)
echo "Setting up Director pane (0)..."
tmux send-keys "$1" C-m

shift

# Split for the rest of the commands
for cmd in "$@"; do
    echo "Setting up Router pane (1)..."
    tmux split-window -h
    tmux send-keys "$cmd" C-m
done

echo "Arranging panes..."
tmux select-layout tile

# Select the first pane
tmux select-pane -t 0

# If we created a new session, attach to it
if [ "$CREATED_NEW_SESSION" = true ]; then
    echo "Attaching to session $SESSION_NAME..."
    tmux attach-session -t "$SESSION_NAME"
else
    echo "Setup complete!"
fi

exit 0
