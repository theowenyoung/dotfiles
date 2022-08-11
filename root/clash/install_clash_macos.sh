#!/bin/sh

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    json_pp |
    grep '"tag_name" :' |                                            # Get tag line
    sed -E 's/.*"v([^"]+)".*/\1/'                                    # Pluck JSON value
}
NAME="clash"
REPO_NAME="Dreamacro/clash"
latest_version=$(get_latest_release $REPO_NAME)
echo  start install $REPO_NAME latest v${latest_version}
cd /tmp
file_name=clash-darwin-amd64-v3-v${latest_version}
curl -O -L https://github.com/$REPO_NAME/releases/download/v${latest_version}/${file_name}.gz
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