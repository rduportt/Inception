FROM debian:bookworm

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y \
wget \
curl \
php8.2 \
php8.2-fpm \
php8.2-mysql \
mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY conf/auto_config.sh /auto_config.sh
RUN chmod +x /auto_config.sh

EXPOSE 9000

CMD ["/auto_config.sh"]
