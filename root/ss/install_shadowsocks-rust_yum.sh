#!/bin/sh

set -e
get_latest_release() {
  api_url="https://api.github.com/repos/$1/releases/latest";
  echo "$api_url";
  curl --silent "$api_url" | json_pp | grep '"tag_name" :' | sed -E 's/.*"v([^"]+)".*/\1/'                                 
}
NAME="ss"
REPO_NAME="shadowsocks/shadowsocks-rust"
# latest_version=$(get_latest_release $REPO_NAME)
latest_version="1.15.0-alpha.8"
echo  start install $REPO_NAME latest v${latest_version}
cd /tmp
file_name="shadowsocks-v${latest_version}.x86_64-unknown-linux-gnu"
url="https://github.com/$REPO_NAME/releases/download/v${latest_version}/${file_name}.tar.xz"
echo "$url"
curl -O -L "$url" 
mkdir -p ${NAME}
tar -xf ${file_name}.tar.xz --directory ${NAME}
sudo mkdir -p /opt/ss/bin
sudo cp -R ${NAME}/* /opt/ss/bin/

# add execute permission
# chmod +x ~/.local/bin/${NAME}
