#!/bin/sh
set -e
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/kak/
# sudo apt install -y kakoune

cd -- /tmp
curl -O -L https://github.com/theowenyoung/kakoune/releases/download/v2021.11.08-2/kakoune-v2021.11.08-2-linux.tar.bz2

tar -xf kakoune-v2021.11.08-2-linux.tar.bz2

cp kakoune-v2021.11.08-2-linux/bin/kak ~/.local/bin

cp -r kakoune-v2021.11.08-2-linux/share/kak ~/.local/share

echo "success"