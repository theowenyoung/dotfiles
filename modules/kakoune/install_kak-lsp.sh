#!/bin/sh

git clone https://github.com/kak-lsp/kak-lsp /tmp/kak-lsp
cd /tmp/kak-lsp

# this installs the kak-lsp binary to ~/.cargo/bin, which must be in your `$PATH`
cargo install --locked --force --path .

# clean
#
rm -rf /tmp/kak-lsp
