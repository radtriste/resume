FROM nginx

ARG LANG
ARG DIST_FOLDER="dist"

COPY $DIST_FOLDER/$LANG/ /usr/share/nginx/html/