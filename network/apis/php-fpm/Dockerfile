FROM php:7.1.3-fpm

MAINTAINER YoProgrammer <yuttasakcom@gmail.com>

RUN apt-get update &&\
  apt-get install -y git php-pear libmcrypt-dev libssl-dev zlib1g-dev &&\
  docker-php-ext-install mcrypt

RUN pecl install mongodb redis &&\
  docker-php-ext-install pdo pdo_mysql &&\
  docker-php-ext-enable mongodb &&\
  docker-php-ext-enable redis

RUN curl -sS https://getcomposer.org/installer | php -- \
--install-dir=/usr/bin --filename=composer
