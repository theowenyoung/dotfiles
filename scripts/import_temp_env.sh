#!/bin/bash
set -e
# covert password to json
data=$(keepassxc-cli export -f csv $DOTFILES_PRIVATE_PATH/keepassxc/dev.kdbx);

#data=$(cat ~/Desktop/test.csv)
json=$(printf "$data" | mlr --c2j --jlistwrap cat)


TEMP_ENV_TARGET="$HOME/dotfiles/.temp.env";

echo start to import temp env

#printf %s $json | jq '.[0].Password'

#json='{"text":"line1 with space\nline2\nline3"}'

#text=$(printf %s $json | jq -r '.text') 

#printf "%s" "$text"


temp_str=$(printf %s "$json" | jq -r 'map(select(.Title=="temp_env")) | .[0].Notes')



printf "%s" "$temp_str"> $TEMP_ENV_TARGET;

echo "import temp env success"