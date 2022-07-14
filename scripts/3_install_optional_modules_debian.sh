#!/bin/bash

# source
source ~/.zshenv

ROOT_DIR=$DOTFILES_ROOT_PATH;


module_path=$ROOT_DIR/modules;

# todo

$module_path/podman/install_podman_debian.sh
$module_path/pip3/install_pip3_debian.sh
$module_path/podman-compose/install_podman-compose.sh
$module_path/dufs/install_dufs_debian.sh
