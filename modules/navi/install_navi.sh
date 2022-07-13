#!/bin/sh
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    json_pp |
    grep '"tag_name" :' |                                            # Get tag line
    sed -E 's/.*"v([^"]+)".*/\1/'                                    # Pluck JSON value
}
REPO_NAME="denisidoro/navi"
latest_version=$(get_latest_release $REPO_NAME)
ALIAS_NAME="navi" 
PRE_BINARY_NAME="navi-v${latest_version}-x86_64-unknown-linux-musl"
PRE_BINARY_NAME_SUFFIX=".tar.gz"


echo  start install $REPO_NAME latest v${latest_version}
cd -- /tmp
# download
curl -O -L https://github.com/$REPO_NAME/releases/download/v${latest_version}/${PRE_BINARY_NAME}${PRE_BINARY_NAME_SUFFIX}
# extract
tar -xzf ${PRE_BINARY_NAME}${PRE_BINARY_NAME_SUFFIX}

mv $ALIAS_NAME ~/.local/bin/${ALIAS_NAME}

# add execute permission
chmod +x ~/.local/bin/gost