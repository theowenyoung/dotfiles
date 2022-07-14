#!/bin/bash

if [ "$SHELL" = "/bin/zsh" ]; then
    ROOT_DIR=$( cd -- "$( dirname -- "${(%):-%N}" )"/../ &> /dev/null && pwd )
elif [ "$SHELL" = "/bin/bash" ]; then
    ROOT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"/../ &> /dev/null && pwd )
else
    echo "unknown shell"
    exit 1
fi


