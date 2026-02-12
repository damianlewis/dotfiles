# Applications
alias pstorm='open -a "PhpStorm" .'

# Herd
alias composer="herd composer"
alias php="herd php"
alias which-php="herd which-php"

# Composer (most aliases provided by the composer plugin)
alias cfresh="rm -rf vendor && composer install"

# npm
alias nin="npm install"
alias nb="npm run build"
alias nd="npm run dev"
alias nfresh="rm -rf node_modules && npm install"

# yarn (most aliases provided by the yarn plugin)
alias yfresh="rm -rf node_modules && yarn install"

# PHP
alias pint="./vendor/bin/pint --parallel --test"
alias rect="./vendor/bin/rector process --dry-run"
alias pest="./vendor/bin/pest --parallel --colors=always"
alias prp="pint && rect && pest"

# Laravel
alias art="artisan"
alias artfresh="artisan migrate:fresh --seed"
alias artopt="artisan optimize"
alias artoptc="artisan optimize:clear"
alias horz="artisan horizon"
alias seed="artisan db:seed"

# Filament
alias filopt="artisan filament:optimize"
alias filoptc="artisan filament:optimize-clear"
