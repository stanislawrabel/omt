#!/data/data/com.termux/files/usr/bin/bash
clear
echo "========= DownloadeR & Resolver ========"

APP_NAME="OTA Multi Tools"
APP_VERSION="1.1.0"
APP_AUTHOR="Stano36"

# 🎨 Colors 
WHITE="\033[37m"
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



# === 🧠 CHECK ARIA2 ===
if ! command -v aria2c &>/dev/null; then
  echo -e "${RED}❌ aria2c not installed .${RESET}"
  echo "👉 Run: pkg install aria2 -y"
  exit 1
fi

DOWNLOAD_DIR="/storage/emulated/0/Download/DownloadeR"
LOG_FILE="$DOWNLOAD_DIR/ota_downloads.log"
mkdir -p "$DOWNLOAD_DIR"

for cmd in aria2c curl python3; do
  command -v "$cmd" >/dev/null || {
    echo -e "${RED}❌ Missing: $cmd${RESET}"
  
    exit 1
  }
done

# -------- 4PDA resolver ----------
clean_url() {
  if [[ "$1" == *"4pda.to/stat/go"* ]]; then
    encoded=$(echo "$1" | sed -n 's/.*[?&]u=\([^&]*\).*/\1/p')
    python3 - <<EOF
import urllib.parse
print(urllib.parse.unquote("$encoded"))
EOF
  else
    echo "$1"
  fi
}

# -------- downloadCheck resolver ----------
resolve_zip() {
  curl -s -I --http1.1 \
    -H "User-Agent: Dalvik/2.1.0 (Linux; Android 16)" \
    -H "userId: oplus-ota|16002018" \
    -H "Accept: */*" \
    -H "Accept-Encoding: identity" \
    "$1" \
  | grep -i '^location:' \
  | tail -1 \
  | awk '{print $2}' \
  | tr -d '\r'
}

clear
echo -e "${GREEN}╔═════════════════════════════════════╗${RESET}"
echo -e "${GREEN}║${RESET}${RED_BG}${WHITE}              Universal              ${RESET}${GREEN}║${RESET}"

echo -e "${GREEN}║${RESET} ${YELLOW}      DownloadeR${RESET} & ${YELLOW}Resolver${RESET}         ${GREEN}║${RESET}"

echo -e "${GREEN}║${RESET}    ${RED}         by${RESET} ${BLUE}Stano36 ${RESET}             ${GREEN}║${RESET}"
echo -e "${GREEN}╠═════════════════════════════════════╣${RESET}"                              
echo -e "${GREEN}║${RESET}${YELLOW_BG}${BLACK}   realme   ${RESET}${GREEN_BG}${BLACK}    oppo    ${RESET}${RED_BG}${WHITE}   Oneplus   ${RESET}${GREEN}║${RESET}"
echo -e "${GREEN}╚═════════════════════════════════════╝${RESET}" 


while true; do
  echo
  read -rp "🔗 Enter URL (ZIP or downloadCheck): " INPUT
  [[ -z "$INPUT" ]] && continue

  URL=$(clean_url "$INPUT")
    # === 🧠 RESOLVE IF downloadCheck ===
  if [[ "$URL" == *"downloadCheck"* ]]; then
    echo -e "${YELLOW}🔄 Resolving OTA link...${RESET}"
    ZIP_URL=$(resolve_zip "$URL")

    if [[ -z "$ZIP_URL" ]]; then
      echo -e "${RED}❌ Failed to resolve ZIP link${RESET}"
      echo "⚠️ Link may be expired or region mismatch"
      continue
    fi

    URL="$ZIP_URL"
    echo -e "${GREEN}✔ ZIP resolved:${RESET}"
    echo "$URL"
  fi

  # === 🔍 QUICK CHECK ===
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "$URL")
  if [[ "$STATUS" != "200" ]]; then
    echo -e "${RED}❌ Link invalid (HTTP $STATUS)${RESET}"
    continue
  fi
  # === 📦 FILE NAME ===
FILENAME=$(basename "${URL%%\?*}")
read -rp "💾 File name [$FILENAME]: " CUSTOM
FILENAME="${CUSTOM:-$FILENAME}"

echo
echo "========================================"
echo "📦 File: $FILENAME"
echo "📂 Folder: $DOWNLOAD_DIR"
echo "========================================"
echo

echo "📥 Starting download..."
sleep 0.5

# === 📥 DOWNLOAD ===
aria2c -c -x16 -s16 \
  --summary-interval=1 \
  --console-log-level=notice \
  --show-console-readout=true \
  --human-readable=true \
  --download-result=full \
  --user-agent="Dalvik/2.1.0 (Linux; Android 13)" \
  --referer="https://4pda.to/" \
  -d "$DOWNLOAD_DIR" \
  -o "$FILENAME" \
  "$URL"

RESULT=$?

echo

# === ✅ SUCCESS ===
if [[ $RESULT -eq 0 ]]; then
  echo "✅ Download completed successfully"

  echo "[$(date)] OK | $FILENAME" >> "$LOG_FILE"

  # Android notification
  termux-notification \
    --title "Universal DownloadeR" \
    --content "Download completed: $FILENAME"

  termux-toast "✅ Download completed"

# === ❌ FAILED ===
else
  echo "❌ Download failed"
  echo "[$(date)] FAIL | $FILENAME" >> "$LOG_FILE"

  termux-notification \
    --title "Universal DownloadeR" \
    --content "Download failed: $FILENAME"
fi

echo
echo "----------------------------------------"
echo "1) New download"
echo "0) Exit"
echo "----------------------------------------"

read -rp "Select option: " CHOICE

if [[ "$CHOICE" == "0" ]]; then
  echo "👋 Exiting Universal DownloadeR"
  clear
  exit 0
fi
done  
