all: info

info:
	@echo "🆘 make docs ➡️ rebuild documentation"

docs:
	@/bin/bash ./create_pdf.sh
