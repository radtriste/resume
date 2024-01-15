#!/bin/sh

DIST_FOLDER="dist"

# Constants
STYLE_HTML="fedora.css"
STYLE_PDF="themes/default-theme.yml"
PDF_FILE_FR="radisson_cv.pdf"
PDF_FILE_EN="radisson_resume.pdf"

# Calculate age
msPerYear=31536000
mydate=`date --date="1986-08-06 00:00:00" +%s`
now=`date +%s`
diff=`expr $now - $mydate`
PDF_AGE=`expr $diff / $msPerYear`
echo "Age = $PDF_AGE"

# Setup variables
if test -z "$GENERATION_LANG"; then
	echo "No GENERATION_LANG env variable found"
	exit 1
fi

if test "$GENERATION_LANG" = "en"; then
	PDF_FILENAME=$PDF_FILE_EN
	WEBSITE_URL=$WEBSITE_URL_EN
elif test "$GENERATION_LANG" = "fr"; then
	PDF_FILENAME=$PDF_FILE_FR
	WEBSITE_URL=$WEBSITE_URL_FR
else
	echo "Unknown language ..."
	return 1
fi

OUTPUT_DIR="$DIST_FOLDER/$GENERATION_LANG"
COMMON_GENERATION_ARGS="-a website_fr=$WEBSITE_URL_FR -a website_en=$WEBSITE_URL_EN -a lang=$GENERATION_LANG -a website_url=$WEBSITE_URL"
COMMON_GENERATION_HTML_ARGS="-a stylesheet=themes/html/$STYLE_HTML -a icons -a toc2 -a toclevels=3 -a pdfName=$PDF_FILENAME"
COMMON_GENERATION_PDF_ARGS="-a pdf-theme=themes/pdf/$STYLE_PDF -a age_nb=$PDF_AGE"


# Launch commands
rm -rf $OUTPUT_DIR
mkdir -p $OUTPUT_DIR

# Generate HTML
cmd="$GENERATION_COMMAND_PREFIX asciidoctor $COMMON_GENERATION_ARGS $COMMON_GENERATION_HTML_ARGS -o $OUTPUT_DIR/index.html html.adoc"
echo $cmd
$cmd
cp themes/html/asciidoctor.css $OUTPUT_DIR
cp -r images/ $OUTPUT_DIR
#ls -al $OUTPUT_DIR

# Generate pdf
cmd="$GENERATION_COMMAND_PREFIX asciidoctor-pdf $COMMON_GENERATION_ARGS $COMMON_GENERATION_PDF_ARGS -o $OUTPUT_DIR/$PDF_FILENAME pdf.adoc"
echo $cmd
$cmd
#ls -al $OUTPUT_DIR
