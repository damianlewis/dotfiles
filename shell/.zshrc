# Path to your dotfiles.
export DOTFILES="$HOME/Code/config/global/dotfiles"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# eza — explicit config dir so theme.yml is loaded (eza does not auto-detect)
export EZA_CONFIG_DIR="$HOME/.config/eza"

# ripgrep — point at its config file
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/ripgreprc"

# Theme
export SPACESHIP_CONFIG="$DOTFILES/config/spaceship.zsh"

# History
HIST_STAMPS="dd/mm/yyyy"

# Custom folder
ZSH_CUSTOM=$DOTFILES/shell

# Disable auto title
DISABLE_AUTO_TITLE="true"

# Plugins
plugins=(
  composer
  git
  yarn
)

source "$ZSH/oh-my-zsh.sh"

# Spaceship prompt (installed via Homebrew)
source "$(brew --prefix)/opt/spaceship/spaceship.zsh"

# Zoxide (smart directory jumping)
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"

# fzf key bindings and completion
(( $+commands[fzf] )) && source <(fzf --zsh)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="phpstorm --wait"
fi

# Herd injected PHP binary.
export PHP_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/":$PHP_INI_SCAN_DIR

# Herd injected NVM configuration
export NVM_DIR="$HOME/Library/Application Support/Herd/config/nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# Herd injected PHP 8.5 configuration.
export HERD_PHP_85_INI_SCAN_DIR="/Users/damianlewis/Library/Application Support/Herd/config/php/85/"

# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/damianlewis/Library/Application Support/Herd/config/php/84/"

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/damianlewis/Library/Application Support/Herd/config/php/83/"

# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/damianlewis/Library/Application Support/Herd/config/php/82/"

# Herd injected PHP 8.1 configuration.
export HERD_PHP_81_INI_SCAN_DIR="/Users/damianlewis/Library/Application Support/Herd/config/php/81/"

# Herd injected PHP 8.0 configuration.
export HERD_PHP_80_INI_SCAN_DIR="/Users/damianlewis/Library/Application Support/Herd/config/php/80/"

# Herd injected PHP 7.4 configuration.
export HERD_PHP_74_INI_SCAN_DIR="/Users/damianlewis/Library/Application Support/Herd/config/php/74/"

# Herd injected PHP binary.
export PATH="/Users/damianlewis/Library/Application Support/Herd/bin/":$PATH

# Local overrides (not version controlled)
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
