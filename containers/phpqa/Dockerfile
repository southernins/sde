FROM jakzal/phpqa:php7.4



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
    unzip \
    wkhtmltopdf \
    autoconf \
    g++ \
    make \
    pkg-config

RUN ln -s /usr/bin/wkhtmltopdf  /usr/local/bin/wkhtmltopdf

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql gd zip mbstring exif pcntl bcmath gd zip

RUN yes | pecl install xdebug && \
    echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.mode=coverage" >> /usr/local/etc/php/conf.d/xdebug.ini

## RUN docker-php-ext-enable xdebug


# Clear cache
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*