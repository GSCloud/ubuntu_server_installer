#@author Fred Brooker <git@gscloud.cz>
MAKEFLAGS += --no-print-directory
has_docker != command -v docker 2>/dev/null

B := \e[0;1m
L := \e[0;2m
R := \e[0m
GREEN  := \e[0;32m
RED    := \e[0;31m
YELLOW := \e[0;33m
BLUE   := \e[0;34m

all: info
info:
	@echo "\e[1;32m♥️ Ubuntu Server Installer \e[0;1m"
	@echo ""
	@echo "\e${B}node20${R}\t - Node.js v20 (snap)"
	@echo "\e${B}node22${R}\t - Node.js v22 (snap)"
	@echo "\e${B}node23${R}\t - Node.js v23 (snap)"
	@echo ""
	@echo "\e${B}composer${R} - PHP Composer"
	@echo "\e${B}php82${R}\t - PHP v8.2 (repo)"
	@echo "\e${B}php83${R}\t - PHP v8.3 (repo)"
	@echo "\e${B}php84${R}\t - PHP v8.4 (repo)"
	@echo ""
	@echo "\e${B}go${R}\t - Go (online)"
	@echo "\e${B}goapps${R}\t - Go apps (repo)"
	@echo "\e${B}rust${R}\t - Rust (online)"
	@echo "\e${B}rustapps${R} - Rust apps (repo)"
go:
	@sudo bash ./bin/go.sh
goapps:
	@bash ./bin/apps-go.sh

ruby:
	@sudo bash ./bin/ruby.sh

rust:
	@bash ./bin/rust.sh
rustapps:
	@bash ./bin/apps-rust.sh

composer:
	@sudo bash ./bin/composer.sh

php82:
	@sudo bash ./bin/php82.sh
php83:
	@sudo bash ./bin/php83.sh
php84:
	@sudo bash ./bin/php84.sh

node20:
	@bash ./bin/nodejs20.sh
node22:
	@bash ./bin/nodejs22.sh
node23:
	@bash ./bin/nodejs23.sh
