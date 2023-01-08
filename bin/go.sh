#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi
command -v wget >/dev/null 2>&1 || fail "wget is NOT installed!"

info 'Downloading Go'

T="/tmp/go1.19.4.tar.gz"
if [ ! -f "$T" ]; then
  wget -O $T 'https://dl.google.com/go/go1.19.4.linux-amd64.tar.gz'
fi

info 'Removing previous Go'
rm -rf /usr/local/go >/dev/null 2>&1

info 'Installing Go'

tar -C /usr/local -xzf $T
/usr/local/go/bin/go version

yes_or_no "Remove temporary file?" && rm -f $T

info "Remember to add these lines to your profile:\n\nexport PATH="'$PATH:/usr/local/go/bin'"\n"'export GOROOT=/usr/local/go\nexport GOPATH=$HOME/go'"\n"

exit 0
