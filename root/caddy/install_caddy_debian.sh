#!/bin/sh
set -e
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    json_pp |
    grep '"tag_name" :' |                                            # Get tag line
    sed -E 's/.*"v([^"]+)".*/\1/'                                    # Pluck JSON value
}
NAME="caddy"
REPO_NAME="caddyserver/caddy"
latest_version=$(get_latest_release $REPO_NAME)
echo  start install $REPO_NAME latest v${latest_version}
cd /tmp
file_name="caddy_${latest_version}_linux_amd64"
curl -O -L https://github.com/$REPO_NAME/releases/download/v${latest_version}/${file_name}.tar.gz
tar -xf ${file_name}.tar.gz
mv ${NAME} ~/.local/bin/${NAME}

# add execute permission
chmod +x ~/.local/bin/${NAME}
