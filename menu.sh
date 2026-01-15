#!/data/data/com.termux/files/usr/bin/bash
APP_NAME="OTA Multi Tools"
APP_VERSION="1.0.0"
APP_AUTHOR="Stano36"
echo -e "   OTA Multi Tools $VERSION"
echo -e "${GREEN}+=====================================+${RESET}"
echo -e "${GREEN}|==${RESET} ${GREEN}${APP_NAME}${RESET} ${YELLOW}v${APP_VERSION}${RESET} ${GREEN}==|${RESET}"
echo -e "${GREEN}+=====================================+${RESET}"



BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

while true; do



  clear
  echo -e "${GREEN}+${RESET}=======================================${GREEN}+${RESET}"
  echo -e "${GREEN}|${RESET}      OTA Multi Tools  v1.0"         |
  echo -e "${GREEN}|${RESET} ${YELLOW_BG}${BLACK}  realme   ${RESET}  ${GREEN_BG}${BLACK}  oppo  ${RESET}  ${RED_BG}${WHITE}  Oneplus  ${RESET}  ${GREEN}|${RESET}"
  echo -e "${GREEN}+${RESET}======================================${GREEN}+${RESET}"
  echo -e" ${GREEN}|${RESET}1) OTA FindeR                    ${GREEN}|${RESET}"
  echo -e" ${GREEN}|${RESET}2) Share OTA links               ${GREEN}|${RESET}"
  echo -e" ${GREEN}|${RESET}3) DownloadeR                    ${GREEN}|${RESET}"
  echo -e "${GREEN}|${RESET}4) Universal DownloadeR & Resolver${GREEN}|${RESET}"
  echo -e "${GREEN}|${RESET}0) Exit                       ${GREEN}|${RESET}"
  echo -e "${GREEN}+${RESET}--------------------------------------${GREEN}+${RESET}"

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

