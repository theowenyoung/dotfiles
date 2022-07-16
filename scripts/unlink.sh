#/bin/bash

rm -rf ~/.zsh
rm ~/.zshrc
rm ~/.zshenv
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
rm -rf ~/.config/kak
rm -rf ~/.config/wezterm
rm -rf ~/.config/systemd
rm -rf ~/.config/ss
rm -rf ~/.config/gost
rm -rf ~/.config/caddy
rm -rf ~/.config/systemd
rm -rf ~/Library/Application\ Support/tiny
rm -rf ~/Library/Application\ Support/navi
rm -rf ~/.spotdl/config.json
touch ~/.zshrc
# link zshenv
ln -s ~/dotfiles/scripts/zshenv.zsh ~/.zshenv

echo unlink done! Please restart your terminal or run 'source ~/.zshrc'
