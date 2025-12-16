#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi

info 'Preparing installation'

apt-get install -yqq apache2-dev

info 'Installing Cloudflare module'

DIR=${PWD}
TMP="/tmp/cloudflare"

mkdir -p ${TMP}
cd ${TMP}
wget -O mod_cloudflare.c https://raw.githubusercontent.com/cloudflare/mod_cloudflare/master/mod_cloudflare.c
apxs -a -i -c mod_cloudflare.c
rm -rf ${TMP}
cd ${DIR}

info 'Restarting Apache'

a2enmod cloudflare expires headers info rewrite ssl status >/dev/null 2>&1
service apache2 restart >/dev/null 2>&1
