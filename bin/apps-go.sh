#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

command -v go >/dev/null 2>&1 || fail "Go is NOT installed!"
export GO111MODULE=on

info "Installing Go apps"
if [ -z ${GOPATH+x} ]; then fail "GOPATH is unset"; else info "GOPATH is set to '$GOPATH'\n"; fi

info lazydocker
go install github.com/jesseduffield/lazydocker@latest || fail Build failed.
echo -en "\n$(lazydocker --version)\n\n"

info rclone
git clone https://github.com/rclone/rclone.git
cd rclone
info Building binary...
go build
cp ./rclone ~/go/bin/rclone.new
cp ./rclone ~/go/bin/
cd ..
rm -rf rclone
echo -en "\n$(rclone --version)\n\n"

exit 0
