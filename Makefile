all: info

info:
	@echo "\e[1;32m👾 Welcome to Ubuntu Server Installer 👾"
	@echo "🆘 \e[0;1mmake composer\e[0m ➡️ install PHP Composer"
	@echo "🆘 \e[0;1mmake docs\e[0m ➡️ rebuild documentation"
	@echo "🆘 \e[0;1mmake go\e[0m ➡️ (re)install Go lang"
	@echo "🆘 \e[0;1mmake goapps\e[0m ➡️ (re)install Go apps"
	@echo "🆘 \e[0;1mmake php\e[0m ➡️ install PHP 7.4"
	@echo "🆘 \e[0;1mmake rustapps\e[0m ➡️ (re)install Rust apps"

docs:
	@/bin/bash ./create_pdf.sh

go:
	@cd ./bin/ && sudo /bin/bash ./go.sh

php:
	@cd ./bin/ && sudo /bin/bash ./php74.sh

composer:
	@cd ./bin/ && sudo /bin/bash ./composer.sh

goapps:
	@cd ./bin/ && /bin/bash ./apps-go.sh

rustapps:
	@cd ./bin/ && /bin/bash ./apps-rust.sh
