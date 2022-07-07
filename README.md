# Dotfiles

Dotfiles, init scripts, etc, for now, it includes macOS, and Debian (my VPS), you shouldn't use it directly, cause it contains many personal habits, but you do can get some inspiratiions from it.


I use raw shell scripts to install apps, and [Comtrya](https://github.com/comtrya/comtrya) for linking dotfiles or using template to copy template dotfile to the dest location, 
[Keepassxc](https://github.com/keepassxreboot/keepassxc) for password manager, 
[tmux](https://github.com/tmux/tmux) for window manager,
[Alacritty](https://github.com/alacritty/alacritty) for terminal,
[helix](https://github.com/helix-editor/helix) for modal editor.
[alfred](https://www.alfredapp.com/) for translation, calculate, launch center, workflow.


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
│       │   │   ├── 1_env.zsh
│       │   │   ├── 2_path.zsh
│       │   │   ├── 3_function.zsh
│       │   │   ├── 4_aliases.zsh
│       │   │   ├── 5_fzf_keybinding.zsh
│       │   │   ├── 6_fzf_completion.zsh
│       │   │   ├── 7_git_prompt.zsh
│       │   │   └── 8_ssh_zsh_completion.zsh
│       │   ├── path_macos.zsh
│       │   ├── zshenv.zsh
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
    ├── env.sh
    ├── import_ssh_key.sh
    ├── import_temp_env.sh
    ├── link_all.sh
    ├── test.sh
    └── unlink.sh
```

> `modules` for all apps, every app should contains an install script, and optional `files` folder, and `app.yml` for [Comtrya](https://github.com/comtrya/comtrya).
>
> `private` for private data, I sync it to a github private repo, inlucde keepassxc encrypted file, and other personal file.
> Though it's a individual repo, I still clone it in `dotfiles` folder, and ignore it in `.gitignore`, cause it's convenient to apply changes.
>
> `scripts` for common shell script, so ideally, I can use a few script to bootstrap my new environment. 

### Common Commands

1. `make link`: link or copy all dotfiles to the right place
2. `make unlink`: unlink all things.
3. `make backup`: backup qBittorrent.conf to dotfiles source, cause you may change the qbittorrent settings from web ui, and qBittorrent run with podman, the qBittorrent.conf file permission does not allow to link. 
4. `ca`: short for `comtrya apply`,but a lot convinience, for example: `ca` for apply current module's dotfiles. `ca all`, apply all. `ca module_name`, apply module's dotfiles whatever your current work direction. 


## MacOS Init

<details>
<summary>Details</summary>



### 0. Clone dotfiles repo and private dotfiles repo

> first we will use the git https url, then we settle sshkey down, we'll change it to ssh url. 

```bash
git clone https://github.com/theowenyoung/dotfiles.git ~/dotfiles
```

Then, clone the private repo, should get [github personal_token](https://github.com/settings/tokens) first, private will be placed in `~/dotfiles`, considered more convinient.

```bash
git clone https://theowenyoung:<token>@github.com/theowenyoung/private.git ~/dotfiles/private
```

### 1. Install pre-required modules

```bash
./scripts/0_install_pre_required_modules_for_macos.sh
```

### 2. Config macos


```bash
./scripts/1_configure_macos.sh
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


### 4. Install Apps


```bash
cd ~/dotfiles
./scripts/1_install_modules_macos.sh
```



### 5. Resort pre-installed Apps

Move Terminal, Activity Monitor, Quick Time Player to the top. Move anything that Don't need to the Other Folder.

### 6. Add Input Source if needed

Settings -> Keyboard -> Input Sources


</details>




## Deiban


<details>

<summary>Details</summary>

ssh to the machine(force use password, consider it's a new machine):

```bash
ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no root@ip
```

### 0. Install Pre Required Modules

```bash
bash <(wget -qO- https://raw.githubusercontent.com/theowenyoung/dotfiles/main/scripts/0-install-pre-required-modules-for-debian.sh
```

> This will install keepassxc,git,zsh,curl,build-essential,rust,cargo,comtrya
> and create normal user `green`



Now you should be in zsh 

### 1. Optional: Give normal user NO-PASSWORD permission (so run sudo won't need password)

```bash
sudo visudo
``` 

```bash
green ALL=(ALL) NOPASSWD:ALL
```



### 2. Clone dotfiles repo and private dotfiles repo

> first we will use the git https url, then we settle sshkey down, we'll change it to ssh url. 

```bash
git clone https://github.com/theowenyoung/dotfiles.git ~/dotfiles
```

Then, clone the private repo, should get [github personal_token](https://github.com/settings/tokens) first, private will be placed in `~/dotfiles`, considered more convinient.

```bash
git clone https://theowenyoung:<token>@github.com/theowenyoung/private.git ~/dotfiles/private
```

### 3. Install Apps


```bash
cd ~/dotfiles
./scripts/1_install_modules_for_debian.sh
```


### 4. Link and Copy dotfiles to the right places


```bash
cd ~/dotfiles
make link
source ~/.zshrc
```

</details>



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

<details>
<summary>Settings</summary>

Hot Key: <cmd><space>
Disable system Hot Key: Spotlight Hot Key, in Keyboard shortcut settings.

</details>


### QMK

See [qmk readme](./modules/qmk/readme.md)

#### Workflows

- [YoudaoTranslator](https://github.com/wensonsmith/YoudaoTranslator) - [Release](https://github.com/wensonsmith/YoudaoTranslator/releases)




## Resource

- [Ten Things I Wish I’d Known About bash](https://zwischenzugs.com/2018/01/06/ten-things-i-wish-id-known-about-bash/)
- [Osx-init](https://github.com/why-jay/osx-init)
- [dev-setup](https://github.com/donnemartin/dev-setup)
- [dotsfile](https://github.com/mathiasbynens/dotfiles/tree/master)
- [Debian Create GPG key](https://keyring.debian.org/creating-key.html)
- [Debian GPG Subkeys](https://wiki.debian.org/Subkeys?action=show&redirect=subkeys)
