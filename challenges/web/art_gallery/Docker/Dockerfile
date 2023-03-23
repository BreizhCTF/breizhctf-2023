FROM alpine:3.17.0

ENV TIMEZONE Europe/Paris

RUN apk add --no-cache curl php apache2 apache2-utils \
    php-apache2 \
    php-session \
    php-mysqli \
    composer \
    sudo \
    shadow

RUN sed -i "s#^DocumentRoot \".*#DocumentRoot \"/challenge\"#g" /etc/apache2/httpd.conf && \
    sed -i "s#/var/www/localhost/htdocs#/challenge#" /etc/apache2/httpd.conf && \
    printf "\n<Directory \"/challenge\">\n\tAllowOverride All\nOptions -Indexes\n</Directory>\n" >> /etc/apache2/httpd.conf && \
    printf "ErrorLog /dev/stderr\nTransferLog /dev/stdout\n" >> /etc/apache2/httpd.conf

EXPOSE 80

COPY flag.txt /flag.txt
RUN chmod 444 /flag.txt
# PHP requirements for Typo3

RUN apk add php-pdo php-json php-session php-xml php-simplexml php-dom php-tokenizer php-mbstring php-intl php-fileinfo php-gd mysql-client mercurial
RUN sed -i 's/display_errors = Off/display_errors = On/g' /etc/php81/php.ini
RUN sed -i 's/max_execution_time = 30/max_execution_time = 240/g' /etc/php81/php.ini
RUN sed -i 's/\;max_input_vars = 1000/max_input_vars = 1500/g' /etc/php81/php.ini
RUN sed -i "s#/challenge#/challenge/public#" /etc/apache2/httpd.conf
RUN sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/httpd.conf
RUN sed -i "s,#LoadModule expires_module modules/mod_expires.so,LoadModule expires_module modules/mod_expires.so,g" /etc/apache2/httpd.conf
RUN sed -i "s,#LoadModule rewrite_module modules/mod_rewrite.so,LoadModule rewrite_module modules/mod_rewrite.so,g" /etc/apache2/httpd.conf

WORKDIR /
RUN composer create-project typo3/cms-base-distribution:^11 challenge

WORKDIR /challenge
RUN composer require bk2k/bootstrap-package
COPY htaccess .
COPY app /challenge/app
COPY sql /challenge/sql
RUN chown -R apache:apache /challenge
RUN chmod +w /challenge
COPY build.sh .
RUN chmod +x build.sh

RUN usermod -d /challenge apache

CMD ["sh", "-c", "sudo -EHu apache /challenge/build.sh ; httpd -D FOREGROUND"]
