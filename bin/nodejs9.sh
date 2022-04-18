#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

command -v nodejs >/dev/null 2>&1 || {
  info "Installing Node.js 9"
  sudo snap remove node
  sudo snap install node --channel=9/stable --classic
}

exit 0
