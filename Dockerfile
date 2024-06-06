FROM ubuntu:20.04 AS builder

RUN apt-get update && apt-get install -y apache2 --no-install-recommends

COPY index.html /var/www/html/

FROM httpd:2.4.48-slim

COPY --from=builder --chown=www-data:www-data /var/www/html/ /usr/local/apache2/htdocs/

EXPOSE 80

CMD ["httpd", "-f", "/usr/local/apache2/conf/httpd.conf"]
