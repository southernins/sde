#FROM node:14 AS node
FROM composer:2 AS composer
FROM php:8.3-fpm

# Arguments defined in docker-compose.yml
ARG user=southerndev
ARG uid=1000

# Install Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY ./php/custom.ini /usr/local/etc/php/conf.d/custom.ini
COPY ./php-fpm/custom.conf /usr/local/etc/php-fpm.d/custom.conf

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# Install system dependencies
RUN apt-get update \
    && apt-get install -y \
    git \
    curl \
    wget \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    gpg \
    unzip


# Install WKHTMLTOPDF pdf converter
RUN apt-get install -y wkhtmltopdf
RUN ln -s /usr/bin/wkhtmltopdf  /usr/local/bin/wkhtmltopdf


# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.mode=debug,coverage" >> /usr/local/etc/php/conf.d/xdebug.ini

ARG PHP_INFECTION_VERSION='0.27.0'

RUN mkdir -p /usr/local/infection

RUN wget https://github.com/infection/infection/releases/download/$PHP_INFECTION_VERSION/infection.phar && \
#    wget https://github.com/infection/infection/releases/download/$PHP_INFECTION_VERSION/infection.phar.asc && \
#    gpg --recv-keys C6D76C329EBADE2FB9C458CFC5095986493B4AA0 && \
#    gpg --with-fingerprint --verify /usr/local/infection/infection.phar.asc /usr/local/infection/infection.phar && \
    chmod +x infection.phar && \
    mv infection.phar /usr/local/bin/infection

# nvm install node will install the following version of node
ARG NODE_VERSION='20.6.1'
ARG NVM_DIR="/usr/local/nvm"
ARG NVM_VERSION='0.39.5'

# Install Node/NPM, using NVM
RUN mkdir -p $NVM_DIR
RUN curl https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm use $NODE_VERSION

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH


# Clear cache
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

## Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer \
    && chown -R $user:$user /home/$user


# Set working directory
WORKDIR /var/www

USER $user
#USER 1000

# Pre-flight tests for container
RUN node -v
RUN npm -v
RUN composer -v
RUN php -v