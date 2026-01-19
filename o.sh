#!/data/data/com.termux/files/usr/bin/bash

SESSION="ota"

# Ak NIE SME v tmuxe → spusti tmux so skriptom
if [[ -z "$TMUX" ]]; then
    tmux new-session -s "$SESSION" "bash $0"
    exit
fi

# ===== TU SME UŽ V TMUX OKNE =====

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
        1) tmux new-window -n Finder "bash 1.sh; exec bash" ;;
        2) tmux new-window -n Share "bash 2.sh; exec bash" ;;
        3) tmux new-window -n Download "bash 3.sh; exec bash" ;;
        0)
            tmux kill-session
            exit
            ;;
    esac
done
