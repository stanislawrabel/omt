#!/data/data/com.termux/files/usr/bin/bash
clear
echo "=== DownloadeR ==="

APP_NAME="OTA Multi Tools"
APP_VERSION="1.0.0"
APP_AUTHOR="Stano36"

STATUS_FILE="$HOME/.ota_download.status"

aria2c \
  --summary-interval=1 \
  --file-allocation=trunc \
  "$FINAL_URL" \
  -d "$TARGET_DIR" \
  -o "$TARGET_NAME" \
  --log="$STATUS_FILE" \
  --log-level=notice \
  &

echo $!     > "$HOME/.ota_download.pid"

COMMON_FILE="/storage/emulated/0/Download/DownloadeR/ota_common.txt"

if [[ ! -f "$COMMON_FILE" ]]; then
  echo "❌ ota_common.txt not found"
  exit 1
fi

source "$COMMON_FILE"

# === 🧠 CHECK ARIA2 ===
if ! command -v aria2c &>/dev/null; then
  echo -e "${RED}❌ aria2c not installed .${RESET}"
  echo "👉 Run: pkg install aria2 -y"
  exit 1
fi

FINAL_URL="$DOWNLOAD"

if [[ ! "$FINAL_URL" =~ ^https?:// ]]; then
  echo "❌ Invalid FINAL_URL"
  exit 1
fi
# === LOAD COMMON ===
fix_old_zip() {
  echo "$1" | sed 's/gauss-componentotamanual/gauss-opexcostmanual-eu/'
}

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

FINAL_URL="$DOWNLOAD"

# === RESOLVE IF NEEDED ===
if [[ "$FINAL_URL" == *"downloadCheck"* ]]; then
  echo "🔄 Resolving downloadCheck…"
  FINAL_URL=$(resolve_zip "$FINAL_URL")
fi

# === VALIDATION ===
if [[ -z "$FINAL_URL" || ! "$FINAL_URL" =~ ^https?:// ]]; then
  echo "❌ Invalid FINAL_URL"
  exit 1
fi

read -p "Start download? (y/n): " yn
[[ "$yn" != "y" ]] && return 0

echo "📥 Downloading:"
echo "$FINAL_URL"
echo "➡️  Saving as: $FINAL_NAME"


TARGET_DIR="/storage/emulated/0/Download/DownloadeR"
TARGET_NAME="${OTA}.zip"


aria2c \
  --enable-rpc=true \
  --rpc-listen-all=false \
  --rpc-listen-port=6800 \
  --summary-interval=1 \
  "$FINAL_URL" \
  -d "$TARGET_DIR" \
  -o "$TARGET_NAME" \
  >/dev/null 2>&1 &

FINAL_PATH="$TARGET_DIR/$TARGET_NAME"

if [[ -n "$MD5" && -f "$FINAL_PATH" ]]; then
  echo "🔐 Verifying MD5..."
  echo "$MD5  $FINAL_PATH" | md5sum -c -
else
  echo "⚠️ MD5 skipped (missing hash or file)"
fi

echo "✅ Done: $FINAL_PATH"
echo
read -p "Press ENTER to return to menu..."
0
