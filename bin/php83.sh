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

apt-get install -y libapache2-mod-php8.3 openssl php-imagick php-redis \
  php8.3 php8.3-cli php8.3-curl php8.3-gd php8.3-intl php8.3-mbstring \
  php8.3-mysql php8.3-readline php8.3-pgsql php8.3-sqlite3 php8.3-xml php8.3-zip php8.3-curl

update-alternatives --set php /usr/bin/php8.3

info 'Adding modules and Restarting Apache'

a2dismod php7.4 php8.0 php8.1 php8.2 php8.4
a2enmod php8.3 cloudflare expires headers info rewrite ssl status >/dev/null 2>&1
service apache2 restart >/dev/null 2>&1

info "Installation done."

php --version
