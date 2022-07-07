#/bin/sh

set -e;

ENV_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/env.sh
# import common env, like ROOT_DIR
source $ENV_PATH;

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

$ROOT_DIR/modules/comtrya/link_all.sh
 
ssh-add --apple-use-keychain

echo "Please run source ~/.zshrc"






