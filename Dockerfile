FROM nginx

COPY dist/ /usr/share/nginx/html/

RUN cp -r /usr/share/nginx/html/index/* /usr/share/nginx/html/ && rm -rf /usr/share/nginx/html/index