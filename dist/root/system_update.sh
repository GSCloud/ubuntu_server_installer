#!/bin/bash
#@author Filip Oščádal <cio@gscloud.cz>

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root."
  exit 1
fi


DH="/etc/dhparams.pem"

cd /root

mkdir -p $HOME/.ssh
chmod 0700 $HOME/.ssh
chmod 0600 $HOME/.ssh/*

echo "Updating APT ..."

apt-get update -yqq
apt-get install -fyqq
dpkg --configure -a
apt-get upgrade -yq
apt-get autoremove

if [ ! -s $DH ]; then
  openssl dhparam -out $DH 2048
else
  echo -e 'DH params OK\n'
fi

if [ ! -d "acme.sh" ]; then
  git clone https://github.com/Neilpang/acme.sh.git
else
  echo -e 'acme.sh OK\n'
fi

/root/acme.sh/acme.sh --upgrade
