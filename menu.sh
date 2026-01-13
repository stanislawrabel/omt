#!/data/data/com.termux/files/usr/bin/bash

echo -e "${GREEN}+=====================================+${RESET}"
echo -e "${GREEN}|==${RESET} ${GREEN}${APP_NAME}${RESET} ${YELLOW}v${APP_VERSION}${RESET} ${GREEN}==|${RESET}"
echo -e "${GREEN}+=====================================+${RESET}"

clear

BASE_DIR="$HOME/ota-multi-tools"

while true; do
  clear
  echo "======================================"
  echo "      OTA Multi Tools  v1.0"
  echo "======================================"
  echo "1) OTA FindeR"
  echo "2) Share OTA links"
  echo "3) DownloadeR"
  echo "4) Universal DownloadeR & Resolver"
  echo "0) Exit"
  echo "--------------------------------------"

  read -p "Select option: " opt

  case "$opt" in
    1) bash "$BASE_DIR/finder.sh" ;;
    2) bash "$BASE_DIR/share.sh" ;;
    3) bash "$BASE_DIR/downloader.sh" ;;
    4) bash "$BASE_DIR/universal_downloader.sh" ;;
    0) exit 0 ;;
    *) echo "❌ Invalid option"; sleep 1 ;;
  esac
done
