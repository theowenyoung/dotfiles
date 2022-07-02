#!/bin/sh

sudo cp -f ~/.config/qBittorrent/qBittorrent/qBittorrent.conf $DOTFILES_PRIVATE_PATH/qBittorrent/files/qBittorrent.conf
sudo chown $USERNAME:$USERNAME $DOTFILES_PRIVATE_PATH/qBittorrent/files/qBittorrent.conf

echo backup success.
