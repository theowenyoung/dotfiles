#!/bin/bash

ENV_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/env.sh
echo $ENV_PATH
# import common env, like ROOT_DIR
source $ENV_PATH;

# import ssh private key
$ROOT_DIR/modules/ssh/import_ssh_private_key.sh

# copy ssh public key to authorized-keys

$ROOT_DIR/modules/ssh/append_ssh_pub_key_to_authorized-keys.sh

# import all dotfiles
cd $ROOT_DIR;
comtrya -d dotfiles apply

# import all private dotfiles
comtrya -d private apply

source ~/.zshrc
# change repo remote origin to ssh address

$ROOT_DIR/modules/git/git_https_to_ssh.sh


# change private repo url to ssh

cd $ROOT_DIR/$PRIVATE_REPO_NAME
$ROOT_DIR/modules/git/git_https_to_ssh.sh


cd $ROOT_DIR

# ssh-add sshkey should be manual run?
# ssh-add


#link private/comtrya.yaml to root dir, do not need now
# ln -s ./private/Comtrya.yaml ./Comtrya.yaml


# run acem.sh


$HOME/.acme.sh/acme.sh --issue --dns dns_cf -d $GOST_HOST


echo "Please run source ~/.zshrc"
