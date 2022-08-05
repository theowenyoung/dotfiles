#!/bin/sh

cd -- ~/dotfiles/private/clash/files/ruleset;
export HTTPS_PROXY=http://127.0.0.1:7890;
# apple
curl -O -L https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/apple.txt;

# reject 
curl -O -L https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/reject.txt;

# icloud
curl -O -L https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/icloud.txt;

# google
curl -O -L https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/google.txt;

# proxy
curl -O -L https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/proxy.txt;

# direct
curl -O -L https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/direct.txt;

# private
curl -O -L https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/private.txt;

# gfw
curl -O -L https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/gfw.txt;

# greatfire
curl -O -L https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/greatfire.txt;

# tld-not-cn
curl -O -L https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/tld-not-cn.txt;

# telegramcidr
curl -O -L https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/telegramcidr.txt;

# cncidr
curl -O -L https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/cncidr.txt;

# lancidr
curl -O -L https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/lancidr.txt;

# applications
curl -O -L https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/applications.txt;