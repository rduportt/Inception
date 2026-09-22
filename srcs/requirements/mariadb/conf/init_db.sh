#!/bin/bash

SQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)
SQL_PASSWORD=$(cat /run/secrets/db_password)

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

if [ ! -f /var/lib/mysql/.init_done ]; then

	if [ ! -d /var/lib/mysql/mysql ]; then
		mysql_install_db --user=mysql --datadir=/var/lib/mysql
	fi
	
	service mariadb start;

	mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
	mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
	mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
	mysql -e "FLUSH PRIVILEGES;"

	mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
fi

exec mysqld_safe
