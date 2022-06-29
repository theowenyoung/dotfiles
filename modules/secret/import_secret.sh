#!/bin/sh
mkdir -p ~/.ssh
# covert password to json
#data=$(keepassxc-cli export -f csv ~/env/private/keepassxc/dev.kdbx);

data=$(cat ~/Desktop/test.csv)

# write ssh config to ~/.ssh/config

# import ssh 
# write ssh private key to ~/.ssh/id_ed25519
TARGET="$HOME/.ssh/id_ed25519"

json=$(printf "$data" | mlr --c2j --jlistwrap cat)

printf %s "$json" | jq 'map(select(.Title=="ssh_private_key")) | .[0].Password' | xargs printf -- > $TARGET;
chmod 400 $TARGET;

echo copy to $TARGET success

ENV_TARGET="$HOME/.zsh/extra/auto_env.zsh";

echo start copy cf_key

#printf %s $json | jq '.[0].Password'
cf_key=$(printf %s $json | jq 'map(select(.Title=="cloudflare_CF_Key")) | .[0].Password')

 
echo "export CF_Key=$cf_key" >> $ENV_TARGET;

echo "copy cf_key success"