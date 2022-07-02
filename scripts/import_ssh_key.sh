#!/bin/sh
mkdir -p ~/.ssh
# covert password to json
data=$(keepassxc-cli export -f csv $DOTFILES_PRIVATE_PATH/keepassxc/dev.kdbx);

#data=$(cat ~/Desktop/test.csv)

# write ssh config to ~/.ssh/config

# import ssh 
# write ssh private key to ~/.ssh/id_ed25519
TARGET="$HOME/.ssh/id_ed25519"

json=$(printf "$data" | mlr --c2j --jlistwrap cat)

printf %s "$json" | jq 'map(select(.Title=="ssh_private_key")) | .[0].Password' | xargs printf -- > $TARGET;
chmod 400 $TARGET;

echo copy to $TARGET success
