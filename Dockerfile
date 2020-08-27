FROM nginx

ARG LANG

COPY dist/$LANG/ /usr/share/nginx/html/