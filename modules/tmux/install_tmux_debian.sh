#!/bin/sh
set -e;
# sudo apt install -y tmux
cd -- /tmp
if [ ! -d tmux ]; then
    git clone -b 3.3a https://github.com/tmux/tmux.git
    cd -- tmux
else
    cd -- /tmp/tmux && git checkout 3.3a
fi

# install dependence
sudo apt --yes install autotools-dev automake libevent-dev ncurses-dev build-essential bison pkg-config

sh autogen.sh
./configure
make && sudo make install
sudo mv tmux /usr/bin/tmux
