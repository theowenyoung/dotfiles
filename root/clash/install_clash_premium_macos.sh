#!/bin/sh

NAME="clash"
REPO_NAME="Dreamacro/clash"
latest_version="2022.07.07"
echo  start install $REPO_NAME latest v${latest_version}
cd /tmp
file_name=clash-darwin-amd64-v3-${latest_version}
curl -O -L https://github.com/Dreamacro/clash/releases/download/premium/${file_name}.gz
gzip -d ${file_name}.gz
mv ${file_name} ~/.local/bin/${NAME}

# add execute permission
chmod +x ~/.local/bin/${NAME}

# clone ui files to ~/.local/share/clash/ui/
mkdir -p ~/.local/share/clash/
cd -- ~/.local/share/clash/
git clone https://github.com/Dreamacro/clash-dashboard.git ui
cd -- ui
git checkout gh-pages