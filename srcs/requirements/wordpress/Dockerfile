FROM debian:bookworm

EXPOSE 9000

RUN apt-get update && apt-get install -y php8.2 php8.2-fpm php8.2-mysql php8.2-cli curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp


RUN mkdir -p /var/www/html

RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

COPY tools/script.sh .
RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh" ]

CMD ["php-fpm8.2" , "-F"]