#!/data/data/com.termux/files/usr/bin/bash

# ====== BASIC SETUP ======
clear
set +e

APP_NAME="OTA Multi Tools"
APP_VERSION="1.0.0"
APP_AUTHOR="Stano36"

BASE_DIR="$HOME"
SCRIPT_DIR="$BASE_DIR"

# ====== COLORS ======
WHITE="\033[37m"
CYAN="\033[36m"
PURPLE="\033[35m" 
YELLOW="\033[33m"
BLUE="\033[34m"
RED="\033[31m"
BLACK="\033[30m"
WHITE="\033[37m"
GREEN="\033[32m"
YELLOW_BG="\033[43m"
GREEN_BG="\033[42m"
RED_BG="\033[41m"
RESET="\033[0m"

while true; do
  clear

  echo -e "${GREEN}╔════════════════════════════════════╗${RESET}"
  echo -e "${GREEN}║${RESET}       ${CYAN}${APP_NAME}${RESET}  ${YELLOW}v${APP_VERSION}${RESET}      ${GREEN}║${RESET}"
  echo -e "${GREEN}╠════════════════════════════════════╣${RESET}"
  echo -e "${GREEN}║${RESET} ${YELLOW_BG}${BLACK}  realme   ${RESET} ${GREEN_BG}${BLACK}   oppo   ${RESET} ${RED_BG}${WHITE}  OnePlus  ${RESET} ${GREEN}║${RESET}"
  echo -e "${GREEN}╠════════════════════════════════════╣${RESET}"
  echo -e "${GREEN}║${RESET} 1) OTA FindeR                      ${GREEN}║${RESET}"
  echo -e "${GREEN}║${RESET} 2) Share OTA links                 ${GREEN}║${RESET}"
  echo -e "${GREEN}║${RESET} 3) DownloadeR                      ${GREEN}║${RESET}"
  echo -e "${GREEN}║${RESET} 4) Universal DownloadeR & Resolver ${GREEN}║${RESET}"
  echo -e "${GREEN}║${RESET} 0) Exit                            ${GREEN}║${RESET}"
  echo -e "${GREEN}╚════════════════════════════════════╝${RESET}"

  echo
  read -p "Select: " choice

  case "$choice" in
    1)
      clear
      source "$SCRIPT_DIR/1.sh"
      echo
      read -p "Press ENTER to return to menu..."
      ;;
    2)
      clear
      source "$SCRIPT_DIR/2.sh"
      echo
      read -p "Press ENTER to return to menu..."
      ;;
    3)
      clear
      source "$SCRIPT_DIR/3.sh"
      echo
      read -p "Press ENTER to return to menu..."
      ;;
    4)
      clear
      source "$SCRIPT_DIR/4.sh"
      echo
      read -p "Press ENTER to return to menu..."
      ;;
    0)
      clear
      echo "Bye 👋"
      exit 0
      ;;
    *)
      echo "❌ Invalid option"
      sleep 1
      ;;
  esac
done
