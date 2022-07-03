#!/bin/sh


# https://github.com/containers/podman-compose/tree/0.1.x#versions


# install dependent


pip3 install pyyaml
pip3 install python-dotenv
curl -o ~/.local/bin/podman-compose https://raw.githubusercontent.com/containers/podman-compose/0.1.x/podman_compose.py
chmod +x ~/.local/bin/podman-compose



#pip3 install podman-compose --user