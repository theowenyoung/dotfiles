#!/bin/sh
set -e
USERNAME="green"

sudo apt update & sudo apt upgrade --yes


sudo apt install --yes sudo

# create normal user
sudo adduser --disabled-password --gecos "" $USERNAME

# change normal user to sudo 

sudo usermod -aG sudo $USERNAME

echo create user $USERNAME success
echo please manual to save the root and $USERNAME password to keepassxc 




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

# su to normal user to install rust

echo we will switch to user $USERNAME
sudo su $USERNAME




# install rustup

# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path -y
# rustup default nightly

# source cargo

# source $HOME/.cargo/env

# install comtrya

bash <(curl -s https://raw.githubusercontent.com/theowenyoung/dotfiles/main/modules/comtrya/install_comtrya_binary.sh)




# change zsh as the default shell
chsh -s $(which zsh)

# change to home
cd ~

# create init zshrc

touch ~/.zshrc

# to zsh 
zsh
