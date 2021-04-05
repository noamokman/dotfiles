alias gcln='git fetch -p && git checkout -B master origin/master && git branch | grep -v "master" | xargs git branch -D'
alias gcmain='git fetch -p && git checkout -B main origin/main && git branch | grep -v "main" | xargs git branch -D'
alias frk='fork .'
alias gsync='gsync(){[ "$(git rev-parse --abbrev-ref HEAD)" != "master" ] && git add --all && git commit -am "${1=.}" && git push origin $(git rev-parse --abbrev-ref HEAD)}; gsync'
alias gmaster='gmaster(){git add --all && git commit -am "${1=fix}" && git push origin $(git rev-parse --abbrev-ref HEAD)}; gmaster'

alias sso='java -jar ~/.sso/ssogenerator.jar'
alias idcp='uuid | tr -d "\n" | pbcopy'
alias killz='sudo launchctl remove com.zscaler.service && sudo launchctl remove com.zscaler.tunnel'