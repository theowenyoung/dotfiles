#!/bin/sh
USERNAME="green"
sudo apt update & sudo apt upgrade

# install git
sudo apt install --yes git
# install zsh

sudo apt install --yes zsh

# install keepassxc

sudo apt install --yes keepassxc

# set zsh as the default shell

chsh -s $(which zsh)


# change root password 

sudo passwd $(whoami)

# create normal user
sudo adduser $USERNAME

# change normal user to sudo 

sudo usermod -aG sudo $USERNAME

echo create user $USERNAME success, now we will switch to user $USERNAME

sudo su $USERNAME


# change zsh as the default shell
chsh -s $(which zsh)