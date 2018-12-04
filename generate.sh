#!/bin/bash

EXEC_DIR=`pwd`
cd `dirname $0`
SCRIPT_DIR=`pwd`
cd $EXEC_DIR

# Constants
STYLE_HTML="fedora.css"
STYLE_PDF="theme.yml"
OUTPUT_DIR="dist"

unset outputDir
unset pdfOutputFile

function generate_html {		
	htmlCmdArgs="-a stylesheet=$EXEC_DIR/themes/html/$STYLE_HTML -a icons -a toc2 -a toclevels=3 -a lang=$lang -a website_fr=../fr/ -a website_en=../en/  -a website_prefix=$website_prefix -a pdfName=$pdfOutputFile -o $outputDir/index.html index.adoc"
	
	echo "Generate with HTML cmdPrefix = $cmdPrefix and lang = $lang"
	cmd="asciidoctor $htmlCmdArgs"
	echo $cmd
	eval "$cmd"
	
	cp ./themes/html/asciidoctor.css $outputDir
	cp -r images/ $outputDir
}

function generate_pdf {		
	pdfCmdArgs="-a pdf-style=$EXEC_DIR/themes/pdf/$STYLE_PDF -a lang=$lang -a website_fr=../fr/ -a website_en=../en/ -a website_prefix=$website_prefix -o $outputDir/$pdfOutputFile index.adoc"
	
	echo "Generate with HTML cmdPrefix = $cmdPrefix and lang = $lang"
	cmd="asciidoctor-pdf $pdfCmdArgs"
	echo $cmd
	
	eval "$cmd"
}

lang=$1

if [[ -z "$lang" ]]; then
	lang="en"
fi

if [[ "$lang" = "en" ]]; then
	pdfOutputFile="radisson_resume.pdf"
	website_prefix="resume"
elif [[ "$lang" = "fr" ]]; then
	pdfOutputFile="radisson_cv.pdf"
	website_prefix="cv"
else
	echo "Unknown language ..."
	return 1
fi

outputDir="$OUTPUT_DIR/$lang"
rm -rf outputDir

generate_html
generate_pdf