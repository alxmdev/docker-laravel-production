# Base PHP 8.3 image com FPM
FROM php:8.3-fpm

# Instação de dependências
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    git \
    curl \
    libzip-dev \
    libcurl4-openssl-dev \
    libffi-dev \
    libpng-dev \
    libgmp-dev \
    libicu-dev \
    libonig-dev \
    libsodium-dev

RUN docker-php-ext-install curl ffi ftp fileinfo gd gettext gmp intl mbstring sockets mysqli pdo pdo_mysql session sodium zip

# Instalação de Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# adiciona o entrypoint
#COPY docker-entrypoint.sh /usr/local/bin/
#RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Seta diretório de trabalho
WORKDIR /var/www/html

# Usa o entrypoint
#ENTRYPOINT ["docker-entrypoint.sh"]

# Permissões de escrita nos arquivos da aplicação
CMD ["sh", "-c", "chown -R www-data:www-data /var/www && chmod -R o+w /var/www/html/app && composer install && php-fpm"]