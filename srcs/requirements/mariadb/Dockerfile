FROM debian:bookworm

RUN apt update -y && apt upgrade -y
RUN apt-get install mariadb-server -y && rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/init_db.sh /init_db.sh
RUN chmod +x /init_db.sh

EXPOSE 3306
#At the beginning of the run
CMD ["/init_db.sh"]
