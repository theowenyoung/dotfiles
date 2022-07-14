#!/bin/bash
set -e

# check is sudo 
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


USERNAME="green"

apt update && apt upgrade --yes

apt install --yes sudo

apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# install openssl for comtrya
apt install --yes pkg-config libssl-dev
# install git
apt install --yes git
# install zsh

apt install --yes zsh

# install keepassxc
apt install --yes build-essential

apt install --yes keepassxc

# for comtrya depend openssl 1.1
# wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1l-1ubuntu1.6_amd64.deb

# dpkg -i libssl1.1_1.1.1l-1ubuntu1.6_amd64.deb

# rm libssl1.1_1.1.1l-1ubuntu1.6_amd64.deb

# create 4000 group
groupadd -g 4000 $USERNAME
# create normal user
useradd -u 4000 -g 4000 -m -s /bin/zsh $USERNAME
# change normal user to sudo 

usermod -aG sudo $USERNAME

# add user to no password group
# https://superuser.com/posts/1027257/revisions
echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > ~/green_sudoers
visudo -c -q -f ~/green_sudoers && \
chmod 440 ~/green_sudoers && \
cp ~/green_sudoers /etc/sudoers.d/green_sudoers
rm ~/green_sudoers
# change password
passwd $USERNAME

echo create user $USERNAME success

echo please save it to keepassxc

# create .zshrc
touch /home/$USERNAME/.zshrc
chown $USERNAME:$USERNAME /home/$USERNAME/.zshrc

# su to normal user to install rust

echo we will switch to user $USERNAME
su - $USERNAME

echo now you can run the following "command" to install dotfiles

echo git clone https://github.com/theowenyoung/dotfiles.git ~/dotfiles

echo "\n"

echo git clone https://theowenyoung:<token>@github.com/theowenyoung/private.git ~/dotfiles/private
