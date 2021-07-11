git_default_branch() {
    echo $(basename $(git symbolic-ref --short refs/remotes/origin/HEAD))
}

gsync() {
    local git_default_branch=$(git_default_branch)
    if [ "$git_default_branch" = "$(git rev-parse --abbrev-ref HEAD)" ]; then
        echo You are on $git_default_branch!
        return 1
    fi
    local message="$*"
    git add --all
    git commit -am "${message:=.}"
    git push origin $(git rev-parse --abbrev-ref HEAD)
}

gsyncf() {
    local message="$*"
    git add --all
    git commit -am "${message:=fix}"
    git push origin $(git rev-parse --abbrev-ref HEAD)
}

gcln() {
    local git_default_branch=$(git_default_branch)
    git fetch -p
    git checkout -B $git_default_branch origin/$git_default_branch
    git branch | grep -v "$git_default_branch" | xargs -r git branch -D
}
