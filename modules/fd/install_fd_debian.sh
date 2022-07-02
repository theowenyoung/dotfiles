#!/bin/sh

sudo apt install --yes fd-find
ln -s $(which fdfind) ~/.local/bin/fd