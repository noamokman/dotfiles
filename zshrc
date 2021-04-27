# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
DISABLE_UPDATE_PROMPT="true"
HIST_STAMPS="dd/mm/yyyy"

ZSH_CUSTOM=$HOME/.zsh

plugins=(
  yarn
  npm
  brew
  git
  zsh-autosuggestions
  docker
  docker-compose
  kubectl
  github
  zsh-syntax-highlighting
)

if ((!${fpath[(I) / usr / local / share / zsh / site - functions]})); then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi
ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

# User configuration
DEFAULT_USER=$(whoami)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

[[ -f "$HOME/.zshrc.local.sh" ]] && \. "$HOME/.zshrc.local.sh"
