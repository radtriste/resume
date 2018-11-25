#!/bin/bash

asciidoctor -a data-uri -a icons -a toc2 -a toclevels=3 -a lang=en -o dist/en/index.html index.adoc
asciidoctor -a data-uri -a icons -a toc2 -a toclevels=3 -a lang=fr -o dist/fr/index.html index.adoc

asciidoctor-pdf -a lang=en -o dist/en/index.pdf index.adoc
asciidoctor-pdf -a lang=fr -o dist/fr/index.pdf index.adoc
