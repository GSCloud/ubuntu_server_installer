#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi

if [ ! -f "/usr/bin/php8.1" ]; then
  info 'Preparing installation'

  apt-get install -yq software-properties-common language-pack-en-base
  LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php

  apt-get update -yqq

  info 'Installing PHP 8.1'

  apt-get install -y libapache2-mod-php8.1 openssl php-imagick php-redis \
    php8.1 php8.1-cli php8.1-curl php8.1-gd php8.1-intl php8.1-mbstring \
    php8.1-mysql php8.1-readline php8.1-pgsql php8.1-sqlite3 php8.1-xml php8.1-zip
fi
apt-get install -y libapache2-mod-php8.1
update-alternatives --set php /usr/bin/php8.1

info 'Adding modules and Restarting Apache'

a2dismod php7.4 php8.0
a2enmod php8.1 cloudflare expires headers info rewrite ssl status >/dev/null 2>&1
service apache2 restart >/dev/null 2>&1

info "Installation done."

php --version

exit 0
