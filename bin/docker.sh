#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi

info 'Removing Docker'

apt-get remove -yq docker docker-engine docker.io
snap remove docker

info 'Installing Docker'

snap install docker
sudo /snap/bin/docker --version

if groups $(whoami) | grep -q '\bdocker\b'
then
    info "You are member of the docker group."
else
    warn "You should add yourself into the docker group."
fi

exit 0
