#!/bin/sh

$HOME/.acme.sh/acme.sh --issue --dns dns_cf -d $GOST_HOST

# install to path

$HOME/.acme.sh/acme.sh -install-cert -d $GOST_HOST \
--key-file       $HOME/.config/gost/key.pem  \
--fullchain-file $HOME/.config/gost/cert.pem