#!/bin/sh

git clone https://github.com/helix-editor/helix /tmp/helix
cd /tmp/helix
cargo install --path helix-term
