#!/bin/bash

ENV_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/env.sh

# import common env, like ROOT_DIR
source $ENV_PATH;


module_path=$ROOT_DIR/modules;

$module_path/helix/install_helix_debian.sh

$module_path/jq/install_jq_debian.sh

$module_path/miller/install_miller_debian.sh

$module_path/shadowsocks-rust/install_shadowsocks-rust.sh

$module_path/fd/install_debian.sh

$module_path/fzf/install_fzf_debian.sh

eval $(ssh-agent)
