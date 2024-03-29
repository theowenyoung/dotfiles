#!/bin/bash
set -e
NAME="clash"
REPO_NAME="Dreamacro/clash"
latest_version="2022.11.25"
echo start install $REPO_NAME latest v${latest_version}
cd /tmp
file_name=clash-linux-amd64-v3-${latest_version}
# download_url="https://download.fastgit.org/Dreamacro/clash/releases/download/premium/${file_name}.gz";
# download_url="https://github.com/Dreamacro/clash/releases/download/premium/${file_name}.gz";
download_url="https://dotfiles.owenyoung.com/assets/${file_name}.gz"

# check is file exists
if [ -f "/tmp/${file_name}.gz" ]; then
    echo "file ${file_name}.gz exists"
else
    echo "file ${file_name}.gz not exists, download it"
    echo start download $download_url
    curl -O -L "$download_url"
fi

gzip -d ${file_name}.gz
sudo mkdir -p /opt/clash/bin/
sudo mv ${file_name} /opt/clash/bin/${NAME}

# add execute permission
sudo chmod +x /opt/clash/bin/${NAME}

# copy ui
sudo mkdir -p /etc/opt/clash/
cd -- /etc/opt/clash/

# check is ui exists
if [ -d "/etc/opt/clash/ui" ]; then
    echo "ui exists"
    # delete it
    sudo rm -rf /etc/opt/clash/ui
fi
sudo git clone https://github.com/theowenyoung/clash-dashboard.git ui
cd -- ui
sudo git pull
sudo git checkout gh-pages

# create system server

sudo ln -sf /home/green/dotfiles/root/clash/files/start_clash_debian.sh /opt/clash/bin/start_clash_debian.sh

sudo cp /home/green/dotfiles/root/clash/files/clash.service /etc/systemd/system/clash.service
sudo /home/green/dotfiles/modules/systemd/restart_root_service.sh clash
