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
sudo groupadd -g 4000 green
# create normal user
sudo useradd -u 4000 -g 4000 -m -s /bin/zsh $USERNAME
# change normal user to sudo 

sudo usermod -aG sudo $USERNAME

# add user to no password group

echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > ~/green_sudoers
sudo visudo -c -q -f /home/$(whoami)/green_sudoers && \
sudo chmod 440 /home/$(whoami)/green_sudoers && \
sudo cp /home/$(whoami)/green_sudoers /etc/sudoers.d/green_sudoers
sudo rm /home/$(whoami)/green_sudoers

echo create user $USERNAME success
echo please manual to save the root and $USERNAME password to keepassxc 





# create .zshrc
sudo touch /home/$USERNAME/.zshrc
sudo chown $USERNAME:$USERNAME /home/$USERNAME/.zshrc

# su to normal user to install rust

echo we will switch to user $USERNAME
sudo su $USERNAME

cd ~

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


# to zsh 
#zsh
