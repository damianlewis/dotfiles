#!/bin/bash

echo 'Setting up your Mac...'

DOTFILES="$HOME/.dotfiles"

# Check for Oh My Zsh and install if we don't have it
if test ! "$(which omz)"; then
  echo 'Installing Oh My Zsh'
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Check for Homebrew and install if we don't have it
if test ! "$(which brew)"; then
  echo 'Installing Homebrew'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew analytics off
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf "$HOME/.zshrc"
ln -sw "$DOTFILES/.zshrc" "$HOME/.zshrc"

# if [[ -d /opt/homebrew/bin ]]; then
#   export PATH="/opt/homebrew/bin:$PATH"
# fi

# Install Rosetta 2 if required
# if [[ $(/usr/bin/arch) == 'arm64' ]]; then
#   echo 'Installing Rosetta 2'
#   /usr/sbin/softwareupdate --install-rosetta --agree-to-license
# fi

# Install dependencies with Homebrew bundle (See Brewfile)
echo 'Installing dependencies from Homebrew bundle'
brew update
brew tap homebrew/bundle
brew bundle --file "$DOTFILES/Brewfile"

# Install NVM
# if [[ ! -d $HOME/.nvm ]]; then
#   echo 'Installing Node Version Manager'

#   export NVM_DIR="$HOME/.nvm" && (
#     git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
#     cd "$NVM_DIR"
#     git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
#   ) && \. "$NVM_DIR/nvm.sh"
# fi

# Install Node
# if [[ ! $(command -v node) ]]; then
#   echo 'Installing latest version of Node'
#   nvm install node
#   nvm alias default node
# fi

# Install PHP extensions for each installed version of PHP
# php_versions=(
  # php
# )
# php_extensions=(
  # imagick
  # redis
# )

# for php in "${php_versions[@]}"; do
#   brew unlink "$php"
# done

# for php in "${php_versions[@]}"; do
#   brew link "$php"

#   for extension in "${php_extensions[@]}"; do
#     if ! pecl list | grep "$extension" > /dev/null 2>&1; then
#       echo "Installing $extension for $php"
#       pecl install "$extension"
#     fi
#   done

#   brew unlink "$php"
# done

# Set default PHP version
# brew link php

# Install global Composer packages
# composer_packages=(
  # laravel/valet
  # styleci/cli:^1.1
# )

# for package in "${composer_packages[@]}"; do
#   echo "Installing global Composer package: $package"
#   $(brew --prefix)/bin/composer global require "$package"
# done

# Install and configure Laravel Valet
# if [[ -f $HOME/.composer/vendor/bin/valet ]]; then
#   echo 'Installing and configuring Laravel Valet'
#   "$HOME/.composer/vendor/bin/valet" install
#   "$HOME/.composer/vendor/bin/valet" trust
# fi

# Install global NPM packages
# npm_packages=(
#   yarn
#   rollup
# )

# for package in "${npm_packages[@]}"; do
#   echo "Installing global NPM package: $package"
#   npm install -g "$package"
# done

# Symlink the spaceship Oh My Zsh theme
echo 'Creating symlink for Oh My Zsh spaceship theme'
#git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$DOTFILES/themes/spaceship-prompt" --depth=1
ln -sw "$DOTFILES/themes/spaceship/spaceship.zsh-theme" "$DOTFILES/themes/spaceship.zsh-theme"

# Create folders
echo 'Creating folders'
mkdir "$HOME/Code"
mkdir "$HOME/Reviewing"
mkdir "$HOME/Sites"

# Symlink the Mackup config file to the home directory
#ln -sw "$DOTFILES/.mackup.cfg" "$HOME/.mackup.cfg" # Not using Mackup until https://github.com/lra/mackup?tab=readme-ov-file#warning is resolved
# mackup restore

# Set up sites/apps and packages from GitHub repositories
chmod +x "$DOTFILES/personal/repos.sh" && "$DOTFILES/personal/repos.sh"

# Set macOS preferences - we will run this last because this will reload the shell
source "$DOTFILES/.macos"
