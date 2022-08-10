#!/bin/bash
set -e
suInitCommand="set -e;echo start init ";
# check is sudo 
if [ "$EUID" -ne 0 ]; then
  # echo "Please run as root"
  # check is there is sudo command
  if [ -x "$(command -v sudo)" ]; then
    echo "sudo command is available"
  else
    echo "sudo command is not available, we will use root to install it"
    suInitCommand+="apt install --yes sudo"
  fi
  
fi


USERNAME="green"

# check flags --create , is need to create user
if [ "$1" = "--create" ]; then
  echo "create user $USERNAME"
  # create 4000 group
  suInitCommand+="&& /sbin/groupadd -g 4000 $USERNAME \
&& /sbin/useradd -u 4000 -g 4000 -m -s /bin/zsh $USERNAME \
&& echo create user $USERNAME success, please set a password \
&& passwd $USERNAME \
&& echo please save it to keepassxc";
  
fi

# change normal user to sudo 

# add user to no password group
# https://superuser.com/posts/1027257/revisions
echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /tmp/green_sudoers
suInitCommand+="&& /sbin/usermod -aG sudo $USERNAME \
&& visudo -c -q -f /tmp/green_sudoers \
&& chmod 440 /tmp/green_sudoers \
&& cp /tmp/green_sudoers /etc/sudoers.d/green_sudoers && rm -f /tmp/green_sudoers"
echo "we will use root to run some initial command"
# echo "$suInitCommand"
# exit;
su - root -c "$suInitCommand"


echo "add user to sudo group"


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



# create .zshrc
touch /home/$USERNAME/.zshrc
sudo chown $USERNAME:$USERNAME /home/$USERNAME/.zshrc

# change user default shell to zsh
sudo usermod --shell /bin/zsh $USERNAME

# give user systemd service privilege

sudo loginctl enable-linger $USERNAME

# su to normal user to install rust

echo we will switch to user $USERNAME
echo you should run the following "command" to install dotfiles

echo git clone https://github.com/theowenyoung/dotfiles.git ~/dotfiles

echo "\n"

echo git clone https://theowenyoung:<token>@github.com/theowenyoung/private.git ~/dotfiles/private
su - $USERNAME -s "/bin/zsh"


