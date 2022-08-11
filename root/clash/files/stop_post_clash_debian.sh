#!/bin/sh
set -e;

# check if /etc/resolv.conf.bak exists
if [ -f "/etc/resolv.conf.bak" ]; then
  echo "file /etc/resolv.conf.bak exists, restore it"
  sudo cp /etc/resolv.conf.bak /etc/resolv.conf
else
  echo "file /etc/resolv.conf.bak not exists"
fi



