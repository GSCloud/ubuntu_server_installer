#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

command -v rustc >/dev/null 2>&1 || fail "Rust is NOT installed!"
command -v cargo >/dev/null 2>&1 || fail "Cargo is NOT installed!"

info 'Installing Rust apps\n'

info "bat"
cargo install bat --force || fail Build failed.
echo -en "\n$(bat --version)\n\n"

info "wrangler"
cargo install wrangler --force || fail Build failed.
echo -en "\n$(wrangler --version)\n\n"

info "fd"
cargo install fd-find --force || fail Build failed.
echo -en "\n$(fd --version)\n\n"

exit 0
