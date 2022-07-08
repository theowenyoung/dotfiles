#/bin/sh

curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
sudo apt -y install nodejs
wget -qO- https://get.pnpm.io/install.sh | sh -