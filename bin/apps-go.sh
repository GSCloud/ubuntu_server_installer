#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

command -v go >/dev/null 2>&1 || fail "Go is NOT installed!"
export GO111MODULE=on

info "Installing Go apps"
if [ -z ${GOPATH+x} ]; then fail "GOPATH is unset"; else info "GOPATH is set to '$GOPATH'\n"; fi

info lazydocker
go get github.com/jesseduffield/lazydocker
echo -en "\n$(lazydocker --version)\n\n"

info lazygit
go get github.com/jesseduffield/lazygit
echo -en "\n$(lazygit --version)\n\n"

info rclone
go get github.com/rclone/rclone
echo -en "\n$(rclone --version)\n\n"

info cointop
go get github.com/miguelmota/cointop
echo -en "\n$(cointop --version)\n\n"

info hugo
mkdir -p $GOPATH/src
cd $GOPATH/src
[ -d "hugo" ] || git clone https://github.com/gohugoio/hugo.git
cd hugo
git pull
go install
echo -en "\n$(hugo version)\n\n"

info fac
go get github.com/mkchoi212/fac
echo -en "\n$(fac --version)\n\n"

exit 0
