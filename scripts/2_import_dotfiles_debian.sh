#!/bin/bash
set -e;

ENV_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/env.sh
echo $ENV_PATH
# import common env, like ROOT_DIR
source $ENV_PATH;

# install comtrya
module_path=$ROOT_DIR/modules;

script_path=$ROOT_DIR/scripts;
private_path=$ROOT_DIR/private;

# import secrets
$script_path/import_ssh_key.sh


# import temp envs

$script_path/import_temp_env.sh


# copy ssh public key to authorized-keys

printf '%s\n' "$(cat $private_path/ssh/files/id_ed25519.pub)" >> ~/.ssh/authorized_keys

# change repo remote origin to ssh address

cd -- $ROOT_DIR
$module_path/git/git_https_to_ssh.sh


# change private repo url to ssh
cd -- $private_path
$module_path/git/git_https_to_ssh.sh



# run link all dotfiles

$script_path/link_all.sh
 
# thats all

# ssh-add sshkey should be manual run?
# ssh-add



echo "Please run source ~/.zshrc"
