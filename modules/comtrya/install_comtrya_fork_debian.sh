#!/bin/sh
set -e;
cd -- /tmp

curl -O -L https://github.com/theowenyoung/comtrya/releases/download/untagged-01d38a3194294f8430e3/comtrya-x86_64-unknown-linux-musl


mv ./comtrya-x86_64-unknown-linux-musl ~/.local/bin/comtrya

chmod +x ~/.local/bin/comtrya


