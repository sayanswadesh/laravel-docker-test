FROM php:8.0 as php

RUN apt-get update -y
RUN apt-get install -y unzip libpq-dev libcurl4-gnutls-dev
RUN docker-php-ext-install pdo pdo_mysql bcmath

WORKDIR /var/www/html
COPY . .

COPY --from=composer:2.3.5 /usr/bin/composer /usr/bin/composer
ENV PORT = 8000
ENTRYPOINT [ "Docker/entrypoint.sh" ]
