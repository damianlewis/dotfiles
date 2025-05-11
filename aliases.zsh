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
alias pint="./vendor/bin/pint"
alias rect="./vendor/bin/rector process --dry-run"

# Laravel
alias horz="artisan horizon"
alias seed="artisan db:seed"
alias art='artisan'
alias artclear="artisan optimize:clear"
alias artfresh="artisan migrate:fresh --seed"
alias artopt="artisan optimize"

# Screen
alias srhorz="screen -r horizon"
alias srydev="screen -r yarn-dev"

# Filament
alias filclear="artisan filament:optimize-clear"
alias filopt="artisan filament:optimize"

# Brand-iQ
alias biqbuild='composer install && artisan biq:build'
alias biqdemo='artisan db:seed-demo --no-interaction --migrate --keys'
alias biqdeploy='composer install && artisan biq:deploy'
alias biqfresh='rm -rf vendor node_modules && composer install && yarn install'
alias biqappbuild='composer install && yarn install && yarn prod'

# Creative Workflow
# alias cwreset='composer install && npm install && npm run dev'
# alias cwfresh='php artisan migrate:fresh && php artisan db:seed'
# alias cwdemo='php artisan db:seed-demo --migrate'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"

