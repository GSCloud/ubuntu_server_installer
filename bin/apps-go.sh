#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

command -v go >/dev/null 2>&1 || fail "go is NOT installed!"
command -v gcc >/dev/null 2>&1 || fail "gcc is NOT installed!"
export GO111MODULE=on

info 'Checking existing Go apps\n'

command -v bat >/dev/null 2>&1 && echo -en "lazydocker\n$(lazydocker version)\n\n"
command -v bat >/dev/null 2>&1 && echo -en "rclone\n$(rclone version)\n\n"

yes_or_no "Stop installation?" && exit 0

if [ -z ${GOPATH+x} ]; then fail "GOPATH is unset"; else info "GOPATH is set to '$GOPATH'\n"; fi

info lazydocker
go install github.com/jesseduffield/lazydocker@latest || fail Build failed.
echo -en "lazydocker\n$(lazydocker --version)\n"

info rclone
git clone https://github.com/rclone/rclone.git
cd rclone

info Building binary...
go build
cp ./rclone ~/go/bin/rclone.new
cp ./rclone ~/go/bin/
cd ..
rm -rf rclone

echo -en "rclone\n$(rclone --version)\n"
