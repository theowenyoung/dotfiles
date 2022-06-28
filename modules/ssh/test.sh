#!/bin/sh

data=$(cat ~/Desktop/test.csv)

# write ssh config to ~/.ssh/config

#printf "$data" | mlr --c2j --jlistwrap cat | jq 'map(select(.Title=="ssh_config")) | .[0].Notes' | xargs printf > ~/.ssh/config

# write git  ssh private key to ~/.ssh/git_id
TARGET_GIT="$HOME/.ssh/id_ed25519_git"
printf "$data" | mlr --c2j --jlistwrap cat | jq 'map(select(.Title=="git_ssh_private_key")) | .[0].Notes' | xargs printf > $TARGET_GIT

echo "copy to $TARGET_GIT success"