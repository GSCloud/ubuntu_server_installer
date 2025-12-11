#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi

info 'Updating APT'

dpkg --configure -a
apt-get update -qq
apt-get upgrade -yq

info 'Installing basic packages'

LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:git-core/ppa
apt-get install -y apache2 apache2-dev curl dkms git-core gitk haveged htop iptables \
  language-pack-en language-pack-en-base man mc nano ntp openssl p7zip software-properties-common \
  traceroute tree ufw whois jq parallel rename imagemagick

info 'Updating APT'

dpkg --configure -a
apt-get update -qq
apt-get install -fqq

info 'Updating security and locales'

update-rc.d haveged defaults
locale-gen en_US.UTF-8

if [ ! -d "/etc/webmin" ]; then
  info 'Installing Webmin 2.610'
  wget -O /tmp/webmin.deb http://prdownloads.sourceforge.net/webadmin/webmin_2.610_all.deb
  dpkg -i /tmp/webmin.deb
  apt-get install -fqq
fi

info 'Updating APT'

dpkg --configure -a
apt-get update -qq

info 'Adding symbolic links'

rm /sites >/dev/null 2>&1
ln -s /etc/apache2/sites-available/ /sites
rm /logs >/dev/null 2>&1
ln -s /var/log/apache2/ /logs
