#!/data/data/com.termux/files/usr/bin/bash
APP_NAME="OTA Multi Tools"
APP_VERSION="1.0.0"
APP_AUTHOR="Stano36"
echo "   OTA Multi Tools $VERSION"
echo -e "${GREEN}+=====================================+${RESET}"
echo -e "${GREEN}|==${RESET} ${GREEN}${APP_NAME}${RESET} ${YELLOW}v${APP_VERSION}${RESET} ${GREEN}==|${RESET}"
echo -e "${GREEN}+=====================================+${RESET}"

clear

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

while true; do



  clear
  echo "======================================"
  echo "      OTA Multi Tools  v1.0"
  echo -e "${GREEN}|${RESET} ${YELLOW_BG}${BLACK}  realme   ${RESET}  ${GREEN_BG}${BLACK}  oppo  ${RESET}  ${RED_BG}${WHITE}  Oneplus  ${RESET}  ${GREEN}|${RESET}"
  echo "======================================"
  echo "1) OTA FindeR"
  echo "2) Share OTA links"
  echo "3) DownloadeR"
  echo "4) Universal DownloadeR & Resolver"
  echo "0) Exit"
  echo "--------------------------------------"

    read -p "Select option: " choice

  case "$choice" in
    1)
      bash "$BASE_DIR/1.sh"
      read -p "Press ENTER..."
      ;;
    2)
      bash "$BASE_DIR/2.sh"
      read -p "Press ENTER..."
      ;;
    3)
      bash "$BASE_DIR/3.sh"
      read -p "Press ENTER..."
      ;;
    4)
      bash "$BASE_DIR/4.sh"
      read -p "Press ENTER..."
      ;;
    0)
      exit 0
      ;;
    *)
      echo "❌ Invalid option"
      sleep 1
      ;;
  esac
done

