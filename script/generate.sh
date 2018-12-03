#!/bin/bash

EXEC_DIR=`pwd`
cd `dirname $0`
SCRIPT_DIR=`pwd`
cd $EXEC_DIR

cmdPrefix=$1
echo "Got cmdPrefix = $cmdPrefix"

lang="en"

$SCRIPT_DIR/generate_html.sh "$cmdPrefix" $lang
$SCRIPT_DIR/generate_pdf.sh "$cmdPrefix" $lang

lang="fr"

$SCRIPT_DIR/generate_html.sh "$cmdPrefix" $lang
$SCRIPT_DIR/generate_pdf.sh "$cmdPrefix" $lang