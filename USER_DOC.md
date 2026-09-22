# User Doc - Inception

## Services
- NGINX: HTTPS entry point (443), the only open port
- WordPress + php-fpm: the site
- MariaDB: the database

Persistent volumes (data):
/home/rduport/data/wordpress
/home/rduport/data/mariadb

## Start / stop
- make up     -> builds + starts the containers
- make down   -> stops the containers
- make logs   -> view live logs
- make clean  -> down + removes the data in /home/rduport/data
                (images remain, the site/DB are erased)

Automatic restart on crash, nothing to do manually.

## Access
- Site      : https://rduport.42.fr
- Admin     : https://rduport.42.fr/wp-admin
(self-signed certificate: browser warning is normal)

## Passwords / credentials
- srcs/.env         -> usernames, domain, DB name (non-sensitive)
- secrets/*.txt     -> passwords:
  - db_password.txt         (MariaDB user)
  - db_root_password.txt    (MariaDB root)
  - wp_admin_password.txt   (WordPress admin)
  - wp_user_password.txt    (2nd WordPress user)

WordPress admin/user accounts are defined by WP_ADMIN_USER / WP_USER in .env.
Never commit .env or secrets/ (gitignore).

## Checking that it works
- docker compose -f srcs/docker-compose.yml ps   -> all "Up"
- curl -k https://rduport.42.fr                   -> WordPress page
- make logs                                        -> no repeated errors
- docker volume ls                                 -> both volumes exist

If it's stuck: make down -> fix -> make up
To start fresh: make clean -> make up
