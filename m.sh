#!/data/data/com.termux/files/usr/bin/bash

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
    1) echo "Starting Finder…" ;;
    2) echo "Starting Share…" ;;
    3) echo "Starting Downloader…" ;;
    0) echo "Bye"; exit 0 ;;
    *) echo "Invalid option"; sleep 1 ;;
  esac
done
