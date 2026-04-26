# Modern tool replacements (graceful fallback)
(( $+commands[eza] )) && alias ls='eza --group-directories-first'
(( $+commands[bat] )) && alias cat='bat --paging=never'

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

# PHP — prefer project-defined composer scripts, fall back to vendor binaries
_has_composer_script() {
  [[ -f composer.json ]] && composer run-script --list 2>/dev/null \
    | grep -qE "^[[:space:]]*$1([[:space:]]|\$)"
}
clint() {
  if _has_composer_script lint; then composer lint
  else ./vendor/bin/pint --parallel
  fi
}
clint:dry() {
  if _has_composer_script lint:dry; then composer lint:dry
  else ./vendor/bin/pint --parallel --test
  fi
}
crefactor() {
  if _has_composer_script refactor; then composer refactor
  else ./vendor/bin/rector process
  fi
}
crefactor:dry() {
  if _has_composer_script refactor:dry; then composer refactor:dry
  else ./vendor/bin/rector process --dry-run
  fi
}
ctest() {
  if _has_composer_script test; then composer test
  else ./vendor/bin/pest --parallel --colors=always
  fi
}
alias ccheck="crefactor && clint && ctest"
alias ccheck:dry="crefactor:dry && clint:dry && ctest"

# Laravel
alias art="php artisan"
alias artfresh="php artisan migrate:fresh --seed"
alias artopt="php artisan optimize"
alias artoptc="php artisan optimize:clear"
alias horz="php artisan horizon"
alias seed="php artisan db:seed"

# Filament
alias filopt="php artisan filament:optimize"
alias filoptc="php artisan filament:optimize-clear"

# Artisan completion
_art_completion() {
  if [[ -f artisan ]]; then
    compadd $(php artisan --raw --no-ansi list 2>/dev/null | sed "s/[[:space:]].*//g")
  fi
}
compdef _art_completion art

# Git shortcuts
alias nah='git reset --hard && git clean -df'
alias uncommit='git reset --soft HEAD~1'

# macOS
alias o='open .'
alias show='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias flushdns='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'

# Network
alias ip='curl -s https://ipinfo.io/ip'
alias localip='ipconfig getifaddr en0'

# Dotfiles
alias dotup='source $DOTFILES/bin/update'
alias reload='source ~/.zshrc'
