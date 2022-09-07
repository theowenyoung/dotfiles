#!/bin/sh

# check if /tmp/kak-lsp exist
if [ -d /tmp/kak-lsp ]; then
  git pull
else 
  git clone https://github.com/kak-lsp/kak-lsp /tmp/kak-lsp
fi

cd /tmp/kak-lsp

# this installs the kak-lsp binary to ~/.cargo/bin, which must be in your `$PATH`
cargo install --locked --force --path .

# clean
#
rm -rf /tmp/kak-lsp
