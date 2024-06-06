FROM ubuntu:20.04

WORKDIR /var/www/html

ENV DOCUMENT_ROOT=/var/www/html
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apache2 --no-install-recommends

COPY index.html $DOCUMENT_ROOT/

EXPOSE 80

CMD ["apache2", "-f", "/etc/apache2/apache2.conf"]
