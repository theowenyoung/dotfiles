#!/bin/sh

cat $DOTFILES_PRIVATE_PATH/ssh/files/id_ed25519.pub >> ~/.ssh/authorized_keys
