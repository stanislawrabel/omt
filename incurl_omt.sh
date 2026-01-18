#!/bin/bash
set -e

# 🛠 Automatický mód
export DEBIAN_FRONTEND=noninteractive
export TERM=xterm

echo "📦 Fixing broken packages and cleaning up..."
dpkg --configure -a || true
apt --fix-broken install -y || true
apt clean

echo "📦 Updating Termux and installing dependencies..."
yes "" | pkg update -y
yes "" | pkg upgrade -y

echo "📦 Installing required packages..."
pkg install tmux -y
pkg install -y python python2 git tsu curl
pip install wheel
pip install pycryptodome
pip3 install --upgrade requests pycryptodome git+https://github.com/R0rt1z2/realme-ota

# 🔹 SCRIPTS & FILES
echo "📥 Downloading scripts and data files..."
REPO="https://raw.githubusercontent.com/stanislawrabel/omt/main"

for file in o.sh m.sh 1.sh 2.sh 3.sh 4.sh models.txt devices.txt; do
    curl -sSL "$REPO/$file" -o "$file"
done

chmod +x o.sh m.sh 1.sh 2.sh 3.sh 4.sh
chmod +x ~/o.sh
ln -sf ~/o.sh $PREFIX/bin/o
