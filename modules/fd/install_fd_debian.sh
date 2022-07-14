#!/bin/sh

sudo apt install --yes fd-find
rm -f ~/.local/bin/fd
ln -s $(which fdfind) ~/.local/bin/fd