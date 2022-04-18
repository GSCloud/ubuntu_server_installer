#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi

if [ ! -f "/usr/bin/php7.4" ]; then
  info 'Preparing installation'

  apt-get install -yq software-properties-common language-pack-en-base
  LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php

  apt-get update -yqq

  info 'Installing PHP 7.4'

  apt-get install -y libapache2-mod-php7.4 openssl php-imagick php-redis \
    php7.4 php7.4-cli php7.4-curl php7.4-gd php7.4-intl php7.4-json php7.4-mbstring \
    php7.4-mysql php7.4-readline php7.4-pgsql php7.4-sqlite3 php7.4-xml php7.4-zip
fi
apt-get install -y libapache2-mod-php7.4
update-alternatives --set php /usr/bin/php7.4

info 'Adding modules and Restarting Apache'

a2dismod php8.0 php8.1
a2enmod php7.4 cloudflare expires headers info rewrite ssl status >/dev/null 2>&1
service apache2 restart >/dev/null 2>&1

info "Installation done."

php --version

exit 0
