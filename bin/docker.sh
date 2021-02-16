#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi

info 'Removing old Docker ...'

apt-get remove -yq docker docker-engine docker.io
snap remove docker

info 'Installing new Docker ...'

snap install docker
sudo /snap/bin/docker --version

if groups $(whoami) | grep -q '\bdocker\b'
then
    echo "You are member of the docker group."
else
    echo "You should add yourself into the docker group."
fi

exit 0
