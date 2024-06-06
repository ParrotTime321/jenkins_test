FROM ubuntu:20.04 AS builder

RUN apt-get update && apt-get install -y apache2 --no-install-recommends

COPY index.html /var/www/html/

FROM apache:2.4.48

COPY --from=builder /var/www/html /var/www/html/

EXPOSE 80

CMD ["apache2", "-f", "/etc/apache2/apache2.conf"]
