webclone() {
    hub clone soluto-private/${1}
    webstorm ./${1}
}

gsync() {
    if ("$(git rev-parse --abbrev-ref HEAD)" == "master"); then
        echo You are on master!
        return 1
    fi
    git add --all
    git commit -am "${1=.}"
    git push origin $(git rev-parse --abbrev-ref HEAD)
}

gmaster() {
    git add --all
    git commit -am "${1=fix}"
    git push origin $(git rev-parse --abbrev-ref HEAD)
}
