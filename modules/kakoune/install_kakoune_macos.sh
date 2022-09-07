#!/bin/sh

set -e
# check if /tmp/kakoune exist
if [ -d /tmp/kakoune ]; then
  git pull
else 
  git clone https://github.com/mawww/kakoune.git /tmp/kakoune

cd -- /tmp/kakoune/src

make

cp ./kak ~/.local/bin/kak

# clean
#
rm -rf /tmp/kakoune


echo "success"