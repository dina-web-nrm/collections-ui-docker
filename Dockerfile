FROM nginx

RUN apt-get install tar

ADD https://github.com/DINA-Web/collections-ui/releases/download/v0.1.10/release.tar.gz /tmp/

RUN cd /tmp && tar -xvzf /tmp/release.tar.gz && \
    mv /tmp/dw-collection-manager/* /usr/share/nginx/html && \
    rm -r /tmp/dw-collection-manager/ && rm /tmp/release.tar.gz

RUN export NEW_HOST=https://beta-api.dina-web.net && \
    sed -i 's@REPLACEWITHHOST@'"$NEW_HOST"'@g' /usr/share/nginx/html/index.html

COPY nginx-conf /etc/nginx/conf.d
