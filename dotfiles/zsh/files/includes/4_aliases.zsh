# Custom


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
alias ca="comtrya apply"
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
ls --version &>/dev/null
if [ $? -eq 0 ]; then
  lsflags="--color --group-directories-first -F"
else
  lsflags="-GF"
  export CLICOLOR=1
fi

# Aliases
alias ls="ls ${lsflags}"
alias ll="ls ${lsflags} -l"
alias la="ls ${lsflags} -la"
alias h="history"
alias hg="history -1000 | grep -i"
alias ,="cd .."
alias m="less"

# GIT
# Do this: git config --global url.ssh://git@github.com/.insteadOf https://github.com
alias gd="git diff"
alias gs="git status 2>/dev/null"
