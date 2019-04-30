FROM alpine:3.9
MAINTAINER Sooraj Rughooputh <soorajrug@googlemail.com>

RUN apk add \
        --no-cache \
        --update \
        apache2 \
        composer \
        nano \
        bash \
        curl \
        php7 \
        php7-apache2 \
        php7-curl \
        php7-dom \
        php7-mbstring \
        php7-pdo_mysql \
        php7-session \
        php7-sockets \
        php7-tokenizer \
        php7-xml \
        php7-xmlwriter \
    && mkdir -p /run/apache2 \
    && ln -sf /dev/stdout /var/log/apache2/access.log \
    && ln -sf /dev/stderr /var/log/apache2/error.log

WORKDIR /app

COPY application/composer.* ./
RUN composer install -n --no-autoloader --no-scripts --no-progress --no-suggest

COPY docker/web.sh /run/web.sh
RUN chmod 755 /run/web.sh

COPY application .
RUN composer dump-autoload -o -n && \
    chown -R apache:apache /app/storage

EXPOSE 80

CMD /run/web.sh
