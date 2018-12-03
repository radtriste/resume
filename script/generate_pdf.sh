#!/bin/bash

pdfStyle="theme.yml"

cmdPrefix=$1
lang=$2
outputDir="dist/$lang"
outputFile="radisson_resume.pdf"

pdfCmdArgs="-a pdf-style=./themes/pdf/$pdfStyle -a lang=$lang -o $outputDir/$outputFile index.adoc"

echo "Generate with HTML cmdPrefix = $cmdPrefix and lang = $lang"
cmd="$cmdPrefix asciidoctor-pdf $pdfCmdArgs"
echo $cmd

eval "$cmd"
