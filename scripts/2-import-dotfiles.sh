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