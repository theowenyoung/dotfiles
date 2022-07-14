# My zsh includes



for file in ~/.zsh/includes/*; do
  source "$file"
done


EXTRA_DIR=~/.zsh/extra
if [ -d "$EXTRA_DIR" ]; then
	for file in "$EXTRA_DIR/"*; do
		source "$file"
  done

fi

# Tab completion
autoload -Uz compinit && compinit -u

# load general config
source ~/.zsh/general_config.zsh
