#!/data/data/com.termux/files/usr/bin/bash

OTA_COMMON="/storage/emulated/0/Download/DownloadeR/ota_common.txt"

ARBSCAN="$HOME/arbscan/target/release/arbscan"

pause() {
    echo
    read -p "Press ENTER to continue..."
}

get_resolved_ota() {
    grep '^DOWNLOAD=' "$OTA_COMMON" | cut -d'"' -f2
}

extract_xbl() {

    OTA_URL="$1"

    echo
    echo "📦 Extracting xbl_config using otaripper..."
    echo

    rm -rf "$HOME"/extracted_*

    otaripper -p xbl_config "$OTA_URL"

    OUTDIR=$(ls -dt "$HOME"/extracted_* 2>/dev/null | head -1)

    if [[ -z "$OUTDIR" ]]; then
        echo "❌ Extraction failed"
        return 1
    fi

    IMG="$OUTDIR/xbl_config.img"

    if [[ ! -f "$IMG" ]]; then
        echo "❌ xbl_config.img not found"
        return 1
    fi

    run_arbscan "$IMG"
}

run_arbscan() {

    IMG="$1"

    echo
    echo "🧠 Reading ARB metadata..."
    echo

    "$ARBSCAN" "$IMG"

    echo
    echo "✅ ARB check finished"

    pause
}

while true
do

clear

echo "========== ARB Checker =========="
echo
echo "1) Use OTA from ota_common.txt"
echo "2) Enter OTA URL"
echo "3) Local xbl_config.img"
echo "0) Back"
echo

read -rp "Select option: " opt

case "$opt" in

1)

    OTA_URL=$(get_resolved_ota)

    [[ -z "$OTA_URL" ]] && {
        echo "❌ OTA URL not found"
        pause
        continue
    }

    extract_xbl "$OTA_URL"
    ;;

2)

    read -rp "OTA URL: " OTA_URL

    [[ -z "$OTA_URL" ]] && continue

    extract_xbl "$OTA_URL"
    ;;

3)

    read -rp "Path to xbl_config.img: " IMG

    [[ ! -f "$IMG" ]] && {
        echo "❌ File not found"
        pause
        continue
    }

    run_arbscan "$IMG"
    ;;

0)
    break
    ;;

*)
    echo "Invalid option"
    sleep 1
    ;;
esac

done
