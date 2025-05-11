#!/bin/bash

echo 'Setting up your Mac...'

DOTFILES="$HOME/.dotfiles"

# Check for Oh My Zsh and install if we don't have it
if [[ ! -d "$HOME/.oh-my-zsh/" ]]; then
  echo 'Installing Oh My Zsh'
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Check for Homebrew and install if we don't have it
if ! test -x "$(which brew)"; then
  echo 'Installing Homebrew'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew analytics off
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf "$HOME/.zshrc"
ln -sw "$DOTFILES/.zshrc" "$HOME/.zshrc"

# Install dependencies with Homebrew bundle (See Brewfile)
echo 'Installing dependencies from Homebrew bundle'
brew update
brew tap homebrew/bundle
brew bundle --file "$DOTFILES/Brewfile"

# Symlink the spaceship Oh My Zsh theme
echo 'Creating symlink for Oh My Zsh spaceship theme'
#git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$DOTFILES/themes/spaceship-prompt" --depth=1
ln -sw "$DOTFILES/themes/spaceship/spaceship.zsh-theme" "$DOTFILES/themes/spaceship.zsh-theme"

# Symlink the global git files
mkdir -p "$HOME/.config/git"
ln -sw "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"
ln -sw "$DOTFILES/git/.gitignore" "$HOME/.config/git/ignore"

# Create folders
echo 'Creating folders'
mkdir "$HOME/Code"
mkdir "$HOME/Reviewing"
mkdir "$HOME/Sites"

# Symlink the Mackup config file to the home directory
#ln -sw "$DOTFILES/.mackup.cfg" "$HOME/.mackup.cfg" # Not using Mackup until https://github.com/lra/mackup?tab=readme-ov-file#warning is resolved
# mackup restore

# Set macOS preferences - we will run this last because this will reload the shell
source "$DOTFILES/.macos"
