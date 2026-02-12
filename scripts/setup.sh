#!/bin/bash

echo 'Setting up your Mac...'

CODE="$HOME/Code"
DOTFILES="$CODE/config/dotfiles"

# Create folders
echo 'Creating folders'
mkdir -p "$CODE"

# Check for Homebrew and install if we don't have it
if ! command -v brew &>/dev/null; then
  echo 'Installing Homebrew'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  grep -q 'brew shellenv' "$HOME/.zprofile" 2>/dev/null || echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew analytics off
fi

# Check for Oh My Zsh and install if we don't have it
if [[ ! -d "$HOME/.oh-my-zsh/" ]]; then
  echo 'Installing Oh My Zsh'
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -f "$HOME/.zshrc"
ln -swf "$DOTFILES/.zshrc" "$HOME/.zshrc"

# Install dependencies with Homebrew bundle (See Brewfile)
echo 'Installing dependencies from Homebrew bundle'
brew update
brew bundle --file "$DOTFILES/Brewfile"

# Symlink the global git files
mkdir -p "$HOME/.config/git"
ln -swf "$DOTFILES/git/config" "$HOME/.gitconfig"
ln -swf "$DOTFILES/git/ignore" "$HOME/.config/git/ignore"

# Symlink the Mackup config file to the home directory
#ln -swf "$DOTFILES/.mackup.cfg" "$HOME/.mackup.cfg" # Not using Mackup until https://github.com/lra/mackup?tab=readme-ov-file#warning is resolved
# mackup restore

# Optionally set up SSH key for GitHub
echo ""
read -p "Set up SSH key for GitHub? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  read -p "Enter your email: " email
  source "$DOTFILES/scripts/setup-ssh.sh" "$email"
fi

# Initialise submodules (requires SSH)
echo 'Initialising submodules'
git -C "$DOTFILES" submodule update --init --recursive

# Optionally run work setup
echo ""
read -p "Run work setup? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  source "$DOTFILES/work/setup.sh"
fi

