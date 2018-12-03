#!/bin/bash

./script/generate.sh "docker run --rm -v $(pwd):/documents/ asciidoctor/docker-asciidoctor"