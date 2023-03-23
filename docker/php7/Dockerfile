# Installation minimal de alpine avec apache2 et php7
# Composer est installé pour pouvoir installer les libs facilement
# En cas d'extensions php manquantes, utilisez apk
# Apache tourne dans son propre utilisateur, ce qui n'empêche pas de faire un chall avec privesc
# Le dossier racine du serveur web est dans /challenge

FROM alpine:latest

ENV TIMEZONE Europe/Paris

RUN apk add --no-cache curl php apache2 apache2-utils \
    php-apache2 \
    php-session \
    php-mysqli \
    composer

RUN mkdir /challenge && \
    chown apache:apache /challenge && \
    sed -i "s#^DocumentRoot \".*#DocumentRoot \"/challenge\"#g" /etc/apache2/httpd.conf && \
    sed -i "s#/var/www/localhost/htdocs#/challenge#" /etc/apache2/httpd.conf && \
    printf "\n<Directory \"/challenge\">\n\tAllowOverride All\nOptions -Indexes\n</Directory>\n" >> /etc/apache2/httpd.conf && \
    printf "ErrorLog /dev/stderr\nTransferLog /dev/stdout\n" >> /etc/apache2/httpd.conf

WORKDIR /challenge/

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]
