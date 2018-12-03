#!/bin/bash

htmlCss="ubuntu.css"

cmdPrefix=$1
lang=$2
outputDir="dist/$lang"
outputFile="index.html"

htmlCmdArgs="-a stylesheet=./themes/html/$htmlCss -a data-uri -a icons -a toc2 -a toclevels=3 -a lang=$lang -o $outputDir/$outputFile index.adoc"

echo "Generate with HTML cmdPrefix = $cmdPrefix and lang = $lang"
cmd="$cmdPrefix asciidoctor $htmlCmdArgs"
echo $cmd

eval "$cmd"

cp ./themes/html/asciidoctor.css $outputDir
