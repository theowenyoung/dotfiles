# Dotfiles

Dotfiles, init scripts, etc, for now, it includes macOS, and Debian (my VPS), you shouldn't use it directly, cause it contains many personal habits, but you do can get some inspiratiions from it.

> It still work in process


## Structure Stree

 TODO


## Common Commands

1. `make link`: link or copy all dotfiles to the right place
2. `make unlink`: unlink all things.
3. `make backup`: backup qBittorrent.conf to dotfiles source, cause you may change the qbittorrent settings from web ui 

## MacOS


### 0. Resort pre-installed Apps

Move Terminal, Activity Monitor, Quick Time Player to the top. Move anything that Don't need to the Other Folder.

### 1. Add Input Source if needed

Settings -> Keyboard -> Input Sources


### Alfred 

Alfred config is so mess, so I make the alfred syncing folder to `~/syncing/alfred`, then mamual to set it up.

#### Workflows

- [YoudaoTranslator](https://github.com/wensonsmith/YoudaoTranslator) - [Release](https://github.com/wensonsmith/YoudaoTranslator/releases)

## Terminal


## Apps


## Keepassxc

```bash
high.kdbx
main.kdbx
server.kdbx
inbox.kdbx  
````

## Deiban

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



## Setup


### QMK

See [qmk readme](./modules/qmk/readme.md)

## Resource

- [Ten Things I Wish I’d Known About bash](https://zwischenzugs.com/2018/01/06/ten-things-i-wish-id-known-about-bash/)
- [Osx-init](https://github.com/why-jay/osx-init)
- [dev-setup](https://github.com/donnemartin/dev-setup)
- [dotsfile](https://github.com/mathiasbynens/dotfiles/tree/master)
- [vim tips](https://docs.oracle.com/cd/E19253-01/806-7612/editorvi-43/index.html)
- [vim online course](https://www.vim.so)
- [vim advance](https://thevaluable.dev/vim-advanced/)
- [vim after 15 years](https://statico.github.io/vim3.html)
- [vim plug](https://github.com/junegunn/vim-plug)
- [vim-visual-multi](https://github.com/mg979/vim-visual-multi)

## GPG


- [Debian Create GPG key](https://keyring.debian.org/creating-key.html)
- [Debian GPG Subkeys](https://wiki.debian.org/Subkeys?action=show&redirect=subkeys)
