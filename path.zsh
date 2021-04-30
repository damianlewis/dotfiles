# Add path to homebrew binaries folder
export PATH="/opt/homebrew/bin:$PATH"

# Add path to composer's global binaries folder
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load NVM here to control how path to global node binaries is added
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Use project binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"