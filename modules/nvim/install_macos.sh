#!/bin/sh
sudo port selfupdate
sudo port -N install neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim  /opt/local/share/nvim/site/pack/packer/start/packer.nvim
sudo port install fzf
sudo port install ripgrep
sudo port -N install ctags
