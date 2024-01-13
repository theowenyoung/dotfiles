#!/bin/bash
set -e -o pipefail

function cleanup {
  EXIT_CODE=$?
  set +e # disable termination on error
  # check if /etc/resolv.conf.bak exists
  echo cleanup dns and ipforward
  if [ -f "/etc/resolv.conf.bak" ]; then
    echo "file /etc/resolv.conf.bak exists, restore it"
    sudo cp /etc/resolv.conf.bak /etc/resolv.conf
  else
    echo "file /etc/resolv.conf.bak not exists"
  fi
  sysctl -w net.ipv4.ip_forward=0
  exit $EXIT_CODE
}
trap cleanup EXIT

# check is root
if [ "$(id -u)" != "0" ]; then
    echo "Error: You must be root to run this script!"
    exit 1
fi
# copy configs to /etc/opt/clash

sudo mkdir -p /etc/opt/clash

sudo ln -sf /home/green/dotfiles/private/clash/config_linux.yaml /etc/opt/clash/config_linux.yaml
sudo ln -snf /home/green/dotfiles/private/clash/ruleset /etc/opt/clash/ruleset


# check if bak exists
if [ -f "/etc/resolv.conf.bak" ]; then
  echo "file /etc/resolv.conf.bak exists, do nothing"
else
  echo "file /etc/resolv.conf.bak not exists, backup it"
  sudo cp /etc/resolv.conf /etc/resolv.conf.bak
fi

# backup /etc/resolv.conf


# check /tmp/clash_started is first time run this script, if so sleep 10s to wait for network to be ready

if [ ! -f "/tmp/clash_started" ]; then
  echo "file /tmp/clash_started not exists, sleep 10s to wait for network to be ready"
  sleep 10
fi
# create /tmp/clash_started
touch /tmp/clash_started

# change the dns server to 127.0.0.1

dnsresolv=$(cat <<-END
nameserver 127.0.0.1
nameserver 119.29.29.29
END
)
echo "$dnsresolv" > /etc/resolv.conf


# from https://lancellc.gitbook.io/clash/start-clash/clash-tun-mode/setup-system-stack-in-fake-ip-mode



# set ip forward
sysctl -w net.ipv4.ip_forward=1

/opt/clash/bin/clash -d /etc/opt/clash -f /etc/opt/clash/config_linux.yaml
