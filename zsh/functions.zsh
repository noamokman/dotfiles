git_default_branch() {
    echo $(basename $(git symbolic-ref --short refs/remotes/origin/HEAD))
}

webclone() {
    hub clone soluto-private/${1}
    webstorm ./${1}
}

gsync() {
    local git_default_branch=$(git_default_branch)
    if [ "$git_default_branch" = "$(git rev-parse --abbrev-ref HEAD)" ]; then
        echo You are on $git_default_branch!
        return 1
    fi
    message="$*"
    git add --all
    git commit -am "${message=.}"
    git push origin $(git rev-parse --abbrev-ref HEAD)
}

gsyncf() {
    message="$*"
    git add --all
    git commit -am "${message=.}"
    git push origin $(git rev-parse --abbrev-ref HEAD)
}

gcln() {
    local git_default_branch=$(git_default_branch)
    git fetch -p
    git checkout -B $git_default_branch origin/$git_default_branch
    git branch | grep -v "$git_default_branch" | xargs -r git branch -D
}
