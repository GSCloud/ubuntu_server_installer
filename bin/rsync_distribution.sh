#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root."; fi

info 'Copying the DISTRIBUTION ...'

rm /var/www/html/index.html >/dev/null 2>&1

if [ -d "../dist" ]; then
  rsync -av ../dist/* /
  /etc/webmin/restart
else
  fail 'The DISTRIBUTION folder "dist" is missing!'
fi

exit 0
