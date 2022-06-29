#!/bin/sh
USERNAME="green"

apt update & apt upgrade


apt install --yes sudo

# change root password 

passwd $(whoami)

# create normal user
adduser $USERNAME

# change normal user to sudo 

usermod -aG sudo $USERNAME

echo create user $USERNAME success
echo please manual to save the root and $USERNAME password to keepassxc 




# install openssl for comtrya
apt install --yes pkg-config libssl-dev
# install git
apt install --yes git
# install zsh

apt install --yes zsh

apt install --yes curl
# install keepassxc
apt install --yes build-essential

apt install --yes keepassxc


# set zsh as the default shell

chsh -s $(which zsh)


# su to normal user to install rust

echo we will switch to user $USERNAME
su $USERNAME

# install rustup

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path -y
rustup default nightly

# source cargo

source $HOME/.cargo/env

# install comtrya

bash <(curl -s https://raw.githubusercontent.com/theowenyoung/env/main/modules/comtrya/install_comtrya.sh)


ln -s $HOME/env/private/Comtrya.yaml $HOME/env/Comtrya.yaml


# change zsh as the default shell
chsh -s $(which zsh)

# change to home
cd ~
