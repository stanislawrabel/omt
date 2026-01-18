#!/data/data/com.termux/files/usr/bin/bash

# 🎨 Farby
GREEN="\033[32m"
YELLOW="\033[33m"
RED="\033[31m"
RESET="\033[0m"

SESSION="ota"

# 🔹 vytvor session ak neexistuje
if ! tmux has-session -t "$SESSION" 2>/dev/null; then
    tmux new-session -d -s "$SESSION"
fi

# 🔹 ak NIE SME v tmuxe → pripoj sa
if [[ -z "$TMUX" ]]; then
    tmux attach -t "$SESSION"
    exit
fi

while true; do
    clear
    echo -e "${GREEN}+=====================================+${RESET}"
    echo -e "${GREEN}|${RESET}      OTA Multi Tools  v1.0.0        ${GREEN}|${RESET}"
    echo -e "${GREEN}+=====================================+${RESET}"
    echo -e "1) OTA FindeR"
    echo -e "2) Share OTA links"
    echo -e "3) DownloadeR"
    echo -e "0) Exit"
    echo
    read -p "Select: " c

    case "$c" in
        1) tmux new-window -t "$SESSION" -n Finder "bash 1.sh" ;;
        2) tmux new-window -t "$SESSION" -n Share "bash 2.sh" ;;
        3) tmux new-window -t "$SESSION" -n Download "bash 3.sh" ;;
        0)
           tmux kill-session -t "$SESSION"
           exit
           ;;
    esac
done
