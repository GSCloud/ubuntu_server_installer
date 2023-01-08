#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

command -v rustc >/dev/null 2>&1 || fail "Rust is NOT installed!"
command -v cargo >/dev/null 2>&1 || fail "Cargo is NOT installed!"

info 'Checking existing Rust apps\n'

command -v bat >/dev/null 2>&1 && echo -en "bat\n$(bat --version)\n\n"
command -v xsv >/dev/null 2>&1 && echo -en "xsv\n$(xsv --version)\n\n"
command -v fd >/dev/null 2>&1 && echo -en "fd\n$(fd --version)\n\n"
command -v bandwhich >/dev/null 2>&1 && echo -en "bandwhich\n$(bandwhich --version)\n\n"
command -v exa >/dev/null 2>&1 && echo -en "exa\n$(exa --version)\n\n"

yes_or_no "Stop installation?" && exit 0

info "bat"
cargo install bat || fail build failed
echo -en "$(bat --version)\n\n"

info "xsv"
cargo install xsv || fail build failed
echo -en "$(xsv --version)\n\n"

info "fd"
cargo install fd-find || fail build failed
echo -en "$(fd --version)\n\n"

info "bandwhich"
cargo install bandwhich || fail build failed
echo -en "$(bandwhich --version)\n\n"

info "exa"
cargo install exa || fail build failed
echo -en "$(exa --version)\n\n"

exit 0
