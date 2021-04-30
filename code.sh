#!/bin/zsh

mkdir -p "$HOME/Code/packages/brandiq"
packages_dir="$HOME/Code/packages/brandiq"
docs_dir="$packages_dir"

# Repos for Brand-iQ Composer packages
composer_packages=(
    auth-activity
)

# Clone Brand-iQ Composer packages
for package in "${composer_packages[@]}"; do
    echo "Cloning Brand-iQ Composer $package package"

    git clone "git@github.com:brandiq/${package}.git" "$packages_dir/$package"
    cd "$packages_dir/$package"

    composer install
done

# Repos for Brand-iQ NPM packages
npm_packages=(
    brand-iq-app-admin-ui
)

# Clone Brand-iQ NPM packages
for package in "${npm_packages[@]}"; do
    echo "Cloning Brand-iQ NPM $package package"

    git clone "git@github.com:brandiq/${package}.git" "$packages_dir/$package"
    cd "$packages_dir/$package"

    if [[ -f 'yarn.lock' ]]; then
        yarn install
    else
        npm install
    fi
done

# Repos for Brand-iQ documentation
docs=(
    docs
    dev-docs
)

# Clone Brand-iQ docs
for doc in "${docs[@]}"; do
    echo "Cloning Brand-iQ $doc"

    git clone "git@github.com:brandiq/${doc}.git" "$docs_dir/$doc" --branch 1.0

    if [[ -d $HOME/Sites/brand-iq-website ]]; then
        mkdir "$HOME/Sites/brand-iq-website/resources/$doc"

        ln -s "$docs_dir/$doc" "$HOME/Sites/brand-iq-website/resources/$doc/1.0"
    fi
done
