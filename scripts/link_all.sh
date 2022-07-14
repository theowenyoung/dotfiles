#!/bin/zsh

set -e;

cd -- ~/dotfiles

VERBOSE="-vv"

if [ "$1" = "-v"  ]; then
  VERBOSE="-vv"
fi


# first source the important env
source ./modules/zsh/files/includes/1_env.zsh

# first, always run zsh first, cause zsh has some global env that could be dependent by other scripts.
~/.local/bin/comtrya $VERBOSE -d modules apply -m zsh.zsh

# source it, other task may dependent it 
source ~/.zshrc


#check if .temp.env is exist
FILE="./.temp.env"
if [ -f "$FILE" ];then
# source temp env
  source $FILE
else
  echo "can not found .temp.env, do you run scripts/import_temp_env.sh first?"
  exit 1
fi

# run private first
cd -- $ROOT_DIR/private
~/.local/bin/comtrya $VERBOSE apply

# ensure new zshenv

source ~/.zshrc
source $FILE


cd -- $ROOT_DIR

~/.local/bin/comtrya $VERBOSE apply

echo 'please run source ~/.zshrc'