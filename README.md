# Dotfiles

Dotfiles, init scripts, etc, for now, it includes macOS, and Debian (my VPS), you shouldn't use it directly, cause it contains many personal habits, but you do can get some inspiratiions from it.


I use raw shell scripts to install apps, and [YAMLScript](https://github.com/yamlscript/yamlscript) for linking dotfiles or using template to copy template dotfile to the dest location, 
[Keepassxc](https://github.com/keepassxreboot/keepassxc) for password manager, 
[tmux](https://github.com/tmux/tmux) for window manager,
[Alacritty](https://github.com/alacritty/alacritty) for terminal,
[helix](https://github.com/helix-editor/helix) and [kakoune](https://github.com/mawww/kakoune) for modal editor.
[alfred](https://www.alfredapp.com/) for translation, calculate, launch center, workflow.
[navi](https://github.com/denisidoro/navi) for cheatsheets

## Table of Contents

- [Introduction](#introduction)
- [MacOS Init](#macos-init)
- [Debian Init](#debian-init)
- [Apps Notes](#apps-notes)

## Introduction

### Home Structure

```bash
├── blog
|── dotfiles
│   ├── private
├── inbox
├── repos
├── syncing

```

> `dotfiles` for all env related stuffs.
> `inbox` for all temp things, like temp run repos from Github.
> `repos` for all personal repos.
> `syncing` for all other settings that does not have a decent dotfiles, but still need to backup. So if I want to reflush my sytem, I need to backup this folder.


### Dotfile Structure:

```bash
├── modules
│   └── zsh
│       ├── change_zsh_as_default_shell_debian.sh
│       ├── files
│       │   ├── alias_debian.zsh
│       │   ├── general_config.zsh
│       │   ├── includes
│       │   │   ├── 3_function.zsh
│       │   │   ├── 4_aliases.zsh
│       │   │   ├── 5_fzf_keybinding.zsh
│       │   │   ├── 6_fzf_completion.zsh
│       │   │   ├── 7_git_prompt.zsh
│       │   │   └── 8_ssh_zsh_completion.zsh
│       │   ├── global.zsh
│       │   ├── path_ubuntu.zsh
│       │   └── zshrc.zsh
│       ├── install_zsh_debian.sh
│       └── zsh.yml
├── private
│   ├── keepassxc
│   │   ├── dev.kdbx
│   │   ├── high.kdbx
│   │   └── main.kdbx
│   ├── ssh
│   │   ├── files
│   │   │   ├── config
│   │   │   └── id_ed25519.pub
│   │   └── ssh.yml
└── scripts
    ├── 0_install_pre_required_modules_for_debian.sh
    ├── 0_install_pre_required_modules_for_macos.sh
    ├── 1_configure_macos.sh
    ├── 1_install_required_modules_for_debian.sh
    ├── 2_import_dotfiles_debian.sh
    ├── 2_install_required_modules_macos.sh
    ├── 3_import_dotfiles_macos.sh
    ├── 4_install_modules_macos.sh
    ├── import_ssh_key.sh
    ├── import_temp_env.sh
    ├── link.sh
    ├── test.sh
    └── unlink.sh
```

> `modules` for all apps, every app should contains an install script, and optional `files` folder, and `app.ys.yml` for [YAMLScript](https://github.com/yamlscript/yamlscript).
>
> `private` for private data, I sync it to a github private repo, inlucde keepassxc encrypted file, and other personal file.
> Though it's a individual repo, I still clone it in `dotfiles` folder, and ignore it in `.gitignore`, cause it's convenient to apply changes.
>
> `scripts` for common shell script, so ideally, I can use a few script to bootstrap my new environment. 

### Common Commands

1. `make link`: link or copy all dotfiles to the right place
2. `make unlink`: unlink all things.
3. `make backup`: backup qBittorrent.conf to dotfiles source, cause you may change the qbittorrent settings from web ui, and qBittorrent run with podman, the qBittorrent.conf file permission does not allow to link. 
4. `li`: short for `./scripts/link.sh`,but a lot convinience, for example: `li` for apply current module's dotfiles. `li all`, apply all. `li module_name`, apply module's dotfiles whatever your current work direction. 


## MacOS Init


### 0. Install xcode command line tools

```bash
xcode-select --install
```

### 1. Clone dotfiles repo and private dotfiles repo

> first we will use the git https url, then we settle sshkey down, we'll change it to ssh url. 

```bash
git clone https://github.com/theowenyoung/dotfiles.git ~/dotfiles
```

Then, clone the private repo, should get [github personal_token](https://github.com/settings/tokens) first, private will be placed in `~/dotfiles`, considered more convinient.

```bash
cd dotfiles
git clone https://theowenyoung:<token>@github.com/theowenyoung/private.git ~/dotfiles/private
```

### 2. Config macos


```bash
./modules/macos/configure_macos.sh
```


### 3. Install required apps

```bash
./scripts/2_install_required_modules_macos.sh
``` 


### 4. Import Dotfiles


```bash
./scripts/3_import_dotfiles_macos.sh
source ~/.zshrc
```


### 5. Install Other Apps You need by shell

```bash
cd ~/dotfiles
./modules/foo/install_foo_macos.sh
```

### 6. Resort pre-installed Apps

Move Terminal, Activity Monitor, Quick Time Player to the top. Move anything that Don't need to the Other Folder.

### 7. Add Input Source if needed

Settings -> Keyboard -> Input Sources

### 8. Addition settings

Settings -> Keyboard -> Shortcuts

```bash
open alacritty.app -> hyper+a
open keepassxc -> hyper+p
open mail -> hyper+m
open edge -> hyper+e
open system preferences -> hyper+s
open vscode -> hyper+v
```


## Deiban Init


ssh to the machine(force use password, consider it's a new machine):

```bash
ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no root@ip
```

### 0. Install Pre Required Modules

This should be run as root:

```bash
# sudo su - root
bash <(wget -qO- https://dotfiles.owenyoung.com/scripts/0_install_pre_required_modules_for_debian.sh)
```

> This will install keepassxc,git,zsh,curl,build-essential
> and create normal user `green` with sudo privileges.


### 2. Clone dotfiles repo and private dotfiles repo

> first we will use the git https url, then we settle sshkey down, we'll change it to ssh url. 

```bash
git clone https://github.com/theowenyoung/dotfiles.git ~/dotfiles
```

Then, clone the private repo, should get [github personal_token](https://github.com/settings/tokens) first, private will be placed in `~/dotfiles`, considered more convinient.

```bash
git clone https://theowenyoung:<token>@github.com/theowenyoung/private.git ~/dotfiles/private
```

### 3. Install required Apps


```bash
cd ~/dotfiles
# first unlink all things
./scripts/unlink.sh
./scripts/1_install_required_modules_for_debian.sh
source ~/.zshrc
```


### 4.Import dotfiles


```bash
./scripts/2_import_dotfiles_debian.sh
```

### 5. Change sshd config(only once)

```bash
INIT=true ./scripts/link.sh sshd
```



## Apps Notes

### Keepassxc

Password Manager

```zsh
# high level password
high.kdbx
# most password
main.kdbx
# dev related password, like api token, personal token.
dev.kdbx 
```


### Alfred 

Alfred config is so messed, so I make the alfred syncing folder to `~/syncing/alfred`, then mamual to set it up.

Hot Key: <cmd><space>
Disable system Hot Key: Spotlight Hot Key, in Keyboard shortcut settings.



#### Workflows

##### Manual Download

- [YoudaoTranslator](https://github.com/wensonsmith/YoudaoTranslator) - [Release](https://github.com/wensonsmith/YoudaoTranslator/releases)
- [alfred open with vscode workflow](https://github.com/alexchantastic/alfred-open-with-vscode-workflow) - trigger key: v to search

##### Shell Scripts

```bash
./modules/alfred/install_alfred_workflows.sh
```

This will install the following workflows:



### QMK

See [qmk readme](./modules/qmk/readme.md)



### Oracle Cloud Init

It sucks of oracle cloud security rules, see [question](https://stackoverflow.com/questions/54794217/opening-port-80-on-oracle-cloud-infrastructure-compute-node) to enable oracle cloud access.

You need to manual open port:

```bash
sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 80 -j ACCEPT
sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 443 -j ACCEPT
sudo netfilter-persistent save
```

## Resource

- [Ten Things I Wish I’d Known About bash](https://zwischenzugs.com/2018/01/06/ten-things-i-wish-id-known-about-bash/)
- [Osx-init](https://github.com/why-jay/osx-init)
- [dev-setup](https://github.com/donnemartin/dev-setup)
- [dotsfile](https://github.com/mathiasbynens/dotfiles/tree/master)
- [Debian Create GPG key](https://keyring.debian.org/creating-key.html)
- [Debian GPG Subkeys](https://wiki.debian.org/Subkeys?action=show&redirect=subkeys)
