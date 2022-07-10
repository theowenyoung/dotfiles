#!/bin/bash

ENV_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/env.sh

# import common env, like ROOT_DIR
source $ENV_PATH;


module_path=$ROOT_DIR/modules;

$module_path/macos/install_package_managers_macos.sh

$module_path/keepassxc/install_keepassxc_macos.sh

$module_path/alacritty/install_alacritty_macos.sh


$module_path/helix/install_helix.sh

$module_path/jq/install_jq_macos.sh

$module_path/miller/install_miller_macos.sh


$module_path/fd/install_fd_macos.sh

$module_path/fzf/install_fzf_macos.sh


$module_path/bat/install_bat_macos.sh

$module_path/navi/install_navi.sh
