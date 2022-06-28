#!/bin/sh

git clone https://github.com/comtrya/comtrya.git /tmp/comtrya --depth 1
cd /tmp/comtrya
cargo build --release
mkdir -p $HOME/.local/bin
mv ./target/release/comtrya $HOME/.local/bin/comtrya 