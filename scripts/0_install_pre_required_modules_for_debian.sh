#!/bin/bash
set -e

# check is sudo 
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi




# check is there is sudo command
if [ -x "$(command -v sudo)" ]; then
  echo "sudo command is available"
else
  apt install --yes sudo
fi

sudo apt update && sudo apt upgrade --yes


sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# install openssl for comtrya
sudo apt install --yes pkg-config libssl-dev
# install git
sudo apt install --yes git
# install zsh

sudo apt install --yes zsh

sudo apt install --yes unzip

# install keepassxc
sudo apt install --yes build-essential

sudo apt install --yes keepassxc
USERNAME="green"

# check flags --create , is need to create user
if [ "$1" = "--create" ]; then
  echo "create user $USERNAME"
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

  # give user systemd service privilege

  loginctl enable-linger $USERNAME

  # su to normal user to install rust

  echo we will switch to user $USERNAME
  su - $USERNAME
fi



  echo now you can run the following "command" to install dotfiles

  echo git clone https://github.com/theowenyoung/dotfiles.git ~/dotfiles

  echo "\n"

  echo git clone https://theowenyoung:<token>@github.com/theowenyoung/private.git ~/dotfiles/private