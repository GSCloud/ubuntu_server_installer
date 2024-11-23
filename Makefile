#@author Fred Brooker <git@gscloud.cz>
all: info

info:
	@echo "\e[1;32m👾 Ubuntu Server Installer \e[0;1m"
	@echo ""
	@echo "- \e[0;1mmake node18\e[0m - install Node.js 18 (snap)"
	@echo "- \e[0;1mmake node20\e[0m - install Node.js 20 (snap)"
	@echo "- \e[0;1mmake node22\e[0m - install Node.js 22 (snap)"

	@echo "- \e[0;1mmake composer\e[0m - install PHP Composer"
	@echo "- \e[0;1mmake php80\e[0m - install PHP 8.0 (repo)"
	@echo "- \e[0;1mmake php82\e[0m - install PHP 8.2 (repo)"
	@echo "- \e[0;1mmake php83\e[0m - install PHP 8.3 (repo)"
	@echo "- \e[0;1mmake php84\e[0m - install PHP 8.3 (repo)"

	@echo "- \e[0;1mmake go\e[0m - install Go lang (online)"
	@echo "- \e[0;1mmake goapps\e[0m - install Go apps (repo)"

	@echo "- \e[0;1mmake rust\e[0m - install Rust (online)"
	@echo "- \e[0;1mmake rustapps\e[0m - install Rust apps (repo)"

	@echo "- \e[0;1mmake ruby\e[0m - install Ruby (snap)"

	@echo "- \e[0;1mmake docs\e[0m - build documentation"
	@echo ""

docs:
	@bash ./bin/create_pdf.sh

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
php80:
	@sudo bash ./bin/php80.sh
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

docker:
	@sudo bash ./bin/docker.sh
