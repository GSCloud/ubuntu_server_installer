#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi

info 'Adding 4GB SWAP'

grep swap /etc/fstab -q >/dev/null 2>&1
if [ $? -eq 1 ]; then
  swapoff -a
  fallocate -l 4G /swapfile
  chmod 0600 /swapfile
  mkswap /swapfile
  swapon /swapfile
  echo "/swapfile none swap sw 0 0" >> /etc/fstab
else
  warn 'SWAP is already activated'
fi

info 'Setting SSH folder'

mkdir -p ~/.ssh
chmod 0700 ~/.ssh
chmod 0600 ~/.ssh/* >/dev/null 2>&1
