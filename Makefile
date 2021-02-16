all: info

info:
	@echo "\e[1;32m👾 Welcome to Ubuntu Installer 👾\n"

	@echo "🆘 \e[0;1mmake docs\e[0m - build documentation\n"

	@echo "🆘 \e[0;1mmake node9\e[0m - install Node.js 9"
	@echo "🆘 \e[0;1mmake node10\e[0m - install Node.js 10"
	@echo "🆘 \e[0;1mmake node12\e[0m - install Node.js 12"
	@echo "🆘 \e[0;1mmake node13\e[0m - install Node.js 13"
	@echo "🆘 \e[0;1mmake node14\e[0m - install Node.js 14\n"

	@echo "🆘 \e[0;1mmake php\e[0m - install PHP 8.0"
	@echo "🆘 \e[0;1mmake php74\e[0m - install PHP 7.4"
	@echo "🆘 \e[0;1mmake composer\e[0m - install PHP Composer\n"

	@echo "🆘 \e[0;1mmake go\e[0m - install Go language"
	@echo "🆘 \e[0;1mmake ruby\e[0m - install Ruby language"
	@echo "🆘 \e[0;1mmake rust\e[0m - install Rust language"
	@echo "🆘 \e[0;1mmake goapps\e[0m - install Go apps"
	@echo "🆘 \e[0;1mmake rustapps\e[0m - install Rust apps\n"

docs:
	@bash ./bin/create_pdf.sh

go:
	@sudo bash ./bin/go.sh

ruby:
	@sudo bash ./bin/ruby.sh

rust:
	@sudo bash ./bin/rust.sh

php:
	@sudo bash ./bin/php80.sh

php74:
	@sudo bash ./bin/php74.sh

composer:
	@sudo bash ./bin/composer.sh

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

node13:
	@bash ./bin/nodejs13.sh

node14:
	@bash ./bin/nodejs14.sh
