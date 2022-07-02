#!/bin/bash

sudo apt-get -y install podman

# install latest version from kubic
# https://computingforgeeks.com/how-to-install-podman-on-debian/
# Using Kubic libcontainers repository
# sudo apt install wget lsb-release -y

# source  /etc/os-release

# cat /etc/os-release
# wget https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/Debian_$VERSION_ID/Release.key
# cat Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/libcontainers.gpg  >/dev/null

# # Add Kubic libcontainers repository to your Debian system.
# echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/Debian_$VERSION_ID/ /" | sudo tee /etc/apt/sources.list.d/libcontainers.list

# sudo apt update -y

# sudo apt -y full-upgrade
# [ -f /var/run/reboot-required ] && sudo reboot -f
# sudo apt install --yes  podman
# sudo apt --fix-broken install -y
# podman version



# source  /etc/os-release
# wget http://downloadcontent.opensuse.org/repositories/home:/alvistack/Debian_$VERSION_ID/Release.key -O alvistack_key
# cat alvistack_key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/alvistack.gpg  >/dev/null
# echo "deb http://downloadcontent.opensuse.org/repositories/home:/alvistack/Debian_$VERSION_ID/ /" | sudo tee  /etc/apt/sources.list.d/alvistack.list
# sudo apt update -y
# sudo apt install -y podman
# podman version