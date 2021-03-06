#!/bin/zsh
set -e


if [[ -L "$HOME/.zsh/global.zsh" ]]; then
else
  echo "~/.zsh/global.zsh not a link, will remove it and link it"
  mkdir -p ~/.zsh
  ln -s ~/dotfiles/modules/zsh/files/global.zsh ~/.zsh/global.zsh
fi

# source
source ~/.zsh/global.zsh

ROOT_DIR=$DOTFILES_ROOT_PATH;

cd -- $ROOT_DIR;

VERBOSE="-vv"

if [ "$1" = "-v"  ]; then
  VERBOSE="-vv"
fi



UNIT="$1";

echo $UNIT;
#check if .temp.env is exist
FILE="$DOTFILES_ROOT_PATH/.temp.env"
if [ -f "$FILE" ];then
# source temp env
  source $FILE
else
  echo "can not found .temp.env, do you run scripts/import_temp_env.sh first?"
  exit 1
fi
    # check if exist
if [ "$UNIT" = "all" ]
  then
    cd -- $DOTFILES_ROOT_PATH
    comtrya -vv -d modules apply
    cd -- $DOTFILES_PRIVATE_PATH
    comtrya -vv apply
else

    if [ -z "$UNIT" ]
    then
        # apply current
        comtrya -vv apply
    else

      # check if file exist
      public_file=$DOTFILES_ROOT_PATH/modules/$UNIT/$UNIT.yml
      private_file=$DOTFILES_PRIVATE_PATH/$UNIT/$UNIT.yml
      echo check $private_file if exist
      if [ -f "$private_file" ]
      then
        echo private file exist
        cd -- $DOTFILES_PRIVATE_PATH
        comtrya -vv apply -m "$UNIT.$UNIT"
      fi
      echo check $public_file if exist
      if [ -f "$public_file" ]
      then
        echo public file exist
        cd -- $DOTFILES_ROOT_PATH
        module_name="modules.$UNIT.$UNIT";
        comtrya -vv apply -m $module_name
      fi

      fi
fi





echo 'please run source ~/.zshrc'
