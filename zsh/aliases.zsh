alias gcln='git fetch -p && git checkout -B master origin/master && git branch | grep -v "master" | xargs git branch -D'
alias gcmain='git fetch -p && git checkout -B main origin/main && git branch | grep -v "main" | xargs git branch -D'
alias frk='fork .'

alias sso='java -jar ~/.sso/ssogenerator.jar'
alias idcp='uuid | tr -d "\n" | pbcopy'
alias killz='sudo launchctl remove com.zscaler.service && sudo launchctl remove com.zscaler.tunnel'
