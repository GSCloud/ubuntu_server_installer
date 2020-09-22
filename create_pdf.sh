#!/bin/bash

find . -type f -iname "*.md" -exec docker run --rm -v "$(pwd)":/data pandoc/core -f markdown -t asciidoc -i {} -o {}.adoc \;
find . -type f -iname "*.adoc" -exec docker run --rm -v $(pwd):/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf -a allow-uri-read -d book {} \;
