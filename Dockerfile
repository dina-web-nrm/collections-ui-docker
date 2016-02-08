FROM nginx

COPY nginx-html /usr/share/nginx/html
COPY nginx-conf /etc/nginx/conf.d

