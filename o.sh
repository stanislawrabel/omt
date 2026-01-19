#!/data/data/com.termux/files/usr/bin/bash

SESSION="ota"

# Vytvor session ak neexistuje
tmux has-session -t "$SESSION" 2>/dev/null || tmux new-session -d -s "$SESSION"

# Ak nie sme v tmuxe, pripoj sa
if [[ -z "$TMUX" ]]; then
    tmux attach -t "$SESSION"
    exit
fi

while true; do
    clear
    echo "OTA Multi Tools"
    echo
    echo "1) OTA Finder"
    echo "2) Share OTA links"
    echo "3) Downloader"
    echo "0) Exit"
    echo

    read -p "Select: " c

    case "$c" in
        1) tmux new-window -t "$SESSION" -n Finder "bash 1.sh; exec bash" ;;
        2) tmux new-window -t "$SESSION" -n Share "bash 2.sh; exec bash" ;;
        3) tmux new-window -t "$SESSION" -n Download "bash 3.sh; exec bash" ;;
        0)
            tmux kill-session -t "$SESSION"
            exit
            ;;
    esac
done
