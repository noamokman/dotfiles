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
    git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
}

gsyncf() {
    local message="$*"
    git add --all
    git commit -am "${message:=fix}"
    git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
}

gcln() {
    local git_default_branch=$(git_default_branch)
    git fetch -p
    git checkout -B $git_default_branch origin/$git_default_branch
    git for-each-ref --format='%(refname:short)' refs/heads/ | grep -v "$git_default_branch" | xargs -r git branch -D
}

gqpr() {
    local message="$*"
    local final_message="${message:=fix}"
    local branch_name=$(echo ${final_message// /-} | tr '[:upper:]' '[:lower:]')
    gcb "$branch_name"
    gsync "$final_message"
    gpr | tail -1 | clipboard
}

load-gh-token() {
    export GITHUB_TOKEN=$(cat ~/.config/gh/hosts.yml | yq '."github.com".oauth_token')
}
