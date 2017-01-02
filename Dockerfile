FROM php:7

# Packages
RUN apt-get update -yqq
RUN apt-get install \
            build-essential \
            git \
            libcurl4-gnutls-dev \
            libicu-dev \
            libmcrypt-dev \
            libvpx-dev \
            libjpeg-dev \
            libpng-dev \
            libxpm-dev \
            zlib1g-dev \
            libfreetype6-dev \
            libxml2-dev \
            libexpat1-dev \
            libbz2-dev \
            libgmp3-dev \
            libldap2-dev \
            libpq-dev \
            unixodbc-dev \
            libsqlite3-dev \
            libaspell-dev \
            libsnmp-dev \
            libpcre3-dev \
            libtidy-dev \
            ruby \
            ruby-dev \
            -yqq

# Clean  up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# PHP 
RUN docker-php-ext-install \
            mbstring \
            mcrypt \
            pdo_mysql \
            curl \
            json \
            intl \
            gd \
            xml \
            zip \
            bz2 \
            opcache

# XDEBUG
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

# composer
RUN curl --location --output /usr/local/bin/composer https://getcomposer.org/composer.phar && chmod +x /usr/local/bin/composer

# Mailcatcher
RUN gem install mailcatcher --no-ri --no-rdoc
