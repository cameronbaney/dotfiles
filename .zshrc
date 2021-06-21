export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git 
  zsh-autosuggestions 
  zsh-syntax-highlighting
)

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $ZSH/oh-my-zsh.sh

alias setup_core='git pull && update && bin/rake dev:create_apps && echo "Shop.first.beta.enable(:inbox_in_admin)" | bin/rails c && restart'
alias setup_web='git pull && update restart'