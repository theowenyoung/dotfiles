# OS

All my OS config

- [Mac](./mac.md)

## Mac


### 0. Resort pre-installed Apps

Move Terminal, Activity Monitor, Quick Time Player to the top. Move anything that Don't need to the Other Folder.

### 1. Add Input Source if needed

Settings -> Keyboard -> Input Sources


### Alfred 

Open alfred -> settings -> choose `~/env/private/alfred` as the setting store.


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

```bash
ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no root@ip
```

### 0. Install Pre Required Modules

```bash
bash <(wget -qO- https://raw.githubusercontent.com/theowenyoung/env/main
/scripts/0-install-pre-required-modules-for-debian.sh

source ~/.cargo/env
```

> This will install keepassxc,git


### 1. Give normal user NO-PASSWORD permission

```bash
sudo visudo
``` 

```bash
green ALL=(ALL) NOPASSWD:ALL
```


### 2. Clone private repo

> get [github personal_token](https://github.com/settings/tokens) first 

```bash
git clone https://theowenyoung:<token>@github.com/theowenyoung/private.git ~/env/private
```



### 3. Link and Copy dotfiles


```bash
cd ~/env
make link
```

### 3. Install Apps


```bash
cd ~/env
make install-apps-for-debian  
```



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
