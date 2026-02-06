#!/data/data/com.termux/files/usr/bin/bash

# ===== COLORS =====
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
CYAN="\033[36m"
WHITE="\033[37m"
BOLD="\033[1m"
RESET="\033[0m"

clear

printf "${BOLD}${CYAN}
╔════════════════════════════════════╗
║        OTA Multi Tools FAQ         ║
╚════════════════════════════════════╝
${RESET}

${GREEN}══════════════════════════════════════${RESET}
${BOLD}📦 OTA FINDeR${RESET}
${GREEN}══════════════════════════════════════${RESET}

Finds OTA update information:

 • OTA version
 • VersionName
 • Android version
 • Security patch
 • Download link
 • MD5 hash

${YELLOW}Stores data in:${RESET}
 /storage/emulated/0/Download/DownloadeR/ota_common.txt

👉 This file is the ${BOLD}main data source${RESET}


${GREEN}══════════════════════════════════════${RESET}
${BOLD}⬇️ DownloadeR (3)${RESET}
${GREEN}══════════════════════════════════════${RESET}

Automatically downloads OTA package.

Uses:
 ota_common.txt

${CYAN}Steps:${RESET}

 1. Run OTA FindeR
 2. Select OTA
 3. Open new Termux session
 4. Run OMT
 5. Press 3

${YELLOW}Downloader runs independently.${RESET}


${GREEN}══════════════════════════════════════${RESET}
${BOLD}🌐 Universal DownloadeR (4)${RESET}
${GREEN}══════════════════════════════════════${RESET}

Downloads any link.

Difference:

 DownloadeR → uses ota_common.txt
 Universal → manual link


${GREEN}══════════════════════════════════════${RESET}
${BOLD}🧪 EDL FINDeR (5)${RESET}
${GREEN}══════════════════════════════════════${RESET}

Generates Factory / EDL firmware links.

Uses:

 MODEL
 REGION
 VERSION_NAME
 OTA date

Builds:

 BASE_URL + XXXX.zip

${YELLOW}XXXX = build ID (0000-9999)${RESET}


${GREEN}══════════════════════════════════════${RESET}
${BOLD}🔗 Share OTA Links${RESET}
${GREEN}══════════════════════════════════════${RESET}

Shares OTA information.

Reads from:

 ota_common.txt

Shares:

 • OTA version
 • VersionName
 • Download link
 • MD5
 • Android version


${GREEN}══════════════════════════════════════${RESET}
${BOLD}📄 ota_common.txt${RESET}
${GREEN}══════════════════════════════════════${RESET}

Main OMT data file.

Contains:

 MODEL
 REGION
 OTA
 VERSION_NAME
 DOWNLOAD
 MD5


${GREEN}══════════════════════════════════════${RESET}
${BOLD}📱 Adding devices${RESET}
${GREEN}══════════════════════════════════════${RESET}

Add new devices to:

 devices.txt
 models.txt

👉 devices.txt
 contains device numbers

👉 models.txt
 contains model names


${GREEN}══════════════════════════════════════${RESET}
${BOLD}🌍 Bucket system${RESET}
${GREEN}══════════════════════════════════════${RESET}

 EU / TR / EEA → GDPR
 CN → domestic
 others → export


${GREEN}══════════════════════════════════════${RESET}
${BOLD}📊 Download progress${RESET}
${GREEN}══════════════════════════════════════${RESET}

Stored in:

 ~/.cache/ota/progress


${GREEN}══════════════════════════════════════${RESET}
${BOLD}⚠️ Common errors${RESET}
${GREEN}══════════════════════════════════════${RESET}

${RED}ota_common.txt not found${RESET}
➡ Run OTA FindeR first

${RED}Do not run directly${RESET}
➡ Start Downloader from menu only


${GREEN}══════════════════════════════════════${RESET}
${BOLD}🛠 Tips${RESET}
${GREEN}══════════════════════════════════════${RESET}

 ✔ Use WiFi
 ✔ OTA packages are 5-12 GB
 ✔ Always verify MD5


${GREEN}══════════════════════════════════════${RESET}
${BOLD}👨‍💻 Author${RESET}
${GREEN}══════════════════════════════════════${RESET}

OTA Multi Tools
by Stano36


${CYAN}══════════════════════════════════════${RESET}
 Press Q to exit
${CYAN}══════════════════════════════════════${RESET}
" | less -R