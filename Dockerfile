FROM ubuntu:20.04 AS builder

RUN apt-get update && apt-get install -y apache2 --no-install-recommends

COPY index.html /var/www/html/

FROM httpd:2.4.48

COPY --from=builder /var/www/html /var/www/html/

EXPOSE 80

CMD ["httpd", "-f", "/usr/local/apache2/conf/httpd.conf"]
