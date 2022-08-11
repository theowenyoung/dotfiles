#!/bin/sh
set -e;
NAME="clash"
REPO_NAME="Dreamacro/clash"
latest_version="2022.07.07"
echo  start install $REPO_NAME latest v${latest_version}
cd /tmp
file_name=clash-linux-amd64-v3-${latest_version}
# download_url="https://download.fastgit.org/Dreamacro/clash/releases/download/premium/${file_name}.gz";
# download_url="https://github.com/Dreamacro/clash/releases/download/premium/${file_name}.gz";
download_url="https://dotfiles.owenyoung.com/assets/${file_name}.gz";
echo start download $download_url;
# curl -O -L https://github.com/Dreamacro/clash/releases/download/premium/${file_name}.gz
curl -O -L "$download_url"
gzip -d ${file_name}.gz
sudo mkdir -p /opt/clash/bin/
sudo mv ${file_name} /opt/clash/bin/${NAME}

# add execute permission
sudo chmod +x /opt/clash/bin/${NAME}

# copy ui
sudo mkdir -p /etc/opt/caddy/
cd -- /etc/opt/caddy/

# check is ui exists
if [ -d "/etc/opt/caddy/ui" ]; then
  echo "ui exists"
else
  echo "ui not exists, we will clone it"
  sudo git clone https://github.com/Dreamacro/clash-dashboard.git ui
fi
cd -- ui
sudo git pull
sudo git checkout gh-pages


# create system server

sudo cp ~/dotfiles/root/clash/files/start_clash_debian.sh /opt/clash/bin/start_clash_debian.sh
sudo cp ~/dotfiles/root/clash/files/clash.service /etc/systemd/system/clash.service
sudo ~/dotfiles/modules/systemd/restart_root_service.sh clash