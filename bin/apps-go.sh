#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

command -v go >/dev/null 2>&1 || fail "Go is NOT installed!"

export GO111MODULE=on

info 'Installing Go apps\n'

info "lazydocker"
go get github.com/jesseduffield/lazydocker
echo -en "\n$(lazydocker --version)\n\n"

info "lazygit"
go get github.com/jesseduffield/lazygit
echo -en "\n$(lazygit --version)\n\n"

info "rclone"
go get github.com/rclone/rclone
echo -en "\n$(rclone --version)\n\n"

exit 0
