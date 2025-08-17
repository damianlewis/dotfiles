# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadzsh="omz reload"
alias srczsh="source ~/.zshrc"

# Folders
alias biq="cd $HOME/Sites/brand-iq/brand-iq"
alias code="cd $HOME/Code"
alias reviewing="cd $HOME/Reviewing"
alias sites="cd $HOME/Sites"

# Herd
alias composer="herd composer"
alias php="herd php"
alias which-php="herd which-php"

# Composer
alias dump="composer dump-autoload"
alias c="composer"
alias cfresh="rm -rf vendor && composer install"
alias cgr="composer global require"
alias cgrm="composer global remove"
alias cgu="composer global update"
alias ci="composer install"
alias cr="composer require"
alias crm="composer remove"
alias cu="composer update"

# npm/yarn
alias ni="npm install"
alias nfresh="rm -rf node_modules && npm install"
alias nbuild="npm run build"
alias ndev="npm run dev"
alias yi="yarn install"
alias yfresh="rm -rf node_modules && yarn install"
alias ybuild="yarn build"
alias ydev="yarn dev"

# PHP
alias pest="./vendor/bin/pest --parallel --bail --colors=always"
alias pint="./vendor/bin/pint --parallel"
alias rect="./vendor/bin/rector process --dry-run"

# Laravel
alias horz="php artisan horizon"
alias seed="php artisan db:seed"
alias art='php artisan'
alias artclear="php artisan optimize:clear"
alias artfresh="php artisan migrate:fresh --seed"
alias artopt="php artisan optimize"

# Filament
alias filclear="php artisan filament:optimize-clear"
alias filopt="php artisan filament:optimize"

# Brand-iQ
alias biqbuild='composer install && artisan biq:build'
alias biqdemo='php artisan db:seed-demo --no-interaction --migrate --keys'
alias biqdeploy='composer install && artisan biq:deploy'
alias biqfresh='rm -rf vendor node_modules && composer install && yarn install'
alias biqappbuild='composer install && yarn install && yarn prod'
alias biqthemesbuild='php artisan biq:build-themes'
alias biqdev='npx concurrently -c "#93c5fd,#c4b5fd,#fb7185" "php artisan horizon" "yarn dev" "php artisan biq:build-themes" --names=horizon,vite,theme'

# Creative Workflow
# alias cwreset='composer install && npm install && npm run dev'
# alias cwfresh='php artisan migrate:fresh && php artisan db:seed'
# alias cwdemo='php artisan db:seed-demo --migrate'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"
