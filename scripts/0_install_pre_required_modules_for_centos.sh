#!/bin/sh
USERNAME="green"

yum update --yes


# yum install --yes sudo

# change root password 

passwd $(whoami)

# create normal user
adduser $USERNAME

# change normal user to sudo 

usermod -aG sudo $USERNAME

echo create user $USERNAME success
echo please manual to save the root and $USERNAME password to keepassxc 




# install openssl for comtrya
yum install --yes pkg-config libssl-dev
# install git
yum install --yes git
# install zsh

yum install --yes zsh

yum install --yes curl
# install keepassxc
yum install --yes build-essential

yum install --yes keepassxc

# su to normal user to install rust

echo we will switch to user $USERNAME
su $USERNAME

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
