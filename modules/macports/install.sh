#!/bin/sh
# ref: https://askubuntu.com/a/30157/8698
if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi


get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    json_pp |
    grep '"tag_name" :' |                                            # Get tag line
    sed -E 's/.*"v([^"]+)".*/\1/'                                    # Pluck JSON value
}

macports_version=$(get_latest_release macports/macports-base)
echo  start install MacPorts v${macports_version}
cd /tmp
curl -O -L https://github.com/macports/macports-base/releases/download/v${macports_version}/MacPorts-${macports_version}.tar.gz
tar -xzvf MacPorts-${macports_version}.tar.gz
cd MacPorts-${macports_version}
./configure
# make
sudo make install
sudo port selfupdate
# install  zsh completions
sudo port install zsh-completions