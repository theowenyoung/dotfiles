#!/bin/bash
set -e

# source
source ~/.zshenv

ROOT_DIR=$DOTFILES_ROOT_PATH;
# covert password to json
data=$(keepassxc-cli export -f csv ~/dotfiles/private/keepassxc/dev.kdbx);

#data=$(cat ~/Desktop/test.csv)
json=$(printf "$data" | mlr --c2j --jlistwrap cat)


TEMP_ENV_TARGET="$HOME/dotfiles/.temp.env";

echo start to import temp env


temp_str=$(printf %s "$json" | jq -r 'map(select(.Title=="temp_env")) | .[0].Notes')

printf "%s" "$temp_str"> $TEMP_ENV_TARGET;

echo "import temp env success"