## Add path to homebrew binaries folder
#export PATH="/opt/homebrew/bin:$PATH"
#
## Add path to composer's global binaries folder
#export PATH="$HOME/.composer/vendor/bin:$PATH"
#
## Load NVM here to control how path to global node binaries is added
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#
## Use project binaries before global ones
#export PATH="node_modules/.bin:vendor/bin:$PATH"
# Add directories to the PATH and prevent to add the same directory multiple times upon shell reload.
add_to_path() {
  if [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$1:$PATH"
  fi
}

# Load dotfiles binaries
add_to_path "$DOTFILES/bin"

# Load global Composer tools
add_to_path "$HOME/.composer/vendor/bin"

# Load global Node installed binaries
add_to_path "$HOME/.node/bin"

# Use project specific binaries before global ones
add_to_path "./vendor/bin"
add_to_path "./node_modules/.bin"
