FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y dumb-init curl less php-fpm php-mysql php-mysqli mariadb-client
RUN apt-get clean -y

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp \
	&& chmod +x /usr/local/bin/wp

RUN mkdir -p /var/www/html/wordpress

COPY ./tools/setup.sh /tmp/

COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD ["/bin/bash", "/tmp/setup.sh" ]
