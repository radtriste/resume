#!/bin/bash

export WEBSITE_URL_FR="../"
export WEBSITE_URL_EN="../"

export GENERATION_LANG="en"
./generate.sh en

export GENERATION_LANG="fr"
./generate.sh fr