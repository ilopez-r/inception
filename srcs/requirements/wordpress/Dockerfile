FROM debian:bullseye

RUN set -eux; \
    apt-get update; \
    mkdir -p /var/www/html && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates \
    php \
    php-fpm \
    php-mysql \
    wget \
    tar

COPY /tools/init.sh .

RUN chmod +x init.sh

CMD ["sh", "init.sh"]
