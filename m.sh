#!/data/data/com.termux/files/usr/bin/bash

while true; do
  clear
  echo "1) OTA Finder"
  echo "2) Share OTA links"
  echo "3) Downloader"
  echo "0) Exit"
  read -p "Select: " c

  case "$c" in
    1) tmux new-window -t ota -n finder "bash 1.sh" ;;
    2) tmux new-window -t ota -n share  "bash 2.sh" ;;
    3) tmux new-window -t ota -n down   "bash 3.sh" ;;
    0) break ;;
  esac
done
