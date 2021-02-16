#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi
command -v wget >/dev/null 2>&1 || fail "wget is NOT installed!"

info 'Downloading Go ...'

T="/tmp/go1.15.8.tar.gz"
if [ ! -f "$T" ]; then
  sleep 2
  wget -O $T 'https://dl.google.com/go/go1.15.8.linux-amd64.tar.gz'
fi

info 'Removing old Go ...'
sleep 2

rm -rf /usr/local/go

info 'Installing Go ...'

tar -C /usr/local -xzf $T
/usr/local/go/bin/go version

yes_or_no "Remove temporary file?" && rm -f $T

source $HOME/.profile
info 'Remember to add: "export PATH=$PATH:/usr/local/go/bin" to your profile!'

exit 0
