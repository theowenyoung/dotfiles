#!/bin/zsh
set -e;
echo ${(%):-%N};
ENV_PATH=$( cd -- "$( dirname -- "${(%):-%N}" )" &> /dev/null && pwd )/env.sh
echo $ENV_PATH
source $ENV_PATH;
echo $ROOT_DIR