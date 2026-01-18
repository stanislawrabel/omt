#!/data/data/com.termux/files/usr/bin/bash

while true; do
  clear
  echo "+==============================+"
  echo "|     OTA Multi Tools v1.0     |"
  echo "+==============================+"
  echo "1) OTA FindeR"
  echo "2) Share OTA links"
  echo "3) DownloadeR"
  echo "0) Exit"
  echo
  read -p "Select: " c

  case "$c" in
    1) tmux new-window -n Finder "bash 1.sh" ;;
    2) tmux new-window -n Share  "bash 2.sh" ;;
    3) tmux new-window -n Download "bash 3.sh" ;;
    0) tmux kill-session -t ota; exit ;;
  esac
done
