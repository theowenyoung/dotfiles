#!/bin/bash
set -e;

ENV_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/env.sh
echo $ENV_PATH
# import common env, like ROOT_DIR
source $ENV_PATH;

# install comtrya
module_path=$ROOT_DIR/modules;

script_path=$ROOT_DIR/scripts;

$module_path/comtrya/install_comtrya_binary.sh;

# import secrets
$module_path/secret/import_ssh_key.sh


# import temp envs

$module_path/secret/import_temp_env.sh


# copy ssh public key to authorized-keys
$module_path/ssh/append_ssh_pub_key_to_authorized-keys.sh


# change repo remote origin to ssh address

cd -- $ROOT_DIR
$module_path/git/git_https_to_ssh.sh


# change private repo url to ssh
cd -- $DOTFILES_PRIVATE_PATH
$module_path/git/git_https_to_ssh.sh



# run link all dotfiles

$script_path/link_all.sh
 
# thats all

# ssh-add sshkey should be manual run?
# ssh-add



echo "Please run source ~/.zshrc"
