#!/bin/sh
cd -- /tmp/
curl -O -L https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
