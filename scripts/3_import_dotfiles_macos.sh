#/bin/bash

set -e;

# source
source ~/.zshenv

ROOT_DIR=$DOTFILES_ROOT_PATH;

# import secrets
$ROOT_DIR/modules/secret/import_ssh_key.sh


# import temp envs

$ROOT_DIR/modules/secret/import_temp_env.sh


# change repo remote origin to ssh address

cd -- $ROOT_DIR
$ROOT_DIR/modules/git/git_https_to_ssh.sh


# change private repo url to ssh
cd -- $DOTFILES_PRIVATE_PATH
$ROOT_DIR/modules/git/git_https_to_ssh.sh



# run link all dotfiles

$ROOT_DIR/modules/comtrya/link.sh
 
ssh-add --apple-use-keychain

echo "Please run source ~/.zshrc"






