#!/bin/zsh
set -e;

ENV_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/env.sh
echo $ENV_PATH
# import common env, like ROOT_DIR
source $ENV_PATH;

cd -- ~/dotfiles

VERBOSE="-vv"

if [ "$1" = "-v"  ]; then
  VERBOSE="-vv"
fi


# first source the important env
source $ROOT_DIR/modules/zsh/files/includes/1_env.zsh

cd -- $ROOT_DIR/modules
# first, always run zsh first, cause zsh has some global env that could be dependent by other scripts.
~/.local/bin/comtrya $VERBOSE apply -m zsh.zsh

# source it, other task may dependent it 
source ~/.zshrc


#check if .temp.env is exist
FILE="$ROOT_DIR/.temp.env"
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


cd -- $ROOT_DIR/modules

~/.local/bin/comtrya $VERBOSE apply

echo 'please run source ~/.zshrc'