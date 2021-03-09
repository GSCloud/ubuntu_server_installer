#!/bin/bash
#@author Filip Oščádal <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

command -v nodejs >/dev/null 2>&1 || {
  info "Installing Node.js 13"
  sudo snap remove node
  sudo snap install node --channel=13/stable --classic
}

exit 0
