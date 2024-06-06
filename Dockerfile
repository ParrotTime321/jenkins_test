FROM ubuntu:20.04

WORKDIR /var/www/html  # Set working directory

ENV DOCUMENT_ROOT=/var/www/html  # Define document root environment variable

RUN apt-get update && apt-get install -y apache2 --no-install-recommends

COPY index.html $DOCUMENT_ROOT/  # Use environment variable in COPY

EXPOSE 80

CMD ["apache2", "-f", "/etc/apache2/apache2.conf"]
