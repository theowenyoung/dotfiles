#!/bin/sh
export PATH=./node_modules/.bin
export PATH=$PATH:$HOME/.local/bin
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/share/pnpm"
export PATH="$PATH:$HOME/.npm-packages/bin"
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin


fpath=($HOME/.zsh/functions $fpath)

