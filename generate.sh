#!/bin/bash

EXEC_DIR=`pwd`
cd `dirname $0`
SCRIPT_DIR=`pwd`
cd $EXEC_DIR

# Constants
STYLE_HTML="fedora.css"
STYLE_PDF="theme.yml"
OUTPUT_DIR="dist"
INPUT_DIR_DOCS="docs"

# Variables
unset lang
unset baseUrl

unset inputDir
unset outputDir
unset outputFile

function generate_html {	
	local outputFile="index.html"
	local outputDir="$OUTPUT_DIR/$lang"
	
	htmlCmdArgs="-a stylesheet=$EXEC_DIR/themes/html/$STYLE_HTML -a icons -a toc2 -a toclevels=3 -a lang=$lang -a website_url=../ -o $outputDir/$outputFile $inputDir/index.adoc"
	
	echo "Generate with HTML cmdPrefix = $cmdPrefix and lang = $lang"
	cmd="asciidoctor $htmlCmdArgs"
	echo $cmd
	eval "$cmd"
	
	cp ./themes/html/asciidoctor.css $outputDir
	cp -r $inputDir/images/ $outputDir
}

function generate_pdf {	
	local outputFile="radisson_resume.pdf"
	local outputDir="$OUTPUT_DIR/$lang"
	
	pdfCmdArgs="-a pdf-style=$EXEC_DIR/themes/pdf/$STYLE_PDF -a lang=$lang -a website_url=../ -o $outputDir/$outputFile $inputDir/index.adoc"
	
	echo "Generate with HTML cmdPrefix = $cmdPrefix and lang = $lang"
	cmd="asciidoctor-pdf $pdfCmdArgs"
	echo $cmd
	
	eval "$cmd"
}

echo "Got cmdPrefix = $cmdPrefix"

rm -rf dist/

inputDir=$INPUT_DIR_DOCS

lang="en"
generate_html
generate_pdf

lang="fr"
generate_html
generate_pdf

# Generate main index.html
cmd="-a stylesheet=$EXEC_DIR/themes/html/$STYLE_HTML -a icons -o $OUTPUT_DIR/index/index.html index.adoc"
eval "asciidoctor $cmd"
cp ./themes/html/asciidoctor.css $OUTPUT_DIR/index/
cp -r ./images $OUTPUT_DIR/index