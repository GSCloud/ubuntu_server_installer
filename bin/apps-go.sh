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

if groups $(whoami) | grep -q '\bdocker\b'
then
    echo "You are member of the docker group."
else
    echo "You should add yourself into the docker group."
fi

exit 0
