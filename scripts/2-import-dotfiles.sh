#!/bin/sh

ENV_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/env.sh

# import common env, like ROOT_DIR
source $ENV_PATH;

# import ssh private key
$ROOT_DIR/modules/ssh/import_ssh_private_key.sh

# import all dotfiles
cd $ROOT_DIR;
comtrya -d dotfiles apply

# import all private dotfiles
comtrya -d private apply


# change repo remote origin to ssh address

$ROOT_DIR/modules/git/git_https_to_ssh.sh


# change private repo url to ssh

cd $ROOT_DIR/$PRIVATE_REPO_NAME
$ROOT_DIR/modules/git/git_https_to_ssh.sh


cd $ROOT_DIR
# ssh-add sshkey

ssh-add


# link private/comtrya.yaml to root dir
ln -s ./private/Comtrya.yaml ./Comtrya.yaml

echo "Please run source ~/.zshrc"