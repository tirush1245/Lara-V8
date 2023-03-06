FROM php:8.1-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libonig-dev \
    libpq-dev \
    libicu-dev \
    libxml2-dev \
    unzip \
    git \
    curl \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install zip \
    && docker-php-ext-install intl \
    && docker-php-ext-install opcache \
    && docker-php-ext-install exif \
    && pecl install apcu \
    && docker-php-ext-enable apcu

# Copy application code
COPY . /var/www/html

# Set environment variables
ENV APP_ENV=production
ENV DB_HOST=localhost
ENV DB_PORT=3306
ENV DB_DATABASE=laravel
ENV DB_USERNAME=laravel
ENV DB_PASSWORD=tiru@123

# Expose ports
EXPOSE 80

# Set work directory
WORKDIR /var/www/html

# Run commands
RUN composer install --no-dev --no-interaction --optimize-autoloader
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=80"]
