#/bin/sh

if [ -z "$1" ];then
  echo you must pass redox.json filepath
  exit 1;
fi

# cp to here
#

FOLDER_PATH=$DOTFILES_ROOT_PATH/modules/qmk/files/redoxpro;

TARGET_PATH=~/inbox/qmk/keyboards/redox/keymaps;

cp $1 "$FOLDER_PATH/redoxpro.json"


qmk json2c "$FOLDER_PATH/redoxpro.json" -o "$FOLDER_PATH/keymap.c"

rm -rf $TARGET_PATH/redoxpro;

cp -r $FOLDER_PATH "$TARGET_PATH"
qmk config user.keyboard=redox/rev1
qmk config user.keymap=redoxpro

qmk compile
