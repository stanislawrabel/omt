#!/data/data/com.termux/files/usr/bin/bash

SESSION="ota"

tmux has-session -t "$SESSION" 2>/dev/null || \
tmux new-session -d -s "$SESSION" "bash menu.sh"

tmux attach -t "$SESSION"
