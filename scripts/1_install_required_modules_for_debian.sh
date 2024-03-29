#!/bin/bash
set -e;

# source
source ~/.zsh/global.zsh

ROOT_DIR=$DOTFILES_ROOT_PATH;

mkdir -p ~/.local/bin;

module_path=$ROOT_DIR/modules;

# $module_path/comtrya/install_comtrya_fork_debian.sh;

$module_path/jq/install_jq_debian.sh

$module_path/miller/install_miller_debian.sh

$module_path/navi/install_navi.sh

$module_path/fd/install_fd_debian.sh

$module_path/fzf/install_fzf_debian.sh

$module_path/acme/install_acme.sh

$module_path/bat/install_bat_debian.sh

$module_path/tmux/install_tmux_debian.sh

$module_path/editorconfig/install_editorconfig_debian.sh

$module_path/xclip/install_xclip_debian.sh

$module_path/kakoune/install_kakoune_debian_binary.sh

$module_path/caddy/install_caddy_debian.sh

$module_path/iptables-persistent/install-iptables-persistent_debian.sh

$module_path/deno/install_deno.sh

# stay user systemd even exit settion

$module_path/systemd/stay_user_systemd_service.sh

# install yamlscript
~/.deno/bin/deno install -A https://deno.land/x/yamlscript/ys.ts