FROM debian:bookworm
USER root
RUN apt update -y && apt upgrade -y && apt install nginx vim curl openssl -y && mkdir -p /etc/nginx/ssl && mkdir -p /var/www/html


RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=Paris/L=IDF/0=42 School/OU=42/CN=rduport.42.fr/UID=rduport" \
	-days 365

RUN mkdir -p /var/run/nginx
RUN chmod 755 /var/www/html;
RUN chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ] 
