#!/bin/zsh

mkdir -p "$HOME/Sites/brand-iq"
sites_dir="$HOME/Sites"
brand_iq_dir="$sites_dir/brand-iq"

function create_db() {
    mysql -uroot -psecret -e "CREATE DATABASE IF NOT EXISTS \`$1\` DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci";
}

echo 'Setting up Brand-iQ'

create_db brand-iq

# Clone repo for Brand-iQ
git clone git@github.com:brandiq/brand-iq.git "$brand_iq_dir/brand-iq"

# Set up Brand-iQ
cd "$brand_iq_dir/brand-iq"
valet link --secure biq.brand-iq
valet link --secure biq.adventusairways
valet link --secure biqdemo.brand-iq

composer install
yarn install

if [[ ! -f '.env' ]]; then
    cp .env.example .env
    php artisan key:generate
    php artisan passport:keys
fi

# Repos for Brand-iQ apps
brand_iq_apps=(
    academy
    accounts
    admin
    console
    fulfil
    inventory
    picker
    portal
    print
    reports
)

# Set up Brand-iQ apps
for app in "${brand_iq_apps[@]}"; do
    echo "Setting up Brand-iQ $app app"

    create_db "brand-iq-$app"

    git clone "git@github.com:brandiq/brand-iq-${app}.git" "$brand_iq_dir/brand-iq-$app"
    cd "$brand_iq_dir/brand-iq-$app"

    if [[ $app == 'admin' || $app == 'reports' ]]; then
        valet link --secure "${app}.biq.adventusairways"
        valet link --secure "${app}.biqdemo.brand-iq"
    fi
 
    valet link --secure "${app}.biq.brand-iq"

    ln -s "$HOME/.config/valet/Certificates/" ./storage/certificates

    composer install
    yarn install
    yarn prod

    if [[ ! -f '.env' ]]; then
        cp .env.example .env
        php artisan key:generate
    fi
done

# Repos for additional apps/sites
sites=(
    brand-iq-website
    creative-workflow
)

# Set up additional apps/sites
for site in "${sites[@]}"; do
    echo "Setting up $site"

    create_db "$site"

    git clone "git@github.com:brandiq/${site}.git" "$sites_dir/$site"
    cd "$sites_dir/$site"

    valet link --secure "${site}"

    ln -s "$HOME/.config/valet/Certificates/" ./storage/certificates

    composer install

    if [[ -f 'package.json' ]]; then
        if [[ -f 'yarn.lock' ]]; then
            yarn install
            yarn prod
        else
            npm install
            npm run prod
        fi
    fi

    if [[ ! -f '.env' && -f '.env.example' ]]; then
        cp .env.example .env
        php artisan key:generate
    fi
done

# Additional databases
db_names=(
    brand-iq-activities
    brand-iq-auth-activities
    brand-iq-test
    creative-workflow-activities
    creative-workflow-test
)

for db_name in "${db_names[@]}"; do
    echo "Creating additional $db_name database"

    create_db "$db_name"
done

unset create_db