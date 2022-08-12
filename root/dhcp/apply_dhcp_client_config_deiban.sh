#!/bin/sh
set -e;

sudo cp /home/green/dotfiles/root/dhcp/files/etc/network/interfaces.d/enp0s25 /etc/network/interfaces.d/enp0s25

# restart networking
sudo systemctl restart networking