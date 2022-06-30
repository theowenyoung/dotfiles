
# git commit 

function gc() { git clone ssh://git@github.com/"$*" }
function gg() { git commit -m "$*" }
function gp() { git commit -a -m "$*" && git push }
function ga() { git add . }


alias gipu="git pull"
