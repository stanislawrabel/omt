

#!/data/data/com.termux/files/usr/bin/bash

# 🎨 Colors
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
RED="\033[31m"
BLACK="\033[30m"
WHITE="\033[37m"
YELLOW_BG="\033[43m"
GREEN_BG="\033[42m"
RED_BG="\033[41m"
RESET="\033[0m"

APP_NAME="OTA Multi Tools"
APP_VERSION="1.0.0"
APP_AUTHOR="Stano36"

# === START TMUX SESSION IF NOT RUNNING ===
if ! tmux has-session -t ota 2>/dev/null; then
  tmux new-session -d -s ota
fi

while true; do
  clear

  echo -e "${GREEN}+=====================================+${RESET}"
  echo -e "${GREEN}|${RESET}  ${APP_NAME}  v${APP_VERSION}            ${GREEN}|${RESET}"
  echo -e "${GREEN}|${RESET} ${YELLOW_BG}${BLACK} realme ${RESET} ${GREEN_BG}${BLACK} oppo ${RESET} ${RED_BG}${WHITE} OnePlus ${RESET} ${GREEN}|${RESET}"
  echo -e "${GREEN}+=====================================+${RESET}"
  echo -e "${GREEN}|${RESET} 1) OTA FindeR                       ${GREEN}|${RESET}"
  echo -e "${GREEN}|${RESET} 2) Share OTA links                  ${GREEN}|${RESET}"
  echo -e "${GREEN}|${RESET} 3) DownloadeR                       ${GREEN}|${RESET}"
  echo -e "${GREEN}|${RESET} 0) Exit                             ${GREEN}|${RESET}"
  echo -e "${GREEN}+-------------------------------------+${RESET}"

  read -p "Select option: " c

  case "$c" in
    1) tmux new-window -t ota -n Finder "bash 1.sh" ;;
    2) tmux new-window -t ota -n Share "bash 2.sh" ;;
    3) tmux new-window -t ota -n Download "bash 3.sh" ;;
    0)
      tmux kill-session -t ota
      clear
      exit
      ;;
    *)
      echo -e "${RED}Invalid option${RESET}"
      sleep 1
      ;;
  esac
done
