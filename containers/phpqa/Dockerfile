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

# mbstring exif pcntl bcmath gd zip



# Clear cache
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*