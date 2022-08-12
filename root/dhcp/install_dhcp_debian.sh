#!/bin/bash
set -e;
# copy files/etc/default/isc-dhcp-server to /etc/default/isc-dhcp-server
sudo cp /home/green/dotfiles/root/dhcp/files/etc/default/isc-dhcp-server /etc/default/isc-dhcp-server

# copy files/etc/dhcp/dhcpd.conf to /etc/dhcp/dhcpd.conf
sudo cp /home/green/dotfiles/root/dhcp/files/etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf

sudo apt install --yes isc-dhcp-server