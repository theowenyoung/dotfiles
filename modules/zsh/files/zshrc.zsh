# My zsh includes
for file in ~/.zsh/includes/*; do
  source "$file"
done

# source ~/.zsh/includes/1_env.zsh;
# source ~/.zsh/includes/2_path.zsh;
# source ~/.zsh/includes/3_function.zsh;
# source ~/.zsh/includes/4_aliases.zsh;
# source ~/.zsh/includes/5_fzf_keybinding.zsh;
# source ~/.zsh/includes/6_fzf_completion.zsh;
# source ~/.zsh/includes/7_git_prompt.zsh;
# source ~/.zsh/includes/8_ssh_zsh_completion.zsh

EXTRA_DIR=~/.zsh/extra
if [ -d "$EXTRA_DIR" ]; then
	for file in "$EXTRA_DIR/"*; do
		source "$file"
  done

fi

alias TTT="echo"
function xxx(){
  
export XXX=1

TTT hhhh

echo $XXX;
}


# load general config
source ~/.zsh/general_config.zsh


# add ssh agent
#eval "$(ssh-agent)"
# start zellij
# eval "$(zellij setup --generate-auto-start zsh)"

