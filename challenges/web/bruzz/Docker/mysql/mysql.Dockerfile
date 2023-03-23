FROM mariadb:latest

COPY db.sql /docker-entrypoint-initdb.d/db.sql