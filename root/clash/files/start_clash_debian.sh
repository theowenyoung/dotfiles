#!/bin/bash
set -e;

# check is root
if [ "$(id -u)" != "0" ]; then
    echo "Error: You must be root to run this script!"
    exit 1
fi
# copy configs to /etc/opt/clash

sudo mkdir -p /etc/opt/clash 

sudo ln -sf /home/green/dotfiles/private/clash/files/config_linux.yaml /etc/opt/clash/config_linux.yaml
sudo ln -sf /home/green/dotfiles/private/clash/files/ruleset /etc/opt/clash/ruleset


# check if bak exists
if [ -f "/etc/resolv.conf.bak" ]; then
  echo "file /etc/resolv.conf.bak exists, do nothing"
else
  echo "file /etc/resolv.conf.bak not exists, backup it"
  sudo cp /etc/resolv.conf /etc/resolv.conf.bak
fi

# backup /etc/resolv.conf

# change the dns server to 127.0.0.1

dnsresolv=$(cat <<-END
nameserver 127.0.0.1
nameserver 119.29.29.29
END
)
echo "$dnsresolv" > /etc/resolv.conf


/opt/clash/bin/clash -d /etc/opt/clash -f /etc/opt/clash/config_linux.yaml
