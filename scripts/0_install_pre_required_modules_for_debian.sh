#!/bin/sh
set -e
USERNAME="green"

sudo apt update & sudo apt upgrade --yes


sudo apt install --yes sudo

# install openssl for comtrya
sudo apt install --yes pkg-config libssl-dev
# install git
sudo apt install --yes git
# install zsh

sudo apt install --yes zsh

sudo apt install --yes curl
# install keepassxc
sudo apt install --yes build-essential

sudo apt install --yes keepassxc

# create 4000 group
sudo groupadd -g 4000 $USERNAME
# create normal user
sudo useradd -u 4000 -g 4000 -m -s /bin/zsh $USERNAME
# change normal user to sudo 

sudo usermod -aG sudo $USERNAME

# add user to no password group
# https://superuser.com/posts/1027257/revisions
echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > ~/green_sudoers
sudo visudo -c -q -f /home/$(whoami)/green_sudoers && \
sudo chmod 440 /home/$(whoami)/green_sudoers && \
sudo cp /home/$(whoami)/green_sudoers /etc/sudoers.d/green_sudoers
sudo rm /home/$(whoami)/green_sudoers

echo create user $USERNAME success

# create .zshrc
sudo touch /home/$USERNAME/.zshrc
sudo chown $USERNAME:$USERNAME /home/$USERNAME/.zshrc

# su to normal user to install rust

echo we will switch to user $USERNAME
sudo su - $USERNAME

echo now you can run the following "command" to install dotfiles

echo git clone https://github.com/theowenyoung/dotfiles.git ~/dotfiles

echo "\n"

echo git clone https://theowenyoung:<token>@github.com/theowenyoung/private.git ~/dotfiles/private