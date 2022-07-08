
# git commit 

function gc() { git clone ssh://git@github.com/"$*" }
function gg() { git commit -m "$*" -a }
function gp() { git commit -a -m "$*" && git push }
function ga() { git add . }


alias gpull="git pull"
alias gpush="git push"