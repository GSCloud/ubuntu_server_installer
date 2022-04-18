#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi
command -v snap >/dev/null 2>&1 || fail "Snap is NOT installed!"

info 'Installing SnapCraft apps\n'

info "Android Studio"
snap install android-studio --classic

info "Visual Studio Code"
snap install code --classic

info "Emote icons"
snap install emote

info "Brave browser"
snap install brave --classic

exit 0
