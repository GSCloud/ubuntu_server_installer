#!/bin/bash
#@author Filip Oščádal <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi
command -v php >/dev/null 2>&1 || fail "PHP is NOT installed!"

info 'Installing Composer'

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
rm -rf ~/.composer

composer -V

exit 0
