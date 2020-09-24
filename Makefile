all: info

info:
	@echo "\e[1;32m👾 Welcome to Ubuntu Server Installer 👾"
	@echo "🆘 \e[0;1mmake docs\e[0m ➡️ rebuild documentation"
	@echo "🆘 \e[0;1mmake go\e[0m ➡️ (re)install Go lang"

docs:
	@/bin/bash ./create_pdf.sh

go:
	@cd ./bin/ && sudo /bin/bash ./go.sh
