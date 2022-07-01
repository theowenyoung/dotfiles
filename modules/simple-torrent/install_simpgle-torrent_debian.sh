#!/bin/sh
set -e
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    json_pp |
    grep '"tag_name" :' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}
NAME="simple-torrent"
REPO_NAME="boypt/simple-torrent"
latest_version=$(get_latest_release $REPO_NAME)
echo  start install $REPO_NAME latest v${latest_version}
cd /tmp
file_name="cloud-torrent_linux_amd64_static"
curl -O -L https://github.com/$REPO_NAME/releases/download/${latest_version}/${file_name}.gz
gzip -d ${file_name}.gz
mv cloud-torrent_linux_amd64_static ~/.local/bin/${NAME}

# add execute permission
chmod +x ~/.local/bin/${NAME}
