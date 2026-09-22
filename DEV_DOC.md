# DEV_DOC.md - Inception

## 1. Prerequisites

- VM with Docker + Docker Compose + make installed
- Sudo access (creating data directories, editing /etc/hosts)
- Add to /etc/hosts: <local_ip> rduport.42.fr

## 2. Setup

Clone the repo, then create:

srcs/.env (config, no passwords):
DOMAIN_NAME=rduport.42.fr
SQL_DATABASE=...
SQL_USER=...
WP_TITLE=...
WP_ADMIN_USER=...
WP_ADMIN_EMAIL=...
WP_USER=...
WP_USER_EMAIL=...

secrets/ at the project root (one password per file):
db_password.txt
db_root_password.txt
wp_admin_password.txt
wp_user_password.txt

These files are mounted as Docker secrets, never included in the Dockerfiles.

## 3. Build and launch

make up      -> builds the images + starts the 3 containers
make down    -> stops and removes the containers
make logs    -> live logs
make clean   -> down + removes the data in /home/rduport/data

Full rebuild: make clean then make up

The 3 images (nginx, wordpress, mariadb) are built locally from the
Dockerfiles in srcs/requirements/, no pulling of pre-built images.

## 4. Useful commands

Container status:
docker compose -f srcs/docker-compose.yml ps

Shell into a container:
docker exec -it nginx sh
docker exec -it wordpress sh
docker exec -it mariadb sh

Logs for a single service:
docker logs -f nginx

Volumes:
docker volume ls
docker volume inspect <volume_name>

Network:
docker network ls
docker network inspect <network_name>

## 5. Storage and persistence

2 named Docker volumes (no bind mounts):
mariadb_data   -> MariaDB data
wordpress_data -> WordPress files

Stored on the host at:
/home/rduport/data/mariadb
/home/rduport/data/wordpress

Data survives make down and an image rebuild.
Only make clean erases these directories.
