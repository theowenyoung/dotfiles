

alias yb="YS_DEV=1 deno run -A --unstable ~/yamlscript/ys.ts build"
alias yy="YS_DEV=1 deno run -A --unstable ~/yamlscript/ys.ts run"
alias ys="YS_DEV=1 deno run -A --unstable ~/yamlscript/ys.ts"

# Custom
pr(){
	export HTTP_PROXY="http://127.0.0.1:7890"
	export HTTPS_PROXY="http://127.0.0.1:7890"
	export SOCKS_PROXY="socks://127.0.0.1:7891"
}

rp(){
	unset HTTP_PROXY
	unset HTTPS_PROXY
	unset SOCKS_PROXY
}
## clash
alias cl="sudo clash -d ~/.config/clash"

## make

alias m="make"

## http server
#
alias hs="python3 -m http.server"

## zeje

alias ze="zellij"

## systemctl

alias sstatus="systemctl --user status"
alias sstart="systemctl --user start"
alias sstop="systemctl --user stop"
alias srestart="systemctl --user restart"
alias sreload="systemctl --user daemon-reload"
alias jlog="journalctl --user -n 30 -f -u"

## process grep
alias pgr="ps aux | grep "

alias pos="port search"
alias poi="sudo port -N install"
alias s='ssh'

alias lf='ls -lh $(fzf)'

## cd directory
alias cf='cd $(fd --type directory | fzf)'

## rm file
alias rr='rm $(fzf)'
alias rd='rm -r $(fd --type directory | fzf)'
# other

#alias t="tmux"
alias ctags="uctags"
#alias ns="hx --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'"
# Unix
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
v() {
  if [[ $# -eq 1 && -d $1 ]]; then
    (cd $1; $VIM_EDITOR .)
  else
    $VIM_EDITOR "$@"
  fi
}
alias v.='v .'
alias vi=v
alias vi.=v.
alias vim=v
alias vim.=v.
alias path='echo $PATH | tr -s ":" "\n"'
alias psgrep='pstree | grep'
alias chx='chmod +x'
alias wh='which'
alias cmd='command'
alias ss='source ~/.zshrc'

# GNU and BSD (macOS) ls flags aren't compatible

if [ "$OSTYPE" = "linux-gnu" ]; then  # Is this the Ubuntu system?
    lsflags='--color --group-directories-first -F'
else
    lsflags='-GF'
    export CLICOLOR=1
fi

# Aliases
alias ls="ls ${lsflags}"
alias ll="ls ${lsflags} -l"
alias la="ls ${lsflags} -la"
alias h="history"
alias hg="history -1000 | grep -i"
alias ,="cd .."
alias l="less"

# GIT
# Do this: git config --global url.ssh://git@github.com/.insteadOf https://github.com
alias gd="git diff"
alias gs="git status 2>/dev/null"
alias gv="git remote -v"
