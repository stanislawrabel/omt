#!/data/data/com.termux/files/usr/bin/bash

SESSION="ota"

# Ak session neexistuje, vytvor ju a spusti menu v nej
if ! tmux has-session -t "$SESSION" 2>/dev/null; then
  tmux new-session -s "$SESSION" -n Menu "bash $0"
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
  read -r -p "Select: " c

  case "$c" in
    1) tmux new-window -t "$SESSION" -n Finder "bash 1.sh; read -p 'Press ENTER to close...'" ;;
    2) tmux new-window -t "$SESSION" -n Share "bash 2.sh; read -p 'Press ENTER to close...'" ;;
    3) tmux new-window -t "$SESSION" -n Download "bash 3.sh; read -p 'Press ENTER to close...'" ;;
    0)
       tmux kill-session -t "$SESSION"
       exit
       ;;
  esac
done
