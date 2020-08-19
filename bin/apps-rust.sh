#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

command -v rustc >/dev/null 2>&1 || fail "Rust is NOT installed!"
command -v cargo >/dev/null 2>&1 || fail "Cargo is NOT installed!"

info 'Installing Rust apps ...\n'
sleep 2

info "bat"
cargo install bat
echo -en "\n"
bat --version
echo -en "\n"

info "wrangler"
cargo install wrangler
echo -en "\n"
wrangler --version
echo -en "\n"
