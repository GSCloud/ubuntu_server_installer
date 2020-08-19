#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

command -v go >/dev/null 2>&1 || fail "Go is NOT installed!"

info 'Installing Go apps ...\n'
sleep 2

export GO111MODULE=on

info "lazydocker"
go get github.com/jesseduffield/lazydocker
echo -en "\n"
lazydocker --version
echo -en "\n"

info "lazygit"
go get github.com/jesseduffield/lazygit
echo -en "\n"
lazygit --version
echo -en "\n"

info "rclone"
go get github.com/rclone/rclone
echo -en "\n"
rclone --version
echo -en "\n"
