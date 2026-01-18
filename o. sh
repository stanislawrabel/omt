#!/data/data/com.termux/files/usr/bin/bash

SESSION="ota"

if ! tmux has-session -t "$SESSION" 2>/dev/null; then
    tmux new-session -d -s "$SESSION" -n Menu "bash menu.sh"
fi

tmux attach -t "$SESSION"
