#/bin/bash

rm -rf ~/.zsh
rm ~/.zshrc
rm -f ~/.zshenv
rm ~/.tmux.conf
rm ~/.curlrc
rm ~/.gitignore
rm ~/.gitconfig
rm ~/.editorconfig
rm -rf ~/.tmux
rm -rf ~/.ssh/config
rm ~/.ssh/id_ed25519.pub
rm ~/.config/clash/config.yaml
rm -rf ~/.config/nvim
rm -rf ~/.config/helix/config.toml
rm -rf ~/.config/alacritty
rm -rf ~/.config/zellij
rm -rf ~/.config/kak/colors
rm -rf ~/.config/kak/includes/
rm -rf ~/.config/kak/kakrc
rm -rf ~/.config/wezterm
rm -rf ~/.config/systemd
rm -rf ~/.config/ss
rm -rf ~/.config/gost
rm -rf ~/.config/caddy
rm -rf ~/.config/systemd
rm -rf ~/Library/Application\ Support/tiny
rm -rf ~/Library/Application\ Support/navi
rm -rf ~/.spotdl/config.json

mkdir -p ~/.zsh
# link zshrc
ln -s ~/dotfiles/modules/zsh/files/global.zsh ~/.zsh/global.zsh

touch ~/.zshrc

echo unlink done! Please restart your terminal or run 'source ~/.zshrc'
