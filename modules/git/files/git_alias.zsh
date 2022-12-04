
# git commit

function gc() { git clone ssh://git@github.com/"$*" }
function gg() { git commit -m "$*" -a }
function gp() { git commit -a -m "$*" && git push }
function gt() { git tag -a "$1" -m "$1" && git push }
function ga() { git add . }
function gskip() { git commit -a -m "[skip ci] $*" && git push }


alias gpull="git pull"
alias gpush="git push"
