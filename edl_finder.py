#!/usr/bin/env python3
import asyncio
import aiohttp
import re
import os

OTA_COMMON = "/storage/emulated/0/Download/DownloadeR/ota_common.txt"
OUTPUT_FILE = "valid_links.txt"


CONCURRENT = 40
TIMEOUT = aiohttp.ClientTimeout(total=10)

# ---------- LOAD ota_common.txt ----------
def load_common():
    data = {}
    with open(OTA_COMMON, "r") as f:
        for line in f:
            if "=" in line:
                k, v = line.strip().split("=", 1)
                data[k] = v.strip().strip('"')
    return data

data = load_common()

MODEL = data["MODEL"]
REGION = data["REGION"]
VERSION_NAME = data["VERSION_NAME"]
OTA = data["OTA"]

# ---------- REGION → BUCKET & SERVER ----------

if REGION in ("EU", "EUEX", "EEA", "TR"):
    BUCKET = "GDPR"
    SERVER = "rms01.realme.net"

elif REGION in ("CN", "CH"):
    BUCKET = "domestic"
    SERVER = "rms11.realme.net"

else:
    BUCKET = "export"
    SERVER = "rms01.realme.net"

# ---------- VERSION CLEAN ----------
# RMX3921_15.0.0.1401(EX01) → 15.0.0.1401EX01
VERSION_CLEAN = re.sub(r"^RMX\d+_", "", VERSION_NAME)
VERSION_CLEAN = VERSION_CLEAN.replace("(", "").replace(")", "")

# ---------- DATE ----------
DATE = OTA.split("_")[-1]

BASE_URL = f"https://{SERVER}/sw/{MODEL}{BUCKET}_11_{VERSION_CLEAN}_{DATE}"

  echo -e "${GREEN}╔════════════════════════════════════╗${RESET}"
  echo -e "${GREEN}║${RESET}           Realme              ${GREEN}║${RESET}"
  echo -e "${GREEN}║${RESET}         EDL FindeR            ${GREEN}║${RESET}"
  echo -e "${GREEN}╠════════════════════════════════════╣${RESET}"
  echo -e "${GREEN}║${RESET} (f"Model:        {MODEL}")         ${GREEN}║${RESET}"
  echo -e "${GREEN}║${RESET} (f"Region:       {REGION}")        ${GREEN}║${RESET}"
  echo -e "${GREEN}║${RESET} (f"Bucket:       {BUCKET}")        ${GREEN}║${RESET}"
  echo -e "${GREEN}║${RESET} (f"Server:       {SERVER}")        ${GREEN}║${RESET}"
  echo -e "${GREEN}║${RESET} (f"versionName:  {VERSION_NAME}")  ${GREEN}║${RESET}"
  echo -e "${GREEN}║${RESET} (f"Date:         {DATE}")          ${GREEN}║${RESET}"
  echo -e "${GREEN}╚════════════════════════════════════╝${RESET}"

print("\n🔗 Base URL:")
print(BASE_URL)

input("\n▶ Start EDL search? [ENTER]")


# ---------- ASYNC CHECK ----------
sem = asyncio.Semaphore(CONCURRENT)

async def check(session, num):
    url = f"{BASE_URL}{num:04d}.zip"
    async with sem:
        try:
            async with session.head(url) as r:
                if r.status == 200:
                    print(f"✅ FOUND: {url}")
                    with open(OUTPUT_FILE, "a") as f:
                        f.write(url + "\n")
        except:
            pass

async def main():
    async with aiohttp.ClientSession(timeout=TIMEOUT) as session:
        tasks = [check(session, i) for i in range(10000)]
        await asyncio.gather(*tasks)

asyncio.run(main())

print("\n✔ EDL search finished")
print(f"📄 Results saved to {OUTPUT_FILE}")
