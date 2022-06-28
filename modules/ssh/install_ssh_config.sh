#!/bin/sh
mkdir -p ~/.ssh
# covert password to json
data=$(keepassxc-cli export -f csv ~/env/private/keepassxc/dev.kdbx);

# write ssh config to ~/.ssh/config

# import ssh 
# write git  ssh private key to ~/.ssh/git_id
TARGET_GIT="$HOME/.ssh/id_ed25519_git"
printf "$data" | mlr --c2j --jlistwrap cat | jq 'map(select(.Title=="git_ssh_private_key")) | .[0].Notes' | xargs printf > $TARGET_GIT

echo "copy to $TARGET_GIT success"