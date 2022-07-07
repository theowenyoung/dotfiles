#!/bin/bash

ENV_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/env.sh

# import common env, like ROOT_DIR
source $ENV_PATH;


module_path=$ROOT_DIR/modules;

$module_path/helix/install_helix_debian.sh

$module_path/jq/install_jq_debian.sh

$module_path/miller/install_miller_debian.sh

$module_path/shadowsocks-rust/install_shadowsocks-rust.sh

$module_path/zellij/install_zellij.sh

$module_path/fd/install_fd_debian.sh

$module_path/fzf/install_fzf_debian.sh

$module_path/acme/install_acme.sh

$module_path/bat/install_bat_debian.sh

$module_path/podman/install_podman_debian.sh

$module_path/pip3/install_pip3_debian.sh

$module_path/podman-compose/install_podman-compose.sh

$module_path/dufs/install_dufs_debian.sh