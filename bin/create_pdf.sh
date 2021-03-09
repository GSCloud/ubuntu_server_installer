#!/bin/bash
#@author Filip Oščádal <git@gscloud.cz>

dir="$(dirname "$0")"
. "$dir/_includes.sh"

command -v docker >/dev/null 2>&1 || fail "Docker is NOT installed!"

# MarkDown -> ADOC
find . -iname "*.md" -exec echo "Converting {} to ADOC" \; \
    -exec docker run --rm -u $(id -u ${USER}):$(id -g ${USER}) -v "$(pwd)":/data pandoc/core -f markdown -t asciidoc -i {} -o "{}.adoc" \;

# ADOC -> PDF
find . -iname "*.adoc" -exec echo "Converting {} to PDF" \; \
    -exec docker run --rm -u $(id -u ${USER}):$(id -g ${USER}) -v $(pwd):/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf -a allow-uri-read -d book "{}" \;

exit 0
