#!/bin/sh
ENV_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/env.sh

# import common env, like ROOT_DIR
source $ENV_PATH;


local module_path=$ENV_PATH/modules;

$module_path/helix/install_helix_debian.sh

$module_path/jq/install_jq_debian.sh

$module_path/shadowsocks-rust/install_shadowsocks-rust.sh
