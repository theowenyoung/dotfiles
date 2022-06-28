#!/bin/sh
USERNAME="green"
apt update & apt upgrade


apt install --yes sudo
# install git
apt install --yes git
# install zsh

apt install --yes zsh

# install keepassxc

apt install --yes keepassxc

# set zsh as the default shell

chsh -s $(which zsh)


# change root password 

passwd $(whoami)

# create normal user
adduser $USERNAME

# change normal user to sudo 

usermod -aG sudo $USERNAME

echo create user $USERNAME success, now we will switch to user $USERNAME
echo please manual to save the root and $USERNAME password to keepassxc 


su $USERNAME


# change zsh as the default shell
chsh -s $(which zsh)

# change to home
cd ~
