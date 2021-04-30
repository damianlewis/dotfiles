# Folders
alias sites="cd $HOME/Sites"
alias code="cd $HOME/Code"
alias biq="cd $HOME/Sites/brand-iq"

# PHP
alias php74="valet use php@7.4"
alias php8="valet use php"

# Artisan
alias art='php artisan'
alias fresh="php artisan migrate:fresh --seed"
alias seed="php artisan db:seed"

# Brand-iQ
alias biqreset='composer install && yarn install && yarn dev'
alias biqdemo='php artisan db:seed-demo --no-interaction --migrate --keys'

# Creative Workflow
alias cwreset='composer install && npm install && npm run dev'
alias cwfresh='php artisan migrate:fresh && php artisan db:seed'
alias cwdemo='php artisan db:seed-demo --migrate'

