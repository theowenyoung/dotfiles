#!/bin/sh
set -ex;
# check is linux, only linux
if [ "$OSTYPE" != "linux-gnu" ]; then
  echo "This script only support linux"
  exit 1
fi

# check hostname
if [ "$HOSTNAME" = "greencloud1" ]; then
  sudo ln -sf $DOTFILES_PRIVATE_PATH/caddy/files/Caddyfile.txt /etc/opt/caddy/Caddyfile  
fi

# check host  is jp3

if [ "$HOSTNAME" = "jp3" ]; then
  sudo ln -sf $DOTFILES_PRIVATE_PATH/caddy/files/Caddyfile-for-jp3.txt /etc/opt/caddy/Caddyfile  
fi

# check is debianlocal
if [ "$HOSTNAME" = "debianlocal" ]; then
  sudo ln -sf $DOTFILES_PRIVATE_PATH/caddy/files/Caddyfile-for-debianlocal.txt /etc/opt/caddy/Caddyfile  
fi

# link file-template.html
sudo ln -sf $DOTFILES_PRIVATE_PATH/caddy/files/file-template.html /etc/opt/caddy/file-template.html


# cp caddy service

sudo cp $DOTFILES_ROOT_PATH/caddy/files/caddy.service /etc/systemd/system/caddy.service

# cp copy robots.txt

cp $DOTFILES_ROOT_PATH/root/caddy/files/disallow_robots.txt ~/data/robots.txt


# restart caddy service
sudo $DOTFILES_ROOT_PATH/modules/systemd/restart_root_service.sh caddy



