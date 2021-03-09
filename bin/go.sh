#!/bin/bash
#@author Filip Oščádal <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi
command -v wget >/dev/null 2>&1 || fail "wget is NOT installed!"

info 'Downloading Go'

T="/tmp/go1.16.tar.gz"
if [ ! -f "$T" ]; then
  wget -O $T 'https://dl.google.com/go/go1.16.linux-amd64.tar.gz'
fi

info 'Removing Go'
rm -rf /usr/local/go

info 'Installing Go'

tar -C /usr/local -xzf $T
/usr/local/go/bin/go version

yes_or_no "Remove temporary file?" && rm -f $T

info 'Remember to add: "export PATH=$PATH:/usr/local/go/bin;export GOROOT=/usr/local/go;export GOPATH=$HOME/go" to your profile!'

exit 0
