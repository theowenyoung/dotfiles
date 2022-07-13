#!/bin/sh
USERNAME="green"

sudo yum -y -y update


# yum -y install sudo

# change root password 

# sudo passwd $(whoami)

# create normal user
sudo adduser $USERNAME

# change normal user to sudo 

sudo usermod -aG sudo $USERNAME

echo create user $USERNAME success
echo please manual to save the root and $USERNAME password to keepassxc 




# install openssl for comtrya
sudo yum -y install pkg-config libssl-dev
# install git
sudo yum -y install git
# install zsh

sudo yum -y install zsh

sudo yum -y install curl
# install keepassxc
sudo yum -y install build-essential

sudo yum -y install keepassxc

# su to normal user to install rust

sudo echo we will switch to user $USERNAME
sudo su $USERNAME

# install rustup

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path -y
rustup default nightly

# source cargo

source $HOME/.cargo/env

# install comtrya

bash <(curl -s https://raw.githubusercontent.com/theowenyoung/dotfiles/main/modules/comtrya/install_comtrya.sh)




# change zsh as the default shell
chsh -s $(which zsh)

# change to home
cd ~

# create init zshrc

touch ~/.zshrc

# to zsh 
zsh
