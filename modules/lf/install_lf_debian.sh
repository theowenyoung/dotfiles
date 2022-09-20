#!/bin/sh
set -e;

cd -- /tmp
wget https://github.com/gokcehan/lf/releases/download/r27/lf-linux-amd64.tar.gz

tar -xvf lf-linux-amd64.tar.gz
mv lf ~/.local/bin/lf
