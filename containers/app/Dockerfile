#FROM node:14 AS node
FROM composer:2 AS composer
FROM php:7.4-fpm

# Arguments defined in docker-compose.yml
ARG user=southerndev
ARG uid=1000

# Install Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY ./php/custom.ini /usr/local/etc/php/conf.d/custom.ini

# Install system dependencies
RUN apt-get update && \
    apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    unzip

# Install Node/Npm
RUN apt-get install -y --no-install-recommends gnupg && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get update && \
    apt-get install -y --no-install-recommends nodejs

RUN apt-get install -y wkhtmltopdf
RUN ln -s /usr/bin/wkhtmltopdf  /usr/local/bin/wkhtmltopdf

#WORKDIR /usr/local/wkhtmltox
#
#RUN curl -LO https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
#
#RUN tar -Jxvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
#
#RUN ln -s /usr/local/wkhtmltox/wkhtmltox/bin/wkhtmltopdf  /usr/local/bin/wkhtmltopdf


# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

RUN yes | pecl install xdebug && \
    echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.mode=coverage" >> /usr/local/etc/php/conf.d/xdebug.ini

# Clear cache
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*



## Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Set working directory
WORKDIR /var/www

USER $user
#USER 1000