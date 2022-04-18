#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi

if [ ! -f "/usr/bin/php8.0" ]; then
  info 'Preparing installation'

  apt-get install -yq software-properties-common language-pack-en-base
  LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php

  apt-get update -yqq

  info 'Installing PHP 8.0'

  apt-get install -y libapache2-mod-php8.0 openssl php-imagick php-redis \
    php8.0 php8.0-cli php8.0-curl php8.0-gd php8.0-intl php8.0-mbstring \
    php8.0-mysql php8.0-readline php8.0-pgsql php8.0-sqlite3 php8.0-xml php8.0-zip
fi
apt-get install -y libapache2-mod-php8.0
update-alternatives --set php /usr/bin/php8.0

info 'Adding modules and Restarting Apache'

a2dismod php7.4 php8.1
a2enmod php8.0 cloudflare expires headers info rewrite ssl status >/dev/null 2>&1
service apache2 restart >/dev/null 2>&1

info "Installation done."

php --version

exit 0
