FROM php:apache
EXPOSE 80
COPY ./php /app
WORKDIR /app/
RUN apt-get update && apt-get install -y git
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN composer install -v
RUN rm -r /var/www/html && ln -s /app/public /var/www/html