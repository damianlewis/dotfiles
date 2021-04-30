#!/bin/zsh

dotfiles_dir="$HOME/.dotfiles"

# Install Oh My Zsh
if [[ ! -d $HOME/.oh-my-zsh ]]; then
  echo 'Installing Oh My Zsh'
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Homebrew
if [[ ! $(command -v brew) ]]; then
  echo 'Installing Homebrew'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ -d /opt/homebrew/bin ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi

# Update Homebrew
brew update

# Install Rosetta 2 if required
if [[ $(/usr/bin/arch) == 'arm64' ]]; then
  echo 'Installing Rosetta 2'
  /usr/sbin/softwareupdate --install-rosetta --agree-to-license
fi

# Install dependencies with Homebrew bundle (See Brewfile)
echo 'Installing dependencies'
brew tap homebrew/bundle
brew bundle --file="$dotfiles_dir/Brewfile"

# Start services using Homebrew
brew_services=(
  mysql
  redis
)

for service in "${brew_services[@]}"; do
  echo "Starting $service service"
  brew services start "$service"
done

# Install NVM
if [[ ! -d $HOME/.nvm ]]; then
  echo 'Installing Node Version Manager'

  export NVM_DIR="$HOME/.nvm" && (
    git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
  ) && \. "$NVM_DIR/nvm.sh"
fi

# Install PHP extensions for each installed version of PHP
php_versions=($(brew list | grep php))
php_extensions=(
  imagick
  redis
)

for php in "${php_versions[@]}"; do
  brew unlink "$php"
done

for php in "${php_versions[@]}"; do
  brew link "$php"

  for extension in "${php_extensions[@]}"; do
    if ! pecl list | grep "$extension" > /dev/null 2>&1; then
      echo "Installing $extension for $php"
      pecl install "$extension"
    fi
  done

  brew unlink "$php"
done

# Set default PHP version
brew link php@7.4

# Install global Composer packages
composer_packages=(
  laravel/valet
  styleci/cli:^1.1
)

for package in "${composer_packages[@]}"; do
  echo "Installing global Composer package: $package"
  $(brew --prefix)/bin/composer global require "$package"
done

# Install and configure Laravel Valet
if [[ -f $HOME/.composer/vendor/bin/valet ]]; then
  echo 'Installing and configuring Laravel Valet'
  "$HOME/.composer/vendor/bin/valet" install
  "$HOME/.composer/vendor/bin/valet" trust
  "$HOME/.composer/vendor/bin/valet" tld localhost
fi

# Install global NPM packages
npm_packages=(
  yarn
  rollup
)

for package in "${npm_packages[@]}"; do
  echo "Installing global NPM package: $package"
  npm install -g "$package"
done

# Set default MySQL root password
echo 'Updating MySQL root password'
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'secret'; FLUSH PRIVILEGES;"

# Create work folders
echo 'Creating work folders'
mkdir "$HOME/Sites"
mkdir "$HOME/Code"

# Links to the .zshrc file from the .dotfiles
echo 'Linking to Oh My Zsh config file'
rm -rf "$HOME/.zshrc"
ln -s "$dotfiles_dir/.zshrc" "$HOME/.zshrc"

# Restore app preferences from Mackup
echo 'Restoring app preferences'
ln -s "$dotfiles_dir/.mackup.cfg" "$HOME/.mackup.cfg"
mackup restore

# Set up sites/apps and packages from GitHub repositories
"$dotfiles_dir/sites.sh"
"$dotfiles_dir/code.sh"
