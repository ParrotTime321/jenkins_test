FROM ubuntu:20.04 AS builder

RUN apt-get update && apt-get install -y apache2 --no-install-recommends

COPY index.html /var/www/html/

FROM httpd:2.4.48-alpine  # Змінено базовий образ

COPY --from=builder /var/www/html /usr/local/apache2/htdocs/  # Змінено шлях копіювання

EXPOSE 80

CMD ["httpd", "-f", "/usr/local/apache2/conf/httpd.conf"]  # Змінено команду запуску Apache
