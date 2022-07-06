#!/bin/sh
set -e
rm -rf /tmp/kakoune
git clone https://github.com/mawww/kakoune.git /tmp/kakoune
cd /tmp/kakoune
#git checkout 346b81bd897d7d9f9b3fffad9c33241245b90fbe
cd /tmp/kakoune/src
make install debug=no PREFIX=${HOME}/.local
# clean
rm -rf /tmp/kakoune
