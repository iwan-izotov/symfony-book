#!/bin/bash

# Install dependencies
apt-get update -y && apt-get install -y \
    apt-utils \
    g++ \
    build-essential \
    libbz2-dev \
    libedit-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmagickwand-dev \
    libmemcached-dev \
    libssl-dev \
    libreadline-dev \
    libzip-dev \
    libpng-dev \
    libcurl3-dev \
    locales \
    wget \
    unzip \
    zlib1g-dev \
    vim \
    git \
    mc \
    nano \
    mariadb-client \
    openssl \
    zip \
    curl \
    ssh \
    imagemagick \
    libssh2-1-dev \
    libssh2-1

# Install extensions
docker-php-ext-configure gd \
    --with-freetype-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
  && docker-php-ext-install -j$(nproc) gd \
  && docker-php-ext-configure intl \
  && docker-php-ext-install -j$(nproc) intl \
  && docker-php-ext-install -j$(nproc) \
     bcmath \
     bz2 \
     calendar \
     exif \
     gettext \
     mysqli \
     opcache \
     pdo_mysql \
     soap \
     sockets \
     xmlrpc \
     curl \
     xml \
     exif \
     pcntl \
     mbstring \
  && docker-php-ext-configure zip --with-libzip \
  && docker-php-ext-install zip \
  && pecl install xdebug-2.7.2 && docker-php-ext-enable xdebug