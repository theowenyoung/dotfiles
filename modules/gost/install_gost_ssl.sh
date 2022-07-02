#!/bin/zsh
set -e
# import cf env
source $PRIVATE_PATH/cloudflare/.env

# import gost env

source $PRIVATE_PATH/gost/.env

$HOME/.acme.sh/acme.sh --issue --dns dns_cf -d $TEMP_GOST_HOST

# install to path

$HOME/.acme.sh/acme.sh --install-cert -d $TEMP_GOST_HOST --key-file $HOME/.config/gost/key.pem --fullchain-file $HOME/.config/gost/cert.pem