#!/bin/bash
#@author Filip Oščádal <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root."; fi

info 'Copying DIST files'

rm /var/www/html/index.html >/dev/null 2>&1

if [ -d "../dist" ]; then
  rsync -av ../dist/* /
  /etc/webmin/restart
else
  fail 'The DIST folder "dist/" is missing!'
fi

exit 0
