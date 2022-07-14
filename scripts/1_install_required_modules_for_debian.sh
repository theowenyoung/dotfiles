#!/bin/bash
set -e;

ENV_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/env.sh

# import common env, like ROOT_DIR
source $ENV_PATH;

mkdir -p ~/.local/bin;

module_path=$ROOT_DIR/modules;

$module_path/comtrya/install_comtrya_binary.sh;

$module_path/jq/install_jq_debian.sh

$module_path/miller/install_miller_debian.sh

$module_path/navi/install_navi.sh

$module_path/fd/install_fd_debian.sh

$module_path/fzf/install_fzf_debian.sh

$module_path/acme/install_acme.sh

$module_path/bat/install_bat_debian.sh

$module_path/tmux/install_tmux_debian.sh
