FROM php:8.1-apache
# RUN mkdir /tmp/www
# RUN mkdir /tmp/www/html
# COPY . /tmp/www/html/
COPY . /var/www/html/

ENV APACHE_DOCUMENT_ROOT /tmp/www/html/

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/nginx/conf.d/server.conf
# RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN cp -r /var/www/html/. /tmp/www/html