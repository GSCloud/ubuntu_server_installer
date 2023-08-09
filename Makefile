#@author Fred Brooker <git@gscloud.cz>
all: info

info:
	@echo "\e[1;32m👾 Welcome to Ubuntu Server Installer \e[0;1m"
	@echo ""
	@echo "— \e[0;1mmake docs\e[0m - build documentation"
	@echo "— \e[0;1mmake docker\e[0m - install Docker (snap)"
	@echo "— \e[0;1mmake node12\e[0m - install Node.js 12 (snap)"
	@echo "— \e[0;1mmake node14\e[0m - install Node.js 14 (snap)"
	@echo "— \e[0;1mmake node16\e[0m - install Node.js 16 (snap)"
	@echo "— \e[0;1mmake node18\e[0m - install Node.js 18 (snap)"
	@echo "— \e[0;1mmake php\e[0m - install PHP 8.2 (repo)"
	@echo "— \e[0;1mmake php74\e[0m - install PHP 7.4 (repo)"
	@echo "— \e[0;1mmake php80\e[0m - install PHP 8.0 (repo)"
	@echo "— \e[0;1mmake php81\e[0m - install PHP 8.1 (repo)"
	@echo "— \e[0;1mmake composer\e[0m - install PHP Composer"
	@echo "— \e[0;1mmake go\e[0m - install Go lang (online)"
	@echo "— \e[0;1mmake ruby\e[0m - install Ruby (snap)"
	@echo "— \e[0;1mmake rust\e[0m - install Rust (online)"
	@echo "— \e[0;1mmake deskapps\e[0m - install desktop apps (snap)"
	@echo "— \e[0;1mmake goapps\e[0m - install Go apps (repo)"
	@echo "— \e[0;1mmake rustapps\e[0m - install Rust apps (repo)"
docs:
	@bash ./bin/create_pdf.sh
go:
	@sudo bash ./bin/go.sh
ruby:
	@sudo bash ./bin/ruby.sh
rust:
	@bash ./bin/rust.sh
php:
	@sudo bash ./bin/php82.sh
php74:
	@sudo bash ./bin/php74.sh
php80:
	@sudo bash ./bin/php80.sh
php81:
	@sudo bash ./bin/php81.sh
php82:
	@sudo bash ./bin/php82.sh
composer:
	@sudo bash ./bin/composer.sh
deskapps:
	@sudo bash ./bin/apps-desktop.sh
goapps:
	@bash ./bin/apps-go.sh
rustapps:
	@bash ./bin/apps-rust.sh
node9:
	@bash ./bin/nodejs9.sh
node10:
	@bash ./bin/nodejs10.sh
node12:
	@bash ./bin/nodejs12.sh
node14:
	@bash ./bin/nodejs14.sh
node16:
	@bash ./bin/nodejs16.sh
node18:
	@bash ./bin/nodejs18.sh
docker:
	@sudo bash ./bin/docker.sh
