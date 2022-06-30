#!/bin/bash

ENV_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/env.sh
echo $ENV_PATH
# import common env, like ROOT_DIR
source $ENV_PATH;

# import secrets
$ROOT_DIR/modules/secret/import_secret.sh


# copy ssh public key to authorized-keys
$ROOT_DIR/modules/ssh/append_ssh_pub_key_to_authorized-keys.sh

# import all dotfiles
cd $ROOT_DIR;
$HOME/.local/bin/comtrya -d dotfiles apply

# import all private dotfiles
$HOME/.local/bin/comtrya -d private apply

# source .zshrc
source ~/.zshrc


# change repo remote origin to ssh address
$ROOT_DIR/modules/git/git_https_to_ssh.sh


# change private repo url to ssh
cd $ROOT_DIR/$PRIVATE_REPO_NAME
$ROOT_DIR/modules/git/git_https_to_ssh.sh

# back to root dir
cd $ROOT_DIR


# thats all

# ssh-add sshkey should be manual run?
# ssh-add


#link private/comtrya.yaml to root dir, do not need now
# ln -s ./private/Comtrya.yaml ./Comtrya.yaml



echo "Please run source ~/.zshrc"
