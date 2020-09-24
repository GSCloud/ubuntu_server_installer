all: info

info:
	@echo "\e[1;32m👾 Welcome to Ubuntu Server Installer 👾"
	@echo "🆘 \e[0;1mmake docs\e[0m ➡️ rebuild documentation"
	@echo "🆘 \e[0;1mmake go\e[0m ➡️ (re)install Go lang"
	@echo "🆘 \e[0;1mmake goapps\e[0m ➡️ (re)install Go apps"
	@echo "🆘 \e[0;1mmake rustapps\e[0m ➡️ (re)install Rust apps"

docs:
	@/bin/bash ./create_pdf.sh

go:
	@cd ./bin/ && sudo /bin/bash ./go.sh

goapps:
	@cd ./bin/ && /bin/bash ./apps-go.sh

rustapps:
	@cd ./bin/ && /bin/bash ./apps-rust.sh
