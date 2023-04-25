FROM alpine:latest
RUN apk-get -y update && install java* -y
COPY . /usr/local/apache2/htdocs/

EXPOSE 80

CMD [ "httpd-foreground" ]
