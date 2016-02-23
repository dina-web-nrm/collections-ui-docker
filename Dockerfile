FROM nginx

RUN apt-get install tar

ADD https://github.com/DINA-Web/collections-ui/releases/download/v0.1.2/release.tar.gz /tmp/

RUN cd /tmp && tar -xvzf /tmp/release.tar.gz && \
    mv /tmp/dw-collection-manager/* /usr/share/nginx/html && \
    rm -r /tmp/dw-collection-manager/ && rm /tmp/release.tar.gz

# Set the hostname to the API by using the NEW_HOST environment variable.
# The variable should be in the format 'http://example.com/api'.
# This is specified in the docker-compose.yml-file.

RUN echo $NEW_HOST && \
    echo $DEBUG && echo DEBUG && \
    export NEW_HOST=http://beta.dina-web.net:81 && \
    sed -i 's@REPLACEWITHHOST@'"$NEW_HOST"'@g' /usr/share/nginx/html/index.html

COPY nginx-conf /etc/nginx/conf.d
