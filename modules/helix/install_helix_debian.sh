#!/bin/sh

git clone https://github.com/helix-editor/helix /tmp/helix
cd /tmp/helix
cargo install --path helix-term
# copy runtime

# remove now runtime
rm -rf ~/.config/helix/runtime
cp -r $PWD/runtime ~/.config/helix/runtime