#!/bin/bash
set -e;

# check is root
if [ "$(id -u)" != "0" ]; then
    echo "Error: You must be root to run this script!"
    exit 1
fi
# copy configs to /etc/opt/clash

sudo mkdir -p /etc/opt/clash 

sudo ln -sf ~/dotfiles/private/clash/files/config_linux.yaml /etc/opt/clash/config_linux.yaml
sudo ln -sf ~/dotfiles/private/clash/files/ruleset /etc/opt/clash/ruleset

/opt/clash/bin/clash -d /etc/opt/clash -f /etc/opt/clash/config_linux.yaml


# backup /etc/resolv.conf
cp /etc/resolv.conf /etc/resolv.conf.bak

# change the dns server to 127.0.0.1
echo 'nameserver 127.0.0.1' > /etc/resolv.conf

# change iptables

iptables -t nat -N CLASH
iptables -t nat -A CLASH -d 10.0.0.0/8 -j RETURN
iptables -t nat -A CLASH -d 127.0.0.0/8 -j RETURN
iptables -t nat -A CLASH -d 169.254.0.0/16 -j RETURN
iptables -t nat -A CLASH -d 172.16.0.0/12 -j RETURN
iptables -t nat -A CLASH -d 192.168.0.0/16 -j RETURN
iptables -t nat -A CLASH -d 224.0.0.0/4 -j RETURN
iptables -t nat -A CLASH -d 240.0.0.0/4 -j RETURN
iptables -t nat -A CLASH -p tcp -j REDIRECT --to-ports 7892

sudo /sbin/iptables-save > /etc/iptables/rules.v4
sudo /sbin/ip6tables-save > /etc/iptables/rules.v6
cat /etc/iptables/rules.v4