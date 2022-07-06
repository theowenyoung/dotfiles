#!/bin/sh

rm -rf /tmp/helix
git clone https://github.com/helix-editor/helix /tmp/helix
# git clone git@github.com:tdupes/helix.git /tmp/helix
cd /tmp/helix
cargo install --path helix-term
# cp runtim e
mkdir -p $HOME/.local/share/helix
rm $HOME/.local/share/helix/runtime
mv runtime $HOME/.local/share/helix/runtime
rm ~/.config/helix/runtime
ln -s $HOME/.local/share/helix/runtime ~/.config/helix/runtime