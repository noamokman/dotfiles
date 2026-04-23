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
  gh
  zsh-syntax-highlighting
  aws
  you-should-use
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
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/noamokman/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/noamokman/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/noamokman/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/noamokman/google-cloud-sdk/completion.zsh.inc'; fi
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/noamokman/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
