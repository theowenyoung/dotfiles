#################
### Functions ###
#################


# grep

gr(){
  
  grep -r --text --exclude-dir={node_modules,.git} $1 .
  
}


# urlencode
encode()
{
    local args="$@"
    jq -nr --arg v "$args" '$v|@uri';
}

alias decode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'
# create with vim

c() {
   fzf_path=$(fd --type directory | fzf)
   if [ -z "$fzf_path" ]
   then
    return 0
   fi
   file_path=$fzf_path/$1
   parentdir="$(dirname "$file_path")"
   if [ ! -d $parentdir ]
   then
     mkdir -p $parentdir
   fi
   $EDITOR $file_path
}

o() {
   fzf_path=$(fzf)
   if [ -z "$fzf_path" ]
   then
    return 0
   fi
   $EDITOR $fzf_path
}

ct() {
   fzf_path=$(fzf)
   if [ -z "$fzf_path" ]
   then
    return 0
   fi
   cat $fzf_path
}
# chmod file_path

ch() {
    if [ -z "$1" ]
    then
        return 0
    fi
    chmod $1 $(fzf)
}

# run Executed
,run() {
        fzf_path=$(fzf)
        if [[ -x "$fzf_path" ]]
        then
        echo "run" $fzf_path
        $fzf_path $1
        else
        echo "File '$file' is not executable or found"
fi
    }


localip() {
  local ip=$(ipconfig getifaddr en0)
  echo $ip | tr -d '\n' | pbcopy
  echo $ip
}
realip() {
  curl https://myip.ipip.net
}
publicip() {
  curl icanhazip.com
}
git-prompt-info() {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  echo " %F{green}($(current-git-branch)%f $(git-dirty)%F{green})%f"
}

current-git-branch() {
  git symbolic-ref --short -q HEAD
}

git-dirty() {
  test -z "$(command git status --porcelain --ignore-submodules -unormal)"
  if [[ $? -eq 1 ]]; then
    echo '%F{red}✗%f'
  else
    echo '%F{green}✔%f'
  fi
}

arch-prompt-info() {
  if [[ $(arch) == 'i386' && $(sysctl -n machdep.cpu.brand_string) == 'Apple M1' ]]; then
    echo ' ℹ️  '
  fi
}

expand-or-complete-with-waiting-dots() {
  echo -n "\e[31m......\e[0m"
  zle expand-or-complete
  zle redisplay
}

insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}

fancy-ctrl-z() {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

exit-shell() {
  exit
}

start-paste() {
  bindkey -A paste main
}

end-paste() {
  bindkey -e
  LBUFFER+=$_paste_content
  unset _paste_content
}

paste-insert() {
  _paste_content+=$KEYS
}
local cmd_alias=""

# Reveal Executed Alias
alias_for() {
  [[ $1 =~ '[[:punct:]]' ]] && return
  local search=${1}
  local found="$( alias $search )"
  if [[ -n $found ]]; then
    found=${found//\\//} # Replace backslash with slash
    found=${found%\'} # Remove end single quote
    found=${found#"$search='"} # Remove alias name
    echo "${found} ${2}" | xargs # Return found value (with parameters)
  else
    echo ""
  fi
}

expand_command_line() {
  first=$(echo "$1" | awk '{print $1;}')
  rest=$(echo ${${1}/"${first}"/})

  if [[ -n "${first//-//}" ]]; then # is not hypen
    cmd_alias="$(alias_for "${first}" "${rest:1}")" # Check if there's an alias for the command
    if [[ -n $cmd_alias ]]; then # If there was
      echo "${T_GREEN}❯ ${T_YELLOW}${cmd_alias}${F_RESET}" # Print it
    fi
  fi
}

pre_validation() {
  [[ $# -eq 0 ]] && return                    # If there's no input, return. Else...
  expand_command_line "$@"
}
