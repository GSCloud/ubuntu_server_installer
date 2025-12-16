#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

command -v nodejs >/dev/null 2>&1 || {
  info "Installing Node.js 23"
  sudo snap remove node
  sudo snap install node --channel=23/stable --classic
}
