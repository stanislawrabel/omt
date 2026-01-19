#!/data/data/com.termux/files/usr/bin/bash

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

get_download_percent() {
  [[ ! -f "$HOME/.ota_download.status" ]] && return

  grep -oP '\(\K\d+(?=%\))' "$HOME/.ota_download.status" | tail -1
}

APP_NAME="OTA Multi Tools"
APP_VERSION="1.0.0"
APP_AUTHOR="Stano36"

PERCENT=$(get_download_percent)

if [[ -n "$PERCENT" ]]; then
  echo -e "📥 Downloading: ${GREEN}${PERCENT}%${RESET}"
else
  if [[ -f "$HOME/.ota_download.pid" ]]; then
    if ! kill -0 "$(cat ~/.ota_download.pid)" 2>/dev/null; then
      echo -e "✅ Download finished"
      rm -f ~/.ota_download.pid ~/.ota_download.status
    fi
  fi
fi

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
  echo -e "${GREEN}║${RESET} 4) Universal DownloadeR & Resoler  ${GREEN}║${RESET}"
  echo -e "${GREEN}║${RESET} 0) Exit                            ${GREEN}║${RESET}"
  echo -e "${GREEN}╚════════════════════════════════════╝${RESET}"

  echo
  read -p "Select option: " choice

  case "$choice" in
    1) bash 1.sh ;;
    2) bash 2.sh ;;
    3) bash 3.sh ;;
    4) bash 4.sh ;;
    0) echo "Bye 👋"; exit 0 ;;
    *) echo -e "${RED}Invalid option${RESET}"; sleep 1 ;;
  esac
done
