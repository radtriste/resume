FROM nginx

RUN mkdir /tmp/resume
COPY . /tmp/resume/

# Install asciidoctor
# Install asciidoctor-pdf
# Run generate.sh script

# COPY files
RUN cp /tmp/resume/dist/en/* /usr/share/nginx/html
RUN mkdir -p /usr/share/nginx/html/fr
RUN cp /tmp/resume/dist/en/* /usr/share/nginx/html/fr/