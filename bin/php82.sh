#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi

apt-get install -yq software-properties-common language-pack-en-base
LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php
LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/apache2
apt-get update -yq

info 'Installing PHP 8.2'

apt-get install -y libapache2-mod-php8.2 openssl php-imagick php-redis \
  php8.2 php8.2-cli php8.2-curl php8.2-gd php8.2-intl php8.2-mbstring \
  php8.2-mysql php8.2-readline php8.2-pgsql php8.2-sqlite3 php8.2-xml php8.2-zip php8.2-curl

update-alternatives --set php /usr/bin/php8.2

info 'Adding modules and Restarting Apache'

a2dismod php7.4 php8.0 php8.1 php8.3 php8.4
a2enmod php8.2 cloudflare expires headers info rewrite ssl status >/dev/null 2>&1
service apache2 restart >/dev/null 2>&1

info "Installation done."

php --version
