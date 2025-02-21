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
	@echo "\e[1;32m👾 Ubuntu Server Installer \e[0;1m"
	@echo ""
	@echo "\e${B}node18${R}\t - Node.js 18 (snap)"
	@echo "\e${B}node20${R}\t - Node.js 20 (snap)"
	@echo "\e${B}node22${R}\t - Node.js 22 (snap)"
	@echo ""
	@echo "\e${B}composer${R} - PHP Composer"
	@echo "\e${B}php82${R}\t - PHP 8.2 (repo)"
	@echo "\e${B}php83${R}\t - PHP 8.3 (repo)"
	@echo "\e${B}php84${R}\t - PHP 8.4 (repo)"
	@echo ""
	@echo "\e${B}go${R}\t - Go (online)"
	@echo "\e${B}goapps${R}\t - Go apps (repo)"
	@echo ""
	@echo "\e${B}rust${R}\t - Rust (online)"
	@echo "\e${B}rustapps${R} - Rust apps (repo)"
	@echo ""
	@echo "\e${B}ruby${R}\t - Ruby (snap)"
	@echo "\e${B}docs${R}\t - build documentation"
	@echo ""

docs:
ifneq ($(strip $(has_docker)),)
	@find . -maxdepth 1 -iname "*.md" -exec echo "converting {} to ADOC" \; -exec docker run --rm -v "$$(pwd)":/data pandoc/core -f markdown -t asciidoc -i "{}" -o "{}.adoc" \;
	@find . -maxdepth 1 -iname "*.adoc" -exec echo "converting {} to PDF" \; -exec docker run --rm -v "$$(pwd)":/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf -a allow-uri-read -a icons=font -a icon-set=fas -d book "{}" \;
	@find . -maxdepth 1 -iname "*.adoc" -delete
endif

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

deskapps:
	@sudo bash ./bin/apps-desktop.sh

node18:
	@bash ./bin/nodejs18.sh
node20:
	@bash ./bin/nodejs20.sh
node22:
	@bash ./bin/nodejs22.sh
node24:
	@bash ./bin/nodejs24.sh
