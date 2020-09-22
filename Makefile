all: info

info:
	@echo "🆘  make docs ➡️ rebuild *.adoc and *.PDF"

docs:
	@/bin/bash ./create_pdf.sh
