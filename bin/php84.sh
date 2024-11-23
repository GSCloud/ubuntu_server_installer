#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi

apt-get install -yq software-properties-common language-pack-en-base
LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php
LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/apache2
apt-get update -yq

info 'Installing PHP 8.3'

apt-get install -y libapache2-mod-php8.4 openssl php-imagick php-redis \
  php8.4 php8.4-cli php8.4-curl php8.4-gd php8.4-intl php8.4-mbstring \
  php8.4-mysql php8.4-readline php8.4-pgsql php8.4-sqlite3 php8.4-xml php8.4-zip php8.4-curl

update-alternatives --set php /usr/bin/php8.4

info 'Adding modules and Restarting Apache'

a2dismod php7.4 php8.0 php8.1 php8.2 php8.3
a2enmod php8.4 cloudflare expires headers info rewrite ssl status >/dev/null 2>&1
service apache2 restart >/dev/null 2>&1

info "Installation done."

php --version
