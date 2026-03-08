# Create a directory and cd into it
mkd() {
  mkdir -p "$@" && cd "$@"
}

# Prune local branches whose remote tracking branch is gone
git-prune-local() {
  git fetch --prune
  git branch -vv | grep ': gone]' | awk '{print $1}' | xargs -r git branch -D
}
