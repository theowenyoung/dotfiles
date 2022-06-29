#!/bin/sh
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    json_pp |
    grep '"tag_name" :' |                                            # Get tag line
    sed -E 's/.*"v([^"]+)".*/\1/'                                    # Pluck JSON value
}
REPO_NAME="ginuerzh/gost"
latest_version=$(get_latest_release $REPO_NAME)
echo  start install $REPO_NAME latest v${latest_version}
cd /tmp
curl -O -L https://github.com/$REPO_NAME/releases/download/v${latest_version}/gost-linux-amd64-${latest_version}.gz
gzip -d gost-linux-amd64-$latest_version.gz
mv gost-linux-amd64-$latest_version ~/.local/bin/gost

# add execute permission
chmod +x ~/.local/bin/gost