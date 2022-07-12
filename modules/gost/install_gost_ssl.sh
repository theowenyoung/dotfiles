#!/bin/zsh
set -e
# import  env
source $DOTFILES_ROOT_PATH/modules/gost/.env


$HOME/.acme.sh/acme.sh --issue --dns dns_cf -d $TEMP_GOST_HOST

# install to path

$HOME/.acme.sh/acme.sh --install-cert -d $TEMP_GOST_HOST --key-file $HOME/.config/gost/key.pem --fullchain-file $HOME/.config/gost/cert.pem